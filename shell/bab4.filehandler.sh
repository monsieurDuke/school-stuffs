#!/bin/bash
# ---------
# touch = create file
# cp    = copy (*)
# mv    = rename / rename + move (*)
# rm    = remove file  (*)
# rm -r = remove dir parent (*)
# mkdir = create dir
# cp, mv, rm bisa menggunakan regex | *.doc *.pdf test.* *module*

# redirection, df, mktemp, join,install
# mkdir, membuat file, mv, cp rm
# dd, split, tee, touch, find, find -exec

clear
while :
do
	echo "touch  o| cp        o| rm      o|"
	echo "mkdir  o| move      o| join     |"
	echo "inst   o| redirect  o| mktemp   |"
	echo "df     o| clear     o| ls      o|"
	echo "cat    o| nano      o| rename  o|"
	echo "---------------------------------"
	read -p "menu : " menu
	case $menu in
		"touch")
			read -p "nama file : " file
			touch $file
			echo ""			
			;;
		"nano")
			read -p "nama file : " file
			nano $file
			echo ""			
			;;		
		"cat")
			read -p "nama file : " file
			cat $file
			echo ""			
			;;					
		"install")
			read -p "nama package : " pack
			apt-get install $pack
			echo ""			
			;;								
		"mkdir")
			read -p "nama folder : " folder
			mkdir $folder
			echo ""			
			;;			
		"ls")
			read -p "view directory : " folder
			ls $folder
			echo ""
			;;				
		"redirect")
			read -p "kirim buffer ke : " file
			get_disp=$(date)
			echo "$get_disp" > "$file"
			echo ""
			;;
		"move")
			read -p "nama file : " file
			read -p "tujuan folder : " folder
			if [ -d "$folder" ]
			then
				mv "$file" "$folder"
			fi
			;;
		"rename")
			read -p "nama file awal : " file
			read -p "nama file baru : " file2
			if [ ! -d "$file2" ]
			then
				mv "$file" "$file2"
			fi			
			echo ""			
			;;			
		"cp")
			read -p "nama file awal : " file
			read -p "nama file baru : " file2			
			read -p "tujuan folder : " folder
			file2="$folder$file2"
			cp "$file" "$file2"
			echo ""			
			;;						
		"rm")
			read -p "nama file awal : " file
			rm "$file"
			echo ""			
			;;									
		"clear")
			clear
			;;
		"df")
			df -h
			echo ""			
			;;
	esac
done
