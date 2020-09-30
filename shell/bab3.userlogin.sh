#!/bin/bash

user="icat"
pass="ok"
loop="TRUE"

read -p "user: " user_in
read -p "pass: " pass_in

if [[ $user == $user_in && $pass == $pass_in ]]
then
	while [[ "TRUE" == "TRUE" ]]
	do
		echo "Pilih Menu:"
		echo "1. Buat File"
		echo "2. Apus File"
		echo "3. Baca File"
		echo "4. Isi File"
		echo "5. Lihat File"
		echo "---"
		read -p "masukan menu (1/2/3) : " jawab
		case $jawab in
			"1")
				read -p "nama file : " nama_file
				touch "$user_in.$nama_file"
				;;
			"2")
				read -p "nama file : " nama_file
				rm "$user_in.$nama_file"
				;;
			"3")
				read -p "nama file : " nama_file
				cat "$user_in.$nama_file"
				;;				
			"4")
				read -p "nama file : " nama_file
				read -p "tuliskan isi file : " isi_file
				echo $isi_file >> "$user_in.$nama_file"
				;;								
			"5")
				echo ""
				ls | grep "$user_in"
				echo ""
				;;												
		esac
	done
fi