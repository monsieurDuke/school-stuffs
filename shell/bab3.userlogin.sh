#!/bin/bash

akun_benar="FALSE"
username=("fabian" "azzah" "hanna" )
password=("fab21" "azzah23" "hn2019")

read -p "username : " user_in
read -sp "password : " pass_in
echo ""

for i in `seq 0 ${#username[@]}`
do
	if [[ $user_in == ${username[$i]} && $pass_in == ${password[$i]} ]]
	then
		#kolom occok
		akun_benar="TRUE"
	fi
done

if [[ $akun_benar == "TRUE" ]]
then
	while [[ "TRUE" == "TRUE" ]]
	do
		clear
		echo "Pilih Menu:"
		echo "1. Buat File"
		echo "2. Apus File"
		echo "3. Baca File"
		echo "4. Isi File"
		echo "5. Lihat File"
		echo "---"
		read -p "masukan menu (1/2/3/4/5) : " jawab
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
				arr_list=($user_in.*)				
				for i in ${arr_list[@]}
				do
					echo "- $i"
				done
				echo ""
				;;												
		esac
		read
	done
else
	echo "akun salah, coba lagi"
fi

