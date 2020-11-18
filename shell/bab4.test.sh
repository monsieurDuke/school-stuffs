#!/bin/bash
clear
while :
do

	echo "========================================="
	echo "	       	     MENU		       "
	echo "========================================="
	echo "1. basename"
	echo "2. date"
	echo "3. dirname"
	echo "4. factor"
	echo "5. identity"
	echo "6. groups"
	echo "7. getent"
	echo "8. logger"
	echo "9. md5sum"
	echo "10. mkinfo"
	echo ""
	read -p "pilih menu: " pilih_1
	case $pilih_1 in
		1)
		echo "1. basename   "
		echo "2. basename -a"
		echo "3. basename -s"
		read -p "pilih basename:" pilih_2
		case $pilih_2 in
			1) basename -a /home/azzah /home/azzah/Documents /home/azzah/Dekstop
			   ;;
			2) basename azzah hania
			   ;;
			3) basename -s .sh *
			   ;;
		esac
		;;
	   2)
	   echo "1. date now "
	   echo "2. date -R  "
	   echo "3. date -u  "
	   read -p "pilih date: " pilih_3
	   case $pilih_3 in
			1) date 
			   ;;
			2) date -R
			   ;;
			3) date -u
			   ;;
		esac
		;;
	esac
done