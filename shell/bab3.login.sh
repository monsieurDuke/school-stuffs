#!/bin/bash
# ----------

dir_path="log"
file_path="$dir_path/account.lst"
account_found=FALSE
account_match=FALSE

login() {
	if [[ ! -d "$dir_path" ]] # kalau folder log/ tidak ada
	then
		mkdir $dir_path
		touch $file_path	
		echo "[MISS]: missing $dir_path directory, creating one ..."; sleep 0.5	
		echo "[MISS]: missing $file_path file, creating one ..."; sleep 0.5	
	elif [[ ! -e "$file_path" ]] # kalau file tidak ada
	then
		touch $file_path
		echo "[STATUS] : missing log/account.lst, creating one ..."; sleep 0.5	
	fi	

	count_src=$(ls $dir_path/* | wc -l)

	echo "[NICE]: intiating new timestamp ..."; sleep 0.5
	echo "[NICE]: collecting dependencies ($count_src) ..."; sleep 0.5
	echo "[NICE]: deploying $0 ..."; sleep 1.5
	echo "--------------------------------------------"

	read -p  "username : " username
	read -sp "password : " password
	printf "\n--------------------------------------------\n"

	while IFS= read -r get_line
	do
		IFS="#"
		read -a get_account <<< "$get_line"
		if [[ $username == ${get_account[0]} ]]
		then
			account_match=TRUE
			if [[ $password == ${get_account[1]} ]]
			then
				account_found=TRUE
				get_date=$(date +'%d-%m-%y %T')								
				sed -i "s/$get_line/${get_account[0]}#${get_account[1]}#$get_date/" $file_path
				echo "[NICE]: logggin in successfully, $username !"; sleep 1.5
				#./bab3.menu.sh "${get_account[0]}" "${get_account[1]}" "${get_account[2]}"
				break
				# ... masuk ke home
			fi
		fi				
	done < $file_path

	if [[ "$account_found" == "FALSE" ]]
	then
		if [[ "$account_match" == "FALSE" ]] 
		then
			echo "[INFO]: detecting new account ... "
			read -p "[INFO]: proceed to create an account as $username (y/n) ? " answ
			if [[ "$answ" == "y" ]]
			then
				get_date=$(date +'%d-%m-%y %T')								
				mkdir "$dir_path/$username"
				printf "$username#$password#$get_date\n" >> $file_path
				printf "[NICE]: create account successfully! ...\n"; sleep 0.5	
				echo "[NICE]: logggin in successfully, $username !"; sleep 5.5				
				#./bab3.menu.sh "$username" "$password" "$get_date"				
				account_found=TRUE
				account_match=TRUE
				# ... masuk ke home
			else
				echo "[MISS]: aborting the procedure ..."; sleep 1.5
				echo "[MISS]: redirecting to login prompt ..."; sleep 2.5
			fi			
		else
			echo "[MISS]: the account is found, but the password doesn't match ..."; sleep 3
			echo "[MISS]: redirecting to login prompt ..."; sleep 2.5
		fi
	fi

	if [[ "$account_match" == "TRUE" && "$account_found" == "TRUE" ]]
	then
		user_path="$dir_path/$username"
		clear
		while [[ "TRUE" == "TRUE" ]]
		do
			echo "USER: $username | $get_date"
			echo "--------------------------------------------"
			echo "[1] CREATE FILE      -       RENAME FILE [5]"
			echo "[2] REMOVE FILE      -    LIST DIRECTORY [6]"	
			echo "[3] READ FILE        -      CLEAR SCREEN [7]"		
			echo "[4] APPEND FILE      -           LOG-OUT [8]"			
			echo "--------------------------------------------"		
			while [[ "TRUE" == "TRUE" ]]
			do
				read -p ">> " new_ans
				case $new_ans in
					"1")
						echo "--------------------------------------------"		
						read -p "NEW FILENAME : " filename								
						if [[ ! -e "$user_path/$filename" ]]
						then
							touch "$user_path/$filename"
							printf "$filename have been created!\n"							
							echo "--------------------------------------------"															
							continue
						fi
						printf "$filename is already exits!\n"
						echo "--------------------------------------------"								
						;;
					"2")
						echo "--------------------------------------------"
						read -p "FILENAME     : " filename
						if [[ -e "$user_path/$filename" ]]
						then
							rm "$user_path/$filename"
							printf "$filename have been deleted!\n"							
							echo "--------------------------------------------"															
							continue
						fi
						printf "$filename is not found!\n"
						echo "--------------------------------------------"								
						;;						
					"3")
						echo "--------------------------------------------"		
						read -p "FILENAME     : " filename
						if [[ -e "$user_path/$filename" ]]
						then
							echo "--"
							cat "$user_path/$filename"
							echo "--"
							echo "--------------------------------------------"															
							continue
						fi
						printf "$filename is not found!\n"
						echo "--------------------------------------------"								
						;;
					"4")
						echo "--------------------------------------------"		
						read -p "FILENAME     : " filename
						if [[ -e "$user_path/$filename" ]]
						then
							read -p "INSERT LINE  : " content
							echo "$content" >> "$user_path/$filename"
							echo "--------------------------------------------"															
							continue
						fi
						printf "$filename is not found!\n"
						echo "--------------------------------------------"								
						;;
					"5")
						echo "--------------------------------------------"		
						read -p "OLD FILENAME : " filename														
						if [[ -e "$user_path/$filename" ]]
						then
							read -p "NEW FILENAME : " new_filename
							mv "$user_path/$filename" "$user_path/$new_filename"
							printf "$filename have been renamed to $new_filename!\n"														
							echo "--------------------------------------------"															
							continue
						fi
						printf "$filename is not found!\n"
						echo "--------------------------------------------"								
						;;												
					"6")
						echo "--------------------------------------------"		
						arr_list=("$user_path/*")				
						for i in ${arr_list[@]}
						do
							echo "- $i"
						done
						echo "--------------------------------------------"								
						;;						
					"7")
						clear
						break
						;;
					"8")
						echo "--------------------------------------------"								
						echo "[NICE]: redirecting to login prompt ..."; sleep 2.5
						./bab3.login.sh
						;;						
				esac
			done	
		done	
	fi
}


# Main Method
while [[ "TRUE" == "TRUE" ]]
do
	clear
	login
done
