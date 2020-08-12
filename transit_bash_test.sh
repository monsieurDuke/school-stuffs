#! /bin/bash
#
#--Setting Warna
color_red=`tput setaf 1`
color_green=`tput setaf 2`
color_yellow=`tput setaf 3`
color_resv=`tput setaf 4`
color_magenta=`tput setaf 5`
color_cyan=`tput setaf 6`
color_cust=`tput setaf 7`
color_black=`tput setaf 13`
color_reset=`tput sgr0`
color_green1=`tput setab 2`
color_red1=`tput setab 1`
color_yellow1=`tput setab 3`
color_cust1=`tput setab 7`
color_cyan1=`tput setab 6`
color_quiz=`tput setaf 10`
color_quiz1=`tput setab 10`
#
#--Setting Kata (yang berwarna)
sym_ok="${color_green}[OK]${color_reset}"
sym_fail="${color_red}[FAIL]${color_reset}"
sym_pending="${color_yellow}[PENDING]${color_reset}"
sym_success="${color_green}successfully${color_reset} !"
sym_unsuccess="${color_red}unsuccessfully${color_reset} !"
sym_failed="${color_red}failed${color_reset}"
sym_y="${color_green}Y${color_reset}"
sym_n="${color_red}N${color_reset}"
sym_key_enter="${color_cyan}[Enter]${color_reset}"
sym_key_ctrl="${color_cyan}[Ctrl]${color_reset}"
sym_key_z="${color_cyan}[Z]${color_reset}"
#
#
curtime="$(date +'%H:%M')"
curdate="$(date +'%a, %d/%m/%Y')"
while [[ 1 == 1 ]]
do
IFS=#
get_rcnt=$(cat "recent-login.txt")
read -a recent_arr <<< "$get_rcnt"	
username=${recent_arr[0]}
clear	
echo "${color_green}|=========== .:| ${color_yellow}H O M E P A G E${color_green} |:. ===========|"
echo "+-----------------------------------------------+${color_reset}"
echo ">>>${color_cyan} $curdate ${color_reset}| Hello, ${color_cyan}$username${color_reset}"
echo "${color_green}+-----------------------------------------------+${color_reset}"
echo "1) TO-DO QUIZ - ${color_magenta}Take your math quiz and practice${color_reset}"
echo "2) TO-DO LIST - ${color_magenta}Check your current schedule here${color_reset}"
echo "3) Sign Out"
echo "${color_green}+-----------------------------------------------+${color_reset}"
read -p "Type your ${color_yellow}command${color_reset} . . : " choice
echo "${color_green}+-----------------------------------------------+${color_reset}"
echo "${color_green}|===============================================|${color_reset}"
echo $ll
case $choice in
1)
	clear
	./quiz_bash_test.sh
	;;
2)
	clear
	./main_bash_test.sh
	;;
3)
	yn4_answ="y"
	echo "Your about to log out from ${color_cyan}'$username'${color_reset} account"
	while [[ $yn4_answ != "y" || $yn4_answ != "Y" || $yn4_answ != "n" || $yn4_answ != "N" ]]
	do
		read -p "Do you wish to continue ? (${sym_y}/${sym_n}) . . " yn4_answ
		if [[ $yn4_answ == "y" || $yn4_answ == "Y" || $yn4_answ == "n" || $yn4_answ  == "N" ]]
		then
			break
		fi
	done			
	if [[ $yn4_answ == "y" || $yn4_answ == "Y" ]]
	then
		echo ". . . . ."
		echo "You have logged out ${sym_success}"
		echo "You'll be redirect to the log in window"	
		echo $ll												
		echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
		read -sp "Press $sym_key_enter key to continue . . "	
		clear									
		./login_bash_test.sh	
	fi	
	;;
*)
esac
done