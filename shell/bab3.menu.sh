#!/bin/bash

menu() {
	username=$1
	password=$2
	get_date=$3
	clear
	echo "$username $password $get_date"
	echo "--------------------------------------------"
	echo "[1] CREATE FILE      -       RENAME FILE [5]"
	echo "[2] REMOVE FILE      -    LIST DIRECTORY [6]"	
	echo "[3] READ FILE        -      CLEAR SCREEN [7]"		
	echo "[4] APPEND FILE      -           LOG-OUT [8]"			
	echo "--------------------------------------------"
	read -p "nurkocat : " new_ans
	echo "$new_ans"
}

menu $1 $2 $3