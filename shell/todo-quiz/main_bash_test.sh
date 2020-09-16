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
#
#
clear
while [[ 1 == 1 ]] 
do
detail_sub=""
detail_sub2=""		
quiztime="salah"						
IFS=#
get_rcnt=$(cat "user-log/recent-login.txt")
read -a recent_arr <<< "$get_rcnt"
get_usr=$(cat "user-log/$username-login.txt")
read -a log_arr <<< "$get_usr"	
username=${recent_arr[0]}
get_event=$(cat "user-log/$username-event.txt")
read -a event_arr <<< "$get_event"	
curtime="$(date +'%H:%M')"
curdate="$(date +'%a, %d/%m/%Y')"
clear
#echo $curdate " -- " $curtime
#echo ${recent_arr[0]}
#echo $username
echo "${color_cust}|=============== .:| ${color_yellow}T O D O L I S T${color_cust} |:. ===============|"
echo "+-------------------------------------------------------+${color_reset}"
echo ">>> ${color_cyan}$curdate${color_reset} ::: ${color_cyan}${event_arr[0]}${color_reset}"
echo "${color_cust}+-------------------------------------------------------+${color_reset}"
inc2=0
inc3=0
inc5=0
alph=({0..9} {a..z} {A..Z})
while IFS= read -r line
do	
	((inc2++))
	((inc5++))		
	IFS=#
	read -a sub_arr <<< "$line"
	timecompare=${sub_arr[0]}
	IFS=-
	read -a sub_arr3 <<< $timecompare
	if [[ "$curtime" < "${sub_arr3[1]}"  && "$curtime" > "${sub_arr3[0]}" || "$curtime" == "${sub_arr3[0]}" ]]
	then
		case "${sub_arr[1]}" in
		*"uiz"*)
			echo "${color_quiz}[${color_quiz1}${color_black}${alph[$inc5]}${color_reset}${color_quiz}] ${sub_arr[0]} | ${sub_arr[1]}${color_reset}"
			quiztime="benar"
			;;
		*"UIZ"*)
			echo "${color_quiz}[${color_quiz1}${color_black}${alph[$inc5]}${color_reset}${color_quiz}] ${sub_arr[0]} | ${sub_arr[1]}${color_reset}"
			quiztime="benar"			
			;;
		*)
			echo "${color_green}[${color_green1}${color_black}${alph[$inc5]}${color_reset}${color_green}] ${sub_arr[0]} | ${sub_arr[1]}${color_reset}"
			quiztime="salah"			
			;;
		esac
		detail_sub="${sub_arr[1]}"
	else
		echo "${color_resv}[${alph[$inc5]}] ${sub_arr[0]} | ${sub_arr[1]}${color_reset}"
	fi
done < "user-log/$username-task.txt"
echo "${color_cust}+-------------------------------------------------------+${color_reset}"
while IFS= read -r line2
do
	IFS=#
	read -a sub_arr7 <<< "$line2"
	if [[ $detail_sub == ${sub_arr7[0]} ]]
	then
		detail_sub2=${sub_arr7[1]}
	fi	
done < "user-log/$username-task-detail.txt"
echo "${color_green}INFO${color_reset} : ${color_cyan}$detail_sub2${color_reset}"
echo "${color_cust}+-------------------------------------------------------+${color_reset}"
echo "1) Add Task 	 2) Remove Task"
echo "3) Refresh Task  4) Rename Event"
echo "5) Clear Event 	 6) Homepage"
if [[ $quiztime == "benar" ]]
then
	echo "7) ${color_quiz}TO-DO QUIZ${color_reset}"
fi
echo "${color_cust}+-------------------------------------------------------+${color_reset}"
read -p "Type your ${color_yellow}command${color_reset} . . : " choice
echo "${color_cust}+-------------------------------------------------------+${color_reset}"
echo "${color_cust}|=======================================================|${color_reset}"
echo $ll
check="unspotted"
check_firstime() {
	echo "It seems that you haven't create an event yet."  
	yn2_answ="y"
	yn_answ="y"
	while [[ $answ_crt_log != "y" || $answ_crt_log != "Y" || $answ_crt_log != "n" || $answ_crt_log != "N" ]]
	do
		read -p "Would you like to create one ? (${sym_y}/${sym_n}) . . "  yn2_answ
		if [[ $yn2_answ == "y" || $yn2_answ == "Y" || $yn2_answ == "n" || $yn2_answ == "N" ]]
		then
			break
		fi
	done			
	if [[ $yn2_answ == "y" || $yn2_answ == "Y" ]]
	then
		echo ". . . . . . ."			
		read -p "Name of Event . . . . . . . . . : " n_event_str
		#read -p "Dates of Event (DD/MM/YYYY) . . : " d_event_str		
		#echo ". . . . . . ."
		while [[ $yn_answ != "y" || $yn_answ != "Y" || $yn_answ != "n" || $yn_answ != "N" ]]
		do
		read -p "Do you want to create ${color_cyan}'$n_event_str'${color_reset} as a new event ? (${sym_y}/${sym_n}) . . " yn_answ
		if [[ $yn_answ == "y" || $yn_answ == "Y" || $yn_answ == "n" || $yn_answ == "N" ]]
		then
				break
		fi
		done	
		if [[ $yn_answ == "y" || $yn_answ == "Y" ]]
		then
			echo ". . . . . . ."							
			user_event="$n_event_str#$d_event_str"
			echo "$user_event" | dd of="user-log/$username-event.txt" 
			touch "user-log/$username-task.txt"
			echo ". . . . . . ."							
	  		echo "Create event ${sym_success}"
			echo "Now you can ${color_cyan}Add Task${color_reset} within your event !"
			echo $ll		
		else
			echo ". . . . ."
			echo "You have $sym_failed to create event "	
			echo $ll									
		fi		
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "					
		else	
			echo ". . . . ."
			echo "You have $sym_failed to create event "	
			echo $ll												
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "								
			continue				
	fi
}
case $choice in
1 )
	#low
	#over
	#mid	
	#wrong-mid
	#wrong-over
	if [ -e "user-log/$username-event.txt" ]
	then
		vd='^[0-9:-]+$'	
		#if [[ $tasktime =~ $vd ]]
		passcheck=""
		passcheck_kanan=""
		passcheck_kiri=""
		inc3=1
		read -p "Add the name of activity . . . . . . . . : " taskname
		read -p "Add the task durations (HH:MM-HH:MM) . . : " tasktime
		#log_str="$username#$password"
		#23:59-23:59
		task_str="$tasktime#$taskname"
		checktime="belum"
		inputbenar="salah"		
		#IFS=-
		#read -a sub_arr4 <<< $tasktime		
		#IFS=:		
		#read -a time_left_in <<< ${sub_arr4[0]} 
		#read -a time_right_in <<< ${sub_arr4[1]}	
		#echo "${time_left_in[0]} - ${time_left_in[1]} | ${time__in[0]} - ${time_right_in[1]}" 	
		if [[ $tasktime == *"-"**":"* && $tasktime =~ $vd && $inc2 == "0" ]]
		then
			echo "$task_str" >> "user-log/$username-task.txt"	
			checktime="sudah"
			inputbenar="benar"
		fi
		IFS=-
		read -a sub_arr4 <<< $tasktime
		while IFS= read -r line3
		do
			IFS=-			
			inc4=0
			read -a sub_arr8 <<< $line3
			IFS=#
			read -a sub_arr5 <<< $line3
			timecompare2=${sub_arr5[0]}
			IFS=-
			read -a sub_arr6 <<< $timecompare2
			#IFS=:
			#read -a time_left_in <<< ${sub_arr4[0]} 
			#read -a time_right_in <<< ${sub_arr4[1]}
			#23:59-23:59 | [0] -le 23 | [1] -le 59
			#${time_left_in[0]} -le 23 && ${time_left_in[1]} -le 59 && ${time_right_in[0]} -le 23 && ${time_right_in[1]} -le 59 			 			
			#jadwal  02:30-05:00
			#jadwal  02:30-05:01
			#inputan 05:00-07:00
			#echo "$passcheck_kiri --- $passcheck_kanan "
			if [[ $checktime == "belum" ]]
			then
				if [[ $tasktime == *"-"**":"* && $tasktime =~ $vd && ${sub_arr4[1]} < ${sub_arr6[0]} && ${sub_arr4[1]} > ${sub_arr4[0]} || ${sub_arr4[1]} == ${sub_arr6[0]} ]]
				then
					#echo "dia masuk cuman gamau"
					#echo "$passcheck_kanan kanan, $passcheck_kiri kiri"
					if [[ ${sub_arr4[0]} > $passcheck_kanan && ${sub_arr4[1]} > $passcheck_kanan || ${sub_arr4[0]} == $passcheck_kanan ]]
					then
						#((inc3--))
						#inibukanuntukdipakai="ashiap"
						task_counter=$inc3"i"
						sed -i "$task_counter $task_str" "user-log/$username-task.txt"
						#echo "masuk less"
						checktime="sudah"
						inputbenar="benar"						
						#echo "masukkk"
					fi
					break					
				else
					if [[ $tasktime == *"-"**":"* && $tasktime =~ $vd && $inc3 == $inc2 && $inc2 != "0" && ${sub_arr4[0]} > ${sub_arr6[0]} && ${sub_arr4[1]} > ${sub_arr4[0]} ]] #&& ${sub_arr4[0]} > ${sub_arr6[1]} || ${sub_arr4[0]} == ${sub_arr6[1]}
					then
						if [[ ${sub_arr4[0]} > ${sub_arr6[1]} || ${sub_arr4[0]} == ${sub_arr6[1]} ]]
						then
	 						echo "$tasktime#$taskname" >> "user-log/$username-task.txt"						
							#echo "masuk more"						
							checktime="sudah"
							inputbenar="benar"
						else
							inputbenar="salah"											
							#echo "salah 0"							
							inibukanuntukdipakai="o"
						fi
						#inputbenar="salah"
						#echo "salah 1"
					fi									
					#inputbenar="salah"		
					#echo "salah 2"					
				fi	
				#inputbenar="salah"			
				#echo "salah 3"				
			fi
			((inc3++))
			#((inc4++))
			passcheck_kiri=${sub_arr8[0]}
			letpass=${sub_arr8[1]}
			IFS=#
			read -a sub_arr9 <<< $letpass
			passcheck_kanan=${sub_arr9[0]}
		done < "user-log/$username-task.txt"
		#read -p "Add the task durations (HH:MM-HH:MM) . . : " tasktime		
		if [[ $inputbenar == "benar" ]]
		then
			read -p "Add the detail of the task . . . . . . . : " task_detail		
			echo "$taskname#$task_detail" >> "user-log/$username-task-detail.txt"		
			echo ". . . . . . ."																
			echo "Activity ${color_cyan}'$taskname'${color_reset} have been added to ${color_cyan}'${event_arr[0]}'${color_reset}"
			echo "Rundown have been updated ${sym_success}"
			echo ". . . . . . ."					
			echo "${color_cyan}Tips${color_reset} : Rembember, You can add your daily quiz schedule anytime you want"		
			echo "You can just type a keyword${color_green}'QUIZ'${color_reset} on the name of activity"		
			echo "We will automatically create a shortcut for you"
		else
			echo ". . . . . . ."								
			echo "It seems that you have ${color_red}overlapped${color_reset} tasks or ${color_red}incorrect${color_reset} time format"	
			echo "Please organize your schedule more ${color_green}properly${color_reset} uwu"
		fi
			echo $ll	
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "								
		continue						
	else
		check_firstime
	fi
	;;
2 )
	if [ -e "user-log/$username-event.txt" ]
	then
		if [ $inc2 -gt "0" ]
		then
		read -p "Which task to be deleted (1-${alph[$inc5]}) ? . . " choice_task
		echo ". . . . . . . . "	
		inc6=0
		cat_Alph=""
		while [[ 1 = 1 ]]
		do	
			((inc6++))		
			if [[ $choice_task == ${alph[$inc6]} ]]
			then
				cat_Alph=${alph[$inc6]}
				break
			fi
		done
		inc=0
		while IFS= read -r line
		do
			IFS=#
			read -a sub_arr2 <<< "$line"
			((inc++))
			if [ $inc6 -eq $inc ]
			then
				echo "${color_cust}[$cat_Alph]${color_reset} ${color_cyan}${sub_arr2[0]}${color_reset} ${color_cust}|${color_reset} ${color_cyan}${sub_arr2[1]}${color_reset}"
				check="spotted"
			fi		
		done < "user-log/$username-task.txt"	
		if [[ $check == "spotted" ]]
		then
			choice2="y"
			while [[ $choice2 != "y" || $choice2 != "Y" || $choice2 != "n" || $choice2 != "N" ]]
			do
				read -p "The following task will be ${color_red}deleted${color_reset}, confirmed ? (${sym_y}/${sym_n}) . . " choice2
				if [[ $choice2 == "y" || $choice2 == "Y" || $choice2 == "n" || $choice2 == "N" ]]
				then
					break
				fi
			done	
			if [[ $choice2 == "y" ]]
			then				
				echo ". . . . . . . . "			
				detail_sub=""
				detail_sub2=""				
				sed -i "$inc6 d" "user-log/$username-task.txt"
				sed -i "$inc6 d" "user-log/$username-task-detail.txt"				
				echo "You have removed ${color_cyan}'${sub_arr2[1]}'${color_reset} from ${color_cyan}'${event_arr[0]}'${color_reset} ${sym_success}"	
				echo $ll												
				echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
				read -sp "Press $sym_key_enter key to continue . . "								
				continue								
			fi
		fi
		else
			echo "It seems that you haven't add any of tasks to ${color_cyan}'${event_arr[0]}'${color_reset}"
			echo "Please ${color_cyan}Add Task${color_reset} first before you can alter it further"
			echo $ll												
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "								
			continue				
		fi
		#
		echo $ll
	else
		check_firstime
	fi
	;;
3)
	if [ -e "user-log/$username-event.txt" ]
	then
		detail_sub=""
		detail_sub2=""
		echo $ll
		continue
	else
		check_firstime
	fi
	;;
4)
	if [ -e "user-log/$username-event.txt" ]
	then
		yn5_answ="y"
		read -p "Input your new name of the event : " n2_event_str
		echo ". . . . . . ."									
		echo "You're about to rename '${color_cyan}${event_arr[0]}${color_reset}' into '${color_cyan}$n2_event_str${color_reset}'"
		echo "The updates only changes the name of the event"
		echo "and it ${color_green}won't affect${color_reset} the tasks within"
		while [[ $yn5_answ != "y" || $yn5_answ != "Y" || $yn5_answ != "n" || $yn5_answ != "N" ]]
		do
			read -p "Do you wish to continue ? (${sym_y}/${sym_n}) . . " yn5_answ
			if [[ $yn5_answ == "y" || $yn5_answ == "Y" || $yn5_answ == "n" || $yn5_answ == "N" ]]
			then
				break
			fi
		done			
		if [[ $yn5_answ == "y" || $yn5_answ == "Y" ]]
		then
			rm "user-log/$username-event.txt"
			echo ". . . . . . ."							
			user_event2="$n2_event_str#$d_event_str"
			echo "$user_event2" | dd of="user-log/$username-event.txt" 
			echo ". . . . . . ."							
			echo "Rename event ${sym_success}"
			echo $ll
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue re-log . . "						
			continue
		fi
	else
		check_firstime
	fi
	;;
5)
	if [ -e "user-log/$username-event.txt" ]
	then
		yn3_answ="y"
		echo "You're about to delete ${color_cyan}'${event_arr[0]}'${color_reset} as your current event"
		echo "The task(s) within the event will also got ${color_red}removed${color_reset} completely"
		while [[ $yn3_answ != "y" || $yn3_answ != "Y" || $yn3_answ != "n" || $yn3_answ != "N" ]]
		do
			read -p "Do you wish to continue ? (${sym_y}/${sym_n}) . . " yn3_answ
			if [[ $yn3_answ == "y" || $yn3_answ == "Y" || $yn3_answ == "n" || $yn3_answ == "N" ]]
			then
				break
			fi
		done			
		if [[ $yn3_answ == "y" || $yn3_answ == "Y" ]]
		then
			echo ". . . . ."
			echo "You have ${color_red}deleted${color_reset} the current event and it's tasks"													
			rm "user-log/$username-event.txt"
			rm "user-log/$username-task.txt"
			rm "user-log/$username-task-detail.txt"						
			touch "user-log/$username-task-detail.txt"			
			touch "user-log/$username-task.txt"
			detail_sub=""
			detail_sub2=""			
			echo $ll
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue re-log . . "						
			continue
		fi
	else
		check_firstime
	fi
	;;
6)
	yn4_answ="y"
	#echo "Your about to log out from ${color_cyan}'$username'${color_reset} account"
	#while [[ $yn4_answ != "y" || $yn4_answ != "Y" || $yn4_answ != "n" || $yn4_answ != "N" ]]
	#do
	#	read -p "Do you wish to continue ? (${sym_y}/${sym_n}) . . " yn4_answ
	#	if [[ $yn4_answ == "y" || $yn4_answ == "Y" || $yn4_answ == "n" || $yn4_answ  == "N" ]]
	#	then
	#		break
	#	fi
	#done			
	#if [[ $yn4_answ == "y" || $yn4_answ == "Y" ]]
	#then
		#echo ". . . . ."
		#echo "You have logged out ${sym_success}"
		#echo "You'll be redirect to the log in window"	
		#echo $ll												
		#echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
		#read -sp "Press $sym_key_enter key to continue . . "										
		#./login_bash_test.sh	
		clear
		./transit_bash_test.sh
	#fi
	;;
7)
	if [[ $quiztime == "benar" ]]
	then
		clear
		./quiz_bash_test.sh
	else
		continue
	fi
	;;
*)
	detail_sub=""
	detail_sub2=""
esac
clear
done
#
# hari ini : buat add task
# hari ini buat append task, tampilin dngan for in