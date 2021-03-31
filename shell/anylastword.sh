#!/bin/bash
#------------------------------------
# BUNDLE FOR COMPILE AND BUILD (JAVA)
#------------------------------------

IFS=$'.'
read -a arr_ext <<< "$1"
arr_ext_len="${#arr_ext[@]}"
arr_ext_len=$((--arr_ext_len))
ext_name="${arr_ext[$arr_ext_len]}"
inc=0

for i in ${arr_ext[@]}; do
	if [[ $inc -lt $arr_ext_len ]]; then
		inc=$((++inc))
		echo -en "$i"
		if [[ $inc -lt $arr_ext_len ]]; then
			echo -en "."
		fi
	fi
done
echo ""
