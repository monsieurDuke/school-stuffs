#!/bin/bash

clear
while :
do
	echo "touch"
	echo "mkdir"
	echo "install"
	echo "df"
	echo "cat"
	echo "cp"
	echo "move"
	echo "redirection"
	echo "clear"
	echo "nano"
	echo "rm"
	echo "join"
	echo "mktemp"
	echo "ls"
	echo "rename"
	echo""
	read -p "menu : " menu
	case $menu in
		"touch")
		    read -p "nama file: " file
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
		     get_disp=$(ls -la)	
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
		     ;;
		  "cp")
		     read -p "nama file awal : " file
		     read -p "nama file baru : " file2
		     read -p "tujuan folder : " folder
		     if [[ "$folder" ]]
		     then
		     	file2="$folder/$file2"
		     fi
		     cp "$file" "$file2"
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
		     df | grep -e "/mnt/c" -e "/mnt/td"
		     echo ""
		     ;;
	esac
done	
