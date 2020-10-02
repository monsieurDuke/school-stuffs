#!/bin/bash

# username
# icat#awda
# nijar#awda
# fabian#awda
# index 0: icat, index 1: awda

read -p "masukan username : " username
read -p "masukan password : " password
akun_ketemu="FALSE"
password_ketemu="FALSE"
berhasil_masuk="FALSE"

while IFS= read -r ambil_user
do
	IFS=#
	read -a ambil_akun <<< "$ambil_user"
	if [[ $username == "${ambil_akun[0]}" ]]
	then
		akun_ketemu="TRUE"
	fi	
	if [[ $username == "${ambil_akun[0]}" && $password == "${ambil_akun[1]}" ]]
	then
		echo "silahkan masuk, $username"
		password_ketemu="TRUE"
		berhasil_masuk="TRUE"
	fi
done < "akun-list.txt"

if [ $password_ketemu == "FALSE" ]
then
	if [ $akun_ketemu == "FALSE" ]
	then
		read -p "apa kamu mau buat akun baru (y) ? " jawab
		if [ $jawab == "y" ]
		then
			read -p "masukan username baru : " username
			read -p "masukan password baru : " password
			echo "$username#$password" >> "akun-list.txt"
		fi
	else
		echo "password salah"
	fi
fi

if [ $berhasil_masuk == "TRUE" ]
then
	echo "1. awdawdawd"
	
fi

