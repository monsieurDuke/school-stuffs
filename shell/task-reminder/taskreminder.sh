#!/bin/bash
# ---------
# [ OK ] | ECEF | 2018-11-30 | H-10 | ENG : Buat paragraf tengang Produk
# [ -- ] | 12VG | 2018-11-30 | H-10 | WSR : Buat Paragraf Produk Bahasa Inggris
# ENG - FRS - SHL - SQL - RSW - WSR - DRS - CRY
# vv | bubble sort 
# vv | kalau sukses, replace line dengan status -- jadi OK
# -- | H-7 warna kuning, H-3 warna merah, > H-7 warna biru, OK warna ijo
# -- | update interface menu, dengan pilihan subject

subj_tsk=("ENG" "FRS" "WSC" "R&S" "SQL" "SHL" "DRS" "CRY")
log_path="saved-task.log"
dmp_path="dumped-task.log"
if [[ ! -e "$log_path" || ! -e "$dmp_path" ]]
then
	touch "$log_path"
	touch "$dmp_path"
	printf "creating log file ...\n---\n"
fi

get_date=$(date +'%F')
echo "$get_date"

add_task() {
	read -p "add task subject  : " tsk_subj
	for i in ${subj_tsk[@]}
	do
		if [[ $tsk_subj == $i ]]
		then
			read -p "add task descs    : " tsk_desc
			read -p "add task due date : " tsk_due
			getrand_str=$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w 5 | head -n 1)					
			printf "$tsk_due#$tsk_subj#$tsk_desc#--#$getrand_str\n" >> "$log_path"
		fi
	done
}

list_task() {
	get_date=$(date +'%F')
	sorted_tsk=$(sort $log_path)
	printf "$sorted_tsk\n" > "$log_path"
	while IFS= read -r get_line
	do
		if [ ! -z "$get_line" ]
		then
			IFS="#"
			read -a get_details <<< "$get_line"
			tsk_range=$(( ($(date -d ${get_details[0]} +%s) - $(date -d $get_date +%s)) / 86400 ))
			str_ctr_no="$ctr_no"
			str_tsk_range="$tsk_range"		
			if [[ "$ctr_no" -lt 10 ]]
			then
				str_ctr_no="0$str_ctr_no"
			fi	
			if [[ "$tsk_range" -lt 10 ]]
			then
				str_tsk_range="0$str_tsk_range"
			fi					
			printf "[ %s ] | %s | %s | %-4s | %s : %s\n" "${get_details[3]}" "${get_details[4]}" "${get_details[0]}" "H-$str_tsk_range" "${get_details[1]}" "${get_details[2]}"
		fi
	done < "$log_path"
}

remove_task() {
	read -p "please specify the code : " tsk_rm
	while IFS= read -r get_line
	do
		if [ ! -z "$get_line" ]
		then		
			IFS="#"
			read -a get_details <<< "$get_line"
			echo "${get_details[@]} == $tsk_upd == $get_line"		
			if [[ ${get_details[4]} -eq "$tsk_rm" ]]
			then
				rest_tsk=$(cat "$log_path" | grep -v "$tsk_rm")
				dump_tsk=$(cat "$log_path" | grep -i "$tsk_rm")				
				printf "$rest_tsk\n" > "$log_path"			
				printf "$dump_tsk\n" >> "$dmp_path"						
				break
			fi
		fi
	done < "$log_path"	
}

update_task() {
	read -p "please specify the code : " tsk_upd
	read -p "check or uncheck : " check_opt				
	while IFS= read -r get_line
	do
		if [ ! -z "$get_line" ]
		then
			IFS="#"
			read -a get_details <<< "$get_line"
			if [[ ${get_details[4]} == "$tsk_upd" ]]
			then
				case $check_opt in
					"check")
						sed -i "s/$get_line/${get_details[0]}#${get_details[1]}#${get_details[2]}#OK#${get_details[4]}/" $log_path
						;;
					"uncheck")
						sed -i "s/$get_line/${get_details[0]}#${get_details[1]}#${get_details[2]}#--#${get_details[4]}/" $log_path
						;;					
				esac
				break
			fi
		fi
	done < "$log_path"		
}

reset_task() {
	dump_tsk=$(cat $log_path)
	printf "$dump_tsk\n" >> "$dmp_path"						
	truncate -s 0 "$log_path"	
}

main() {
	while :
	do
		read -p "add action (add/list/remove/update/reset) : " act
		case $act in
			"add")
				add_task
				;;
			"list")
				list_task
				;;
			"remove")
				remove_task
				;;			
			"update")
				update-task
				;;
			"reset")
				reset_task
				;;
		esac
	done
}

# ---------
main



