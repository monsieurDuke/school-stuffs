#!/bin/bash

username=("fabian" "azzah" "hanna")
password=("fab21" "azzah23" "hn2019")

read -p "username : " user_in
read -p "password : " pass_in

for i in `seq 0 ${#username[@]}`
do
	if [[ $user_in == ${username[$i]} && $pass_in == ${password[$i]} ]]
	then
		echo "cocok, nama $user_in pass $pass_in"
		#...
	fi
done