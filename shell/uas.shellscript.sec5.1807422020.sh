#!/bin/bash
# ----------------------------------------
# MUHAMMAD NUR IRSYAD - SEC5A - 1807422020
# ----------------------------------------
touch login.db
touch temp.creds

dialog \
--title "WELCOME USER" --title "LOGIN PROMPT" --inputbox "USERNAME" 8 40 2> temp.creds \
--title "LOGIN PROMPT" --inputbox "PASSWORD" 8 40 2> temp.creds

get_user=$(cat temp.creds | tr -s '\t' '@' | cut -d '@' -f 1)
get_pass=$(cat temp.creds | tr -s '\t' '@' | cut -d '@' -f 2)

login="F"
while IFS= read -r get_line
do
	IFS='@'
	read -a creds <<< "$get_line"
	if [[ "$get_user" == "${creds[0]}" && "$get_pass" == "${creds[1]}" ]]
	then
		dialog --msgbox "WELCOME BACK, $get_user" 6 30
		login="T"
	fi
done < user.lst

if [[ $login == "F" ]]
then
	dialog --msgbox "INCORRECT USER, $get_user" 6 30	
fi