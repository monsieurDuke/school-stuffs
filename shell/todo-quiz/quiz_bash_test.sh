#!/bin/bash
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
sym_q="${color_cyan}Q${color_reset}"
sym_a="${color_quiz}A${color_reset}"
#
#
curtime="$(date +'%H:%M')"
curdate="$(date +'%a, %d/%m/%Y')"
#
while [[ 1 == 1 ]]
do
get_user=$(cat "user-log/recent-login.txt")
IFS=#
read -a user_arr <<< "$get_user"
username=${user_arr[0]}
get_quiz_score=$(cat "user-log/$username-quiz-stats.txt")
read -a score_arr <<< "$get_quiz_score"
total_correct=${score_arr[0]}
total_wrong=${score_arr[1]}
#
clear
HEADING() {
total_winsub=$(( $total_correct + $total_wrong ))
if [[ $total_correct == "0" && $total_wrong == "0" ]]
then
	total_winrate="0"
else
	total_winrate=$(( $total_correct * 100 / $total_winsub ))
fi	
#cat $username-quiz-stats.txt
#echo "c : $total_correct | f : $total_wrong | $total_winsub"
echo "${color_magenta}|=========== .:| ${color_yellow}T O D O Q U I Z${color_magenta} |:. ===========|"
echo "+-----------------------------------------------+${color_reset}"
if [[ $total_winrate > "45" || $total_winrate == "100" ]]
then
	echo "${color_cyan}Quiz Winrate${color_reset} : ${color_green}$total_winrate%${color_reset}"
else
	echo "${color_cyan}Quiz Winrate${color_reset} : ${color_red}$total_winrate%${color_reset}"	
fi
echo "${color_cyan}Result Ratio${color_reset} : ${color_green}$total_correct${color_reset}/${color_red}$total_wrong${color_reset} out of ${color_magenta}$total_winsub${color_reset} games"
echo "${color_magenta}+-----------------------------------------------+${color_reset}"
}
MENU() {
echo "1) Start Quiz"
echo "2) Reset Carreer"
echo "3) Homepage"
echo "${color_magenta}+-----------------------------------------------+${color_reset}"
read -p "Type your ${color_yellow}command${color_reset} . . : " choice
echo "${color_magenta}+-----------------------------------------------+${color_reset}"
echo "${color_magenta}|===============================================|${color_reset}"
echo $ll
case $choice in
1)
	while true;
	do
		clear
		HEADING
		echo -n "Enter the amount of questions (max 30): "
		read lng
		vd='^[0-9]+$'
		if [[ $lng =~ $vd ]] && [[ $lng -le 30 ]] && [[ $lng -ge 1 ]];
		then
			break
		else
			echo ". . . . ."
			echo "Only 30 Questions ${color_red}maximum${color_reset} at a time !"
			echo "Make sure you type the amount in ${color_cyan}numeric${color_reset} only "
			echo $ll												
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "													
		fi		
	done
	numb=1
	while [ $numb != $(($lng + 1)) ]
	do
		clear
		HEADING
		echo "Anwser it in ${color_green}numeric character${color_reset} only"		
		echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
		echo "${color_cyan}Quiz Taken${color_reset}   : ${color_quiz}$numb${color_reset} out of ${color_magenta}$lng${color_reset}"
		echo "${color_magenta}+----------------------------------------:[${color_quiz}$numb${color_magenta}]:---${color_reset}"				
		RANDOMIZE
		numb=$(($numb + 1))
		echo $ll												
		echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
		read -sp "Press $sym_key_enter key to continue . . "										
	done
	#echo "You have answered $answered_c of $lng questions correctly."
	#echo ""
	#read
	;;
2)
	if [[ $total_correct == "0" && $total_wrong == "0" ]]
	then
		echo "It seems that you haven't take any ${color_cyan}quiz${color_reset} lately "
		echo "Take your quiz now, so you can see your own stats !"
		echo $ll												
		echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
		read -sp "Press $sym_key_enter key to continue . . "														
	else		
		ans_y="y"
		while [[ $choice2 != "y" || $choice2 != "Y" || $choice2 != "n" || $choice2 != "N" ]]
		do
			read -p "All of your quiz stats will be ${color_red}deleted${color_reset}, confirmed ? (${sym_y}/${sym_n}) . . " choice2
			if [[ $choice2 == "y" || $choice2 == "Y" || $choice2 == "n" || $choice2 == "N" ]]
			then
				break
			fi
		done	
		if [[ $choice2 == "y" ]]
		then	
			total_correct=0
			total_wrong=0
			echo ". . . . ."															
			echo "$total_correct#$total_wrong" | dd of="user-log/$username-quiz-stats.txt"	
			echo ". . . . ."															
			echo "You have empty your quiz stats ${sym_success}"
			echo $ll												
			echo "Press $sym_key_ctrl+$sym_key_z key to exit"					
			read -sp "Press $sym_key_enter key to continue . . "												
		fi
	fi
	;;
3)
	clear
	./transit_bash_test.sh 
	;;
*)
esac
}
#
#
answered_c=0
answered_f=0

function RANDOMIZE(){
RND=$(($RANDOM % 6))

case "$RND" in
	"0") FIRST
	;;
	"1") SECOND
	;;
	"2") THIRD
	;;
	"3") FOURTH
	;;																																																																																																																																																																																															
	"4") FIFTH
	;;
	"5") SIXTH
	;;
esac
}

FIRST(){
	a=$((($RANDOM % 4) + 8))
	b=$((($RANDOM % 3) + 3))
	r=$((($RANDOM % 7) + 3))
	ii=$(($RANDOM % 2))

	aa=$(($a+1))
	bb=$(($b+1))

	for i in {3..1}
	do
		a=$(($a - $i))
		b=$(($b + $i))	
		if [ ii == 0 ]; then
			c=$((($a * $b) + $r))
		else
			c=$((($a * $b) - $r))
		fi	
		echo "$a, $b = $c"
	done
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
	echo "${sym_q} : $aa, $bb, = ?"
	if [ ii == 0 ]; then
		c=$((($aa * $bb) + $r))
	else
		c=$((($aa * $bb) - $r))
	fi	
	CORRECTANSWER $c
}

SECOND(){
	a=$((($RANDOM % 4) + 10))
	b=$((($RANDOM % 3) + 2))
	r=$(($RANDOM % 3))

	aa=$(($a - 3))
	bb=$(($b + 2))

	if [ $aa == $bb ]; then
		aa=$(($aa + 1))
	fi

	for i in {3..1}
	do
		a=$((($a - ($i+1)) + $r))
		b=$(($b + ($i + $r)))

		c=$((($a * $a) + ($b * $b)))

		echo "$a, $b = $c"
	done
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
	echo "${sym_q} : $aa, $bb = ?"
	c=$((($aa * $aa) + ($bb * $bb)))

	CORRECTANSWER $c
}

THIRD(){
	r=$(($RANDOM % 7))
	inc=$((($RANDOM % 30) + 10))
	value=$((($RANDOM % 25) + 15))

	for i in {0..6}
	do
		x=$(($i * $inc))
		arr[$i]=$(($value + $x)) #-input the value to array
	
		if [ $i == $r ]; then
			c=${arr[$i]}	 #-place the answer to c
			arr[$i]=${color_cyan}X${color_reset}	 #-replace the value of array to x
		fi
	done

	echo ${arr[@]}
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
	echo "${sym_q} : What number is X ?"

	CORRECTANSWER $c
}

FOURTH(){
	r=$(($RANDOM % 5))
	mul=$((($RANDOM % 3) + 2))
	value=$((($RANDOM % 8) + 4))

	for i in {0..4}
	do
		a=$(($i + $mul))
		value=$(($value * a))

		arr[$i]=$value
	
		if [ $i == $r ]; then
			c=${arr[$i]}	 #-place the answer to c
			arr[$i]=${color_cyan}X${color_reset}	 #-replace the value of array to x
		fi
	done

	echo ${arr[@]}
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
	echo "${sym_q} : What number is X ?"

	CORRECTANSWER $c
}

FIFTH(){
	a=$((($RANDOM % 5) + 4))

	while :
	do
		b=$((($RANDOM % 8) + 5))
		
		if [ $a != $b ]; then
			break
		fi
	done

	while :
	do
		c=$((($RANDOM % 7) + 5))
	
		if [[ $c != $a && $c != $b ]]; then
			break
		fi
	done

	r=$(($RANDOM % 4))
	
	case "$r" in
		"0")
			ab=$(($a + $b))
			bc=$(($b + $c))
			bb=$(($b + $b))
			x=$(($a + $c))
			
			echo "A + B = $ab"
			echo "B + C = $bc"
			echo "B + B = $bb"
			echo "${color_magenta}+-----------------------------------------------+${color_reset}"				
			echo "${sym_q} : A + C = ?"
		;;
		"1")
			ab=$(($a * $b))
			bc=$(($b * $c))
			bb=$(($b * $b))
			x=$(($a * $c))
			
			echo "A x B = $ab"
			echo "B x C = $bc"
			echo "B x B = $bb"
			echo "${color_magenta}+-----------------------------------------------+${color_reset}"				
			echo "${sym_q} : A x C = ?"
		;;
		"2")
			ab=$(($a + $b))
			bc=$(($b + $c))
			ac=$(($a + $c))
			
			echo "A + B = $ab"
			echo "B + C = $bc"
			echo "A + C = $ac"
			
			ii2=$(($RANDOM % 3))
			case "$ii2" in
				"0")
					x=$(($a * 2))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"	
					echo "${sym_q} : A + A = ?"
				;;
				"1")
					x=$(($b * 2))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"						
					echo "${sym_q} : B + B = ?"
				;;
				"2")
					x=$(($c * 2))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"						
					echo "${sym_q} : C + C = ?"
				;;
			esac
		;;
		"3")
			ab=$(($a * $b))
			bc=$(($b * $c))
			ac=$(($a * $c))
			
			echo "A x B = $ab"
			echo "B x C = $bc"
			echo "A x C = $ac"
			
			ii3=$(($RANDOM % 3))
			case "$ii3" in
				"0")
					x=$(($a * $a))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"						
					echo "${sym_q} : A x A = ?"
				;;
				"1")
					x=$(($b * $b))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"						
					echo "${sym_q} : B x B = ?"
				;;
				"2")
					x=$(($c * $c))
					echo "${color_magenta}+-----------------------------------------------+${color_reset}"						
					echo "${sym_q} : C x C = ?"
				;;
			esac
		;;
	esac
	
	CORRECTANSWER $x
}

SIXTH(){
	r=$(($RANDOM % 6))
	pl=$((($RANDOM % 20) + 10))
	mul=$((($RANDOM % 2) + 2))
	value=$((($RANDOM % 8) + 8))

	arr[0]=$value
	arr[1]=$(($value + $pl))
	arr[2]=$((${arr[0]} * $mul))
	arr[3]=$((${arr[2]} + $pl))
	arr[4]=$((${arr[2]} * $mul))
	arr[5]=$((${arr[4]} + $pl))

	for i in {0..5}
	do
		if [ $i == $r ]; then
			c=${arr[$i]}
			arr[$i]=${color_cyan}X${color_reset}
		fi
	done

	echo ${arr[@]}
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"		
	echo "${sym_q} : What number is X ?"

	CORRECTANSWER $c
}

CORRECTANSWER(){
	answer=$1
	while true;
	do
		echo -n "${sym_a} : "
		read jwb
		vd='^[0-9]+$'	
		if [[ $jwb =~ $vd ]]
		then
			break
		fi
	done
	echo "${color_magenta}+-----------------------------------------------+${color_reset}"	

	if [[ $jwb == $answer ]]; then
		correct=true
		echo "You are ${color_green}Correct${color_reset} !"
		job_rand=$(($RANDOM % 4))
		case $job_rand in
		0)
			job="a ${color_quiz}Doctor${color_reset} !"
			;;
		1)
			job="a ${color_quiz}Pilot${color_reset} !"
			;;
		2)
			job="my ${color_quiz}Senpai${color_reset} !"
			;;
		3)
			job="a ${color_quiz}Pegasus${color_reset} !"
			;;
		esac								
		echo "Keep it up, so you can be $job"
		#answered_c=$(($answered_c + 1))
		answered_c=1
		answered_f=0
	else
		correct=false
		echo "You are ${color_red}Incorrect${color_reset} !"
		echo "The correct answer is ${color_green}$answer${color_reset}"
		#answered_f=$(($answered_f +1))
		answered_f=1
		answered_c=0
	fi
	#echo "${color_magenta}+-----------------------------------------------+${color_reset}"	
	total_correct=$(( $answered_c + $total_correct ))
	total_wrong=$(( $answered_f + $total_wrong ))
	echo ". . . . ."
	echo "$total_correct#$total_wrong" | dd of="user-log/$username-quiz-stats.txt"														
}
BANNER() {
	echo "+----------------------------+"
	echo "------------------------------"
}
#--------------------------
#-END OF FUNCTION SECTION
#--------------------------
HEADING
MENU
#
done
