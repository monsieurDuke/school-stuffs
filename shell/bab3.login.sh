#!/bin/bash
# ----------
# buat login sistem, pengecekan berdasarkan filetext
# kalau login salah, ada opsi untuk buat akun baru
# setelah login selesai, user buat folder dengan namanya, isinya file nya sendiri
# 1. setiap buat akun, buat dir dengan nama user
# 2. setiap login kelar, ubah timestampnya di line yang sama
# 3. migrasi code userlogin ke sini



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
	get_date=$(date +'%d/%m/%y %T')

	echo "[NICE]: intiating timestamp $get_date ..."; sleep 0.5
	echo "[NICE]: collecting dependencies ($count_src) ..."; sleep 0.5
	echo "[NICE]: deploying $0 ..."; sleep 1.5
	echo "---"

	read -p  "username: " username
	read -sp "password: " password
	printf "\n---\n"

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
				echo "[NICE]: logggin in successfully, $username !"
				read
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
				printf "$username#$password#$get_date\n" >> $file_path
				printf "[NICE]: create account successfully! ...\n"	
				read
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
}

menu() {
	echo
}
# Main Method
while [[ TRUE == TRUE ]]; do
	clear
	login
done
