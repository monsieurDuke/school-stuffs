#!/bin/bash
read -p "INSERT A NAME   : " get_name
read -p "INSERT A NUMBER : " get_number
echo "---"
if [[ $get_number -lt 50 ]]
then
echo "$get_number < 50"
fi
if (( $get_number < 50 ))
then
echo "$get_number < 50"
fi
if [[ $get_name > "Muhammad Subarjo" ]]
then
echo "$get_name, setelah Muhammad Subarjo"
else
echo "$get_name, sebelum Muhammad Subarjo"
fi
