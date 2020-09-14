#! /bin/bash
#-- @nurirsyad-thiccboi
#
#--Setting Warna
color_red=`tput setaf 1`
color_green=`tput setaf 2`
color_yellow=`tput setaf 3`
color_magenta=`tput setaf 5`
color_cyan=`tput setaf 6`
color_cust=`tput setaf 7`
color_reset=`tput sgr0`
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
clear
total_correct="0"
total_wrong="0"
#
#--Loop untuk login
reload="true"
while [ $reload == "true" ]
do
	echo 	"${color_cust}|=========== .:| ${color_yellow}W E L C O M E${color_cust} |:. ===========|"
	echo 	"+---------------------------------------------+${color_reset}"
	read -p  "username . . . : " username
	read -sp "password . . . : " password
	echo $ll
	echo 	"${color_cust}+---------------------------------------------+"
	echo 	"|=============================================|${color_reset}"
	echo 	$ll
	sym_user="'${color_magenta}$username${color_reset}'"
	#
	#--Cek kalau file xxx-login.txt itu udah dibuat atau belum
	if [ -e "$username-login.txt" ]
	then
		echo "Searching account . . . . $sym_ok"
		#
		#--Ambil isi xxx-login.txt ke variabel 'get_usr'
		#--Delimiternya '#'
		#--'get_usr' dipotong lewat delimiter, dimasukin ke array 'log_arr'
		get_usr=$(cat "$username-login.txt")
		IFS=#
		read -a log_arr <<< "$get_usr"
		#
		#--Isi xxx-login.txt di compare dengan inputan user
		if [[ $username == ${log_arr[0]}  && $password == ${log_arr[1]} ]]
		then
			echo "Verifying account . . . . $sym_ok"
			echo ". . . . ."
			echo "You have logged in $sym_success"
			echo ". . . . ."			
			hist_str="$username#pakaiindex0"
			echo "$hist_str" | dd of="recent-login.txt"										
			echo ". . . . ."
			echo "Recent log in has been ${color_yellow}updated${color_reset} !"
			echo $ll		
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "
			#
			#--Ganti Page	
			#./main_bash_test.sh
			./transit_bash_test.sh
		else
			echo "Verifying account . . . . $sym_fail"		
			echo ". . . . ."
			echo "You have $sym_failed to logged in !"				
			echo "Incorrect password detected. Becareful this time"				
			echo $ll		
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue re-log . . "			
			echo $ll		
		fi
	else
		echo "Searching account . . . . $sym_fail"	
		echo "Verifying account . . . . $sym_fail"
		echo "Detecting new account . . $sym_pending"
		echo ". . . . ."
		#
		#--Loop untuk perintah buat akun baru atau tidak
		answ_crt_log="y"
		while [[ $answ_crt_log != "y" || $answ_crt_log != "Y" || $answ_crt_log != "n" || $answ_crt_log != "N" ]]
		do
			read -p "Do you want to create an account as $sym_user ? ($sym_y/$sym_n) . . " answ_crt_log
			#
			#--Kalau inputan Y atau N, keluar dari loop
			if [[ $answ_crt_log == "y" || $answ_crt_log == "Y" || $answ_crt_log == "n" || $answ_crt_log == "N" ]]
			then
				break
			fi
		done
		#
		#--Cek kalau jawaban user mau buat akun baru
		if [[ $answ_crt_log == "Y" || $answ_crt_log == "y" ]]
		then
			echo ". . . . ."
			read -p "Type your new password . . . . : " new_pass1
			read -sp "Re-type confirmed password . . : " new_pass2
			echo $ll
			echo ". . . . ."					
			#
			#--Cek kalau input password pertama dan kedua sama
			if [ $new_pass1 == $new_pass2 ]
			then
				password=$new_pass1
				#
				#--Buat format dalam isi file : username#password
				#--Write Out (bukan append) file baru
				#--Format file baru : username-login.txt
				log_str="$username#$password"
				echo "$log_str" | dd of="$username-login.txt"
				touch "$username-task.txt" 
				touch "$username-task-detail.txt" 				
				echo ". . . . ."								
				echo "$total_correct#$total_wrong" | dd of="$username-quiz-stats.txt"														
				#buat lagi, untuk last-login.txt, isinya username doang
				get_usr=$(cat "$username-login.txt")
				IFS=#
				read -a log_arr <<< "$get_usr"
				echo ". . . . ."		
				echo "${color_yellow}new username :${color_reset} ${log_arr[0]}"
				echo "${color_yellow}new password :${color_reset} ${log_arr[1]}"						
				echo ". . . . ."		
				echo "Create account $sym_success"
				echo "This is not a public-account. Keep it private !"
				echo ". . . . ."
				hist_str="$username#pakaiindex0"
				echo "$hist_str" | dd of="recent-login.txt"										
				echo ". . . . ."
				echo "Recent log in has been ${color_yellow}updated${color_reset} !"
				echo $ll		
				echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
				read -sp "Press $sym_key_enter key to continue . . "			
				#
				#--Ganti Page		
				#./main_bash_test.sh				
				./transit_bash_test.sh				
			else
				echo "Password doesn't seem to be match"
				echo "Create account $sym_unsuccess"
				echo $ll
				echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
				read -sp "Press $sym_key_enter key to continue re-log . . "			
				echo $ll		
			fi
		else
			echo ". . . . ."
			echo "You have $sym_failed to create account "										
			echo $ll
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue re-log . . "			
			clear
		fi
	fi
	clear
done
#
#
#file : irsyadnu-logintxt
#isi  : irsyadndu#pass123