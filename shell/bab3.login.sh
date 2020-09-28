#!/bin/bash
# ----------
# buat login sistem, pengecekan berdasarkan filetext
# kalau login salah, ada opsi untuk buat akun baru
# setelah login selesai, user bisa buka file yang sesuai dengannya
# ada warning kalau mau coba buka file yang bukan sesuai

# username#password
# icat#123
# 0,1
# fabian#2020
# fauzan#beelzee

dir_path="log"
file_path="$dir_path/account.lst"
account_found=FALSE
account_match=FALSE

if [[ -d "$dir_path" ]] # kalau folder log/ ada
then
	if [[ -e "$file_path" ]] # kalau file ada
	then
		read -p  "username : " username
		read -sp "password : " password
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
					echo "kamu berhasil masuk, $username"
					# ... 
				fi
			fi				
		done < $file_path

		if [[ "$account_found" == "FALSE" && "$account_match" == "FALSE" ]]
		then
			read -p "detecting new account. create one (y/n) ? " answ
			if [[ "$answ" == "y" ]]
			then
				printf "$username#$password\n" >> $file_path
				printf "Create account successfully!\n"	
			fi			
		else if [[ "$account_match" == "TRUE" && "$account_found" == "FALSE" ]]
			then
				echo "akun ketemu, password salah"
			fi
		fi
	else
		touch $file_path
		echo "membuat file ..."
	fi
else
	mkdir $dir_path
	touch $file_path	
	echo "membuat folder ..."	
	echo "membuat file ..."
fi
