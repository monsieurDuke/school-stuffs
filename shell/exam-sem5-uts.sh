#!/bin/bash
# --------------
# Buat program yang menghapus file disebuah direktory jika file itu mengandung bad karakter

regex() {

	ls -F
	get_list=$(ls)
	rgx_key=" (\\[+{;\"=?<>&*|$]/@#%)"
	echo "$get_list" > ".list.tmp"
	catch_file=""
	disp_file=""
	ctr=0

	while IFS= read -r get_line # read berdasarkan line dari file
	do
		for i in `seq 1 "${#rgx_key}"`
		do
			rgx_temp="${rgx_key:i:1}"
			if [[ "$rgx_temp" && "$get_line" == *"$rgx_temp"* ]]
			then
				catch_file+="$get_line "
				disp_file+="$get_line\\n"
				ctr=$((++ctr))
			fi
		done
	done < ".list.tmp"	

	echo -e "--\\nFILE FOUND ($ctr)\\n--\\n$disp_file"
	read -p "DELETE SELECTED FILE ? " ans
	if [[ "$ans" ]]
	then
		IFS=" "
		read -a arr_file <<< "$catch_file"
		for i in "${arr_file[@]}"
		do		
			rm "$i"
		done		
		echo "--"
		ls -F
	fi


}

rootcheck() {

	hostnm=$(hostname)
	if [[ "$UID" -eq "0" ]]
	then

		echo -e "PROCEEDING NMAP AS : $USER@$hostnm ($UID)\\n--"		
		sudo nmap -sV -O 0.0.0.0
	else
		echo -e "DETECTING NORMAL USER AS : $USER@$hostnm ($UID)"
		echo -e "NMAP WITH OS SCAN REQUIRES ROOT PRIVILEGES, QUITTING ..."
		exit 1
	fi

}

uppertest() {

	read -p "ENTER FULL NAME : " name_lowr
	read -p "ENTER DOMICILE  : " domi_lowr

	IFS=" "	
	read -a get_name <<< "$name_lowr"
	read -a get_domi <<< "$domi_lowr"	
	name_upr=""
	domi_upr=""
	for i in "${get_name[@]}"
	do		
		name_upr+="${i^} "
	done
	for i in "${get_domi[@]}"
	do		
		domi_upr+="${i^} "
	done	
	echo "$name_upr" > .name.tmp
	name_nick=$(cut -d " " -f 3 ".name.tmp")	

	echo -e "--\\nNAME : $name_upr($name_nick)\\nDOMI : $domi_upr"
}

check_net() {
	get_route=$(route -n)
	get_netst=$(netstat -lpta)
	get_procs=$(ps axjf)

	echo -e "RUNNING NETWORK AND PROCESS DETAIL ..\\n--"
	echo -e "$get_route\\n--\\n$get_netst\\n--\\n$get_procs"

}

backg() {
	for i in `seq 1 20`
	do 
		get_i="$i"
		if [[ $get_i -ge 11 ]]
		then
			exec echo -n "$get_i " &
			wait $!
			continue
		fi
		echo -n "$get_i "
	done
	echo ""
}

autoexit() {
	while :
	do
		read -p "QUIT PROGRAM ? " ans
		if [[ "$ans" == "y" ]]
		then
			echo "PROGRAM IS QUITTING .."
			exit 0
		fi
		kill $$
	done
}

login() {
	passwd="okok"
	read -p "ENTER USERNAME : " usrname
	read -sp "ENTER PASSWORD : " pssword
	echo ""
	if [[ "$usrname" == "$USER" && "$pssword" == "$passwd" ]]
	then
		echo "PROCEED TO CONTINUE ..."
		echo "WELCOME BACK, $usrname !"
		exit 0
	fi
	echo "SYSTEM DOESNT RECOGNIZE USER AS $usrname .."
	echo "PROGRAM IS QUITTING ..."
	exit 1

}


# --------------
login