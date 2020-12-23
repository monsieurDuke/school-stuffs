#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o MAIN RUN (BACKGROUND)
#--------------------------
while :
do
	if [[ ! -e "log/.md5" ]]
	then
		touch "log/.md5"
	fi

	date_year=$(date +'%Y')	
	file_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6 | tr -s ' ' '.')
	regx_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6)	
	grep -a "UNCLE" /var/log/syslog | grep -a "$regx_prefix" > "log/$file_prefix.$date_year.log"

	curr_md5=$(md5sum "log/$file_prefix.$date_year.log" | cut -d ' ' -f 1)
	load_md5=$(cat "log/.md5")	

	if [[ $curr_md5 != $load_md5 ]]
	then
		cat /dev/null > "log/$file_prefix.$date_year.db"
		echo $curr_md5 > "log/.md5"
		printf "%-41s | %-17s | %-17s | %-8s | %-6s\n" "MAC ADDR" "SOURCE ADDR" "DESTINATION ADDR" "PROTOCOL" "SEQ" >> "log/$file_prefix.$date_year.db"
		echo    "--------------------------------------------------------------------------------------------------------------" >> "log/$file_prefix.$date_year.db"

		IFS=$'\n'
		raw_mac=$(cat "log/$file_prefix.$date_year.log" | cut -c 78- | cut -d ' ' -f 1 | sort | uniq -d | cut -d '=' -f 2)
		raw_ptc=$(cat "log/$file_prefix.$date_year.log" | cut -c 78- | cut -d ' ' -f 9 | sort | uniq -d | cut -d '=' -f 2)
		arr_mac=("$raw_mac")
		for i_mac in ${arr_mac[@]}
		do
			raw_src=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | cut -c 78- | cut -d ' ' -f 2 | sort | uniq -d | cut -d '=' -f 2)
			arr_src=("$raw_src")
			for i_src in ${arr_src[@]}
			do
				timeinc=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | grep "$i_src" | wc -l)
				raw_dst=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | grep "$i_src" | cut -c 78- | cut -d ' ' -f 3 | sort | uniq -d | cut -d '=' -f 2)
				arr_dst=("$raw_dst")
				for i_dst in ${arr_dst[@]}
				do
					printf "%-41s | %-17s | %-17s | %-8s | %-6s\n" "$i_mac" "$i_src" "$i_dst" "$raw_ptc" "$timeinc ATTEMPT(S)" >> "log/$file_prefix.$date_year.db"
				done
			done
		done
	fi
done

## COBA FORMATTING