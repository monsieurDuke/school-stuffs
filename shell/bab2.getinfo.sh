
#! /bin/bash

pwd=$(pwd)
user_name=$(whoami)
mchn_name=$(hostname)
user_id=$(id -u)
user_ip=$(hostname -I)
net_int=$(ls /sys/class/net | grep "eth")
dstr_name=$(cat /etc/os-release | grep "NAME=")
dstr_code=$(cat /etc/os-release | grep "VERSION=")

IFS="\""
read -a get_dstr_name <<< "$dstr_name"
read -a get_dstr_code <<< "$dstr_code"

printf "active user\t: %s - %s (%s)\n" "$user_name" "$mchn_name" "$user_id"
printf "work directory\t: %s\n" "$pwd"
printf "%s ip address\t: %s\n" "$net_int" "$user_ip"
printf "linux distro\t: %s %s\n" "${get_dstr_name[1]}" "${get_dstr_code[1]}"

read -p "username : " name
read -s -p "password : " pwd
read -p "notrobot : " check

echo "$name | $pwd ($check)"