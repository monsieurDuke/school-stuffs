#!/bin/bash
# ----------
# - buat function
# - manggil function
# - 4 segitiga, piramid bawah, atas, kanan kiri
# - inputan nentuin panjang baris segitiga
# - PDF & Source Code
# ----------

color_green=`tput setaf 1`
color_reset=`tput sgr0`

arr_nine=(9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0)
arr_zero=(0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9)
arr_mesr=(1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0)
loop_nine="unchecked"
loop_zero="unchecked"

bot_pyr() {	
	echo ""
	line_number=1
	count_start=0
	inc=$((${#arr_nine[@]} - 1 - $1))
	arr_len=$inc
	while [ $inc -ge 0 ]
	do
		for i in `seq $inc $arr_len`
		do
			space=$((-1 + $inc))
			if [[ $loop_nine == "unchecked" ]]
			then
				for j in `seq 0 $space`
				do
					echo -n ":"
					loop_nine="checked"
				done
			fi
			echo -n "${color_green}.${arr_nine[$i]}${color_reset}"
		done
		echo -n "${color_green}.${color_reset}"
		for j in `seq 0 $space`
		do
			echo -n ":"
			loop_nine="checked"
		done		
		echo -n " | ${arr_mesr[$count_start]}"
		line_number=$((++line_number))
		count_start=$((++count_start))
		echo ""
		inc=$((--inc))
		loop_nine="unchecked"
	done
	for k in `seq 1 $line_number`
	do 
		echo -n "--"
	done
	echo ""
	line_number=$(($line_number - 2))
	for n in `seq 0 $line_number`
	do 
		echo -n " ${arr_mesr[$n]}"
	done		
	echo ""
	echo ""
}

top_pyr() {	
	echo ""
	line_number=1
	count_start=0	
	arr_len=$((${#arr_nine[@]} - 1 - $1))
	inc=0
	while [ $inc -le $arr_len ]
	do
		for i in `seq $inc $arr_len`
		do
			space=$((-1 + $inc))
			if [[ $loop_nine == "unchecked" ]]
			then
				for j in `seq 0 $space`
				do
					echo -n ":"
					loop_nine="checked"
				done
			fi
			echo -n "${color_green}.${arr_nine[$i]}${color_reset}"
		done
		echo -n "${color_green}.${color_reset}"
		for j in `seq 0 $space`
		do
			echo -n ":"
			loop_nine="checked"
		done				
		echo -n " | ${arr_mesr[$count_start]}"
		line_number=$((++line_number))
		count_start=$((++count_start))		
		echo ""
		inc=$((++inc))
		loop_nine="unchecked"
	done
	for y in `seq 1 $line_number`
	do 
		echo -n "--"
	done
	echo ""
	line_number=$(($line_number - 2))
	for p in `seq 0 $line_number`
	do 
		echo -n " ${arr_mesr[$p]}"
	done		
	echo ""
	echo ""
}

lft_pyr() {	
	echo ""
	line_ver=1
	line_number=1
	count_start=0		
	inc=$((${#arr_nine[@]} - 1 - $1))
	arr_len=$inc
	while [ $inc -ge 0 ]
	do
		for i in `seq $inc $arr_len`
		do
			echo -n "${color_green}${arr_zero[$i]}.${color_reset}"
		done
		space=$(($inc + 1))
		#echo "inc   = $inc"
		#echo "space = $space"
		for k in `seq 1 $space`
		do
			echo -n "::"
		done
		echo -n " | ${arr_mesr[$count_start]}"		
		line_number=$((++line_number))
		count_start=$((++count_start))						
		echo ""
		inc=$((--inc))
		loop_nine="unchecked"
	done	
	spike=$((++arr_len))
	for m in `seq 0 $spike`
	do
		echo -n "${color_green}${arr_zero[$m]}.${color_reset}"
	done	
	echo -n " | ${arr_mesr[$count_start]}"	
	#line_number=$((++line_number))
	count_start=$((++count_start))							
	echo ""
	arr_len=$((${#arr_zero[@]} - 1 - $1))
	inc=0	
	while [ $inc -le $arr_len ]
	do
		for i in `seq $inc $arr_len`
		do
			echo -n "${color_green}${arr_zero[$i]}.${color_reset}"
		done
		space=$(($inc + 1))
		#echo "inc   = $inc"
		#echo "space = $space"
		for k in `seq 1 $space`
		do
			echo -n "::"
		done	
		echo -n " | ${arr_mesr[$count_start]}"
		line_number=$((++line_number))
		line_ver=$((++line_ver))
		count_start=$((++count_start))				
		echo ""
		inc=$((++inc))
		loop_nine="unchecked"
	done		
	line_number=$(($line_ver - 1))	
	for y in `seq 0 $line_number`
	do 
		echo -n "--"
	done
	echo -n "-"
	echo ""
	for o in `seq 0 $line_number`
	do 
		echo -n "${arr_mesr[$o]} "
	done		
	echo ""
	echo ""
}

rgt_pyr() {	
	echo ""
	line_ver=1
	line_number=1
	count_start=0			
	inc=$((${#arr_nine[@]} - 1 - $1))
	arr_len=$inc
	while [ $inc -ge 0 ]
	do
		space=$(($inc + 1))
		#echo "inc   = $inc"
		#echo "space = $space"
		for k in `seq 1 $space`
		do
			echo -n "::"
		done		
		for i in `seq $inc $arr_len`
		do
			echo -n "${color_green}.${arr_nine[$i]}${color_reset}"
		done
		echo -n " | ${arr_mesr[$count_start]}"		
		line_number=$((++line_number))
		count_start=$((++count_start))								
		echo ""
		inc=$((--inc))
		loop_nine="unchecked"
	done	
	spike=$((++arr_len))
	for m in `seq 0 $spike`
	do
		echo -n "${color_green}.${arr_nine[$m]}${color_reset}"
	done	
	echo -n " | ${arr_mesr[$count_start]}"		
	line_number=$((++line_number))
	count_start=$((++count_start))							
	echo ""
	arr_len=$((${#arr_zero[@]} - 1 - $1))
	inc=0	
	while [ $inc -le $arr_len ]
	do
		space=$(($inc + 1))
		#echo "inc   = $inc"
		#echo "space = $space"
		for k in `seq 1 $space`
		do
			echo -n "::"
		done				
		for i in `seq $inc $arr_len`
		do
			echo -n "${color_green}.${arr_nine[$i]}${color_reset}"
		done
		echo -n " | ${arr_mesr[$count_start]}"		
		line_number=$((++line_number))
		line_ver=$((++line_ver))		
		count_start=$((++count_start))								
		echo ""
		inc=$((++inc))
		loop_nine="unchecked"
	done		
	line_number=$(($line_ver - 1))	
	for y in `seq 0 $line_number`
	do 
		echo -n "--"
	done
	echo -n "-"
	echo ""
	for p in `seq 0 $line_number`
	do 
		echo -n " ${arr_mesr[$p]}"
	done		
	echo ""
	echo ""
}

main_menu() {
	loop="true"
	while :
	do
		clear
		echo "---------------------------"	
		echo "|:    T R I A N G L E    :|"
		echo "---------------------------"
		echo "| [T] TOP    |    BOT [B] |"
		echo "| [L] LEFT   |  RIGHT [R] |"
		echo "---------------------------"
		while [ $loop ]
		do
			unset height
			read -p ">> " choice
			case $choice in
				"B"|"b")
					read -p "-- SET THE HEIGHT : " height
					if [[ $height -le 30 && $height > 0 ]]
					then
						subt=$((30 - $height))
						bot_pyr $subt		
						continue				
					fi			
					echo "-- HEIGHT RANGE ARE 1 - 30"		
					;;
				"T"|"t")
					read -p "-- SET THE HEIGHT : " height
					if [[ $height -le 30 && $height > 0 ]]
					then
						subt=$((30 - $height))
						top_pyr $subt
						continue				
					fi			
					echo "-- HEIGHT RANGE ARE 1 - 30"		
					;;			
				"L"|"l")
					read -p "-- SET THE HEIGHT : " height
					if [[ $height -le 30 && $height > 0 ]]
					then
						subt=$((31 - $height))
						lft_pyr $subt
						continue				
					fi			
					echo "-- HEIGHT RANGE ARE 1 - 30"		
					;;						
				"R"|"r")
					read -p "-- SET THE HEIGHT : " height
					if [[ $height -le 30 && $height > 0 ]]
					then
						subt=$((31 - $height))
						rgt_pyr $subt
						continue				
					fi			
					echo "-- HEIGHT RANGE ARE 1 - 30"		
					;;									
				"clear")
					break
					;;
			esac
		done
	done
}

## Main Method
main_menu


