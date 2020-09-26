#! /bin/bash

typing() {

	echo "JONI : aku selalu makan buah $nama_buah, $jumlah_buah biji"
	nama_buah="apel"; jumlah_buah="12"
	echo "JONI : eh maaf, aku selalu makan buah $nama_buah, $jumlah_buah biji"

	jumlah_buah=$((jumlah_buah+5))
	echo "BOJO : kamu kalah, aku selalu makan buah $nama_buah, $jumlah_buah biji"

}

assigning_values_declare() {

	var1=foo        # OK
	var2="foo oof"  # OK
	var3=foo off    # WRONG
	var4 =foo       # WRONG
	var5= foo       # WRONG

	echo "$var1, $var2, $var3, $var4, $var5"

}

assigning_values_read_1() {

	read -p "SISWA : nama lengkap saya adalah " nama_depan nama_belakang	
	nama_panggilan=${nama_depan:0:3}
	echo    "DOSEN : oh baik $nama_depan, kamu adalah marga $nama_belakang ya"
	echo    "      : kalau begitu kamu saya panggil $nama_panggilan!"

}

assigning_values_read_2() {

	read get_line < "dummy-sample/readme.txt"
	while read pass_file
	do
		get_file+=$pass_file
	done < "dummy-sample/readme.txt"

	printf "the first line of readmet.txt is   : $get_line\n\n"
	printf "the full content of readmet.txt is : $get_file\n"


}

assigning_values_subt() {

	get_day=$(date +'%A, %d %B %Y') 
	get_time_later=$(date -d '+4 hour' +'%H:%M')
	get_time_now=$(date +'%H:%M')
	printf "today is $get_day\n"
	printf "and i have a meeting in $get_time_later\n"

}
	
passing_args() {

	printf "this file is called $0\n---------\n"
	printf "my name is $1, and my hobby is $2\n"
	printf "im sorry, my real hobbies are $2, $3, $4, and more !\n"

	printf "Here are the list of my hobbies:\n"
	get_hobbies="$@"
	for each_hobby in $get_hobbies
	do
		echo "- $each_hobby"
	done 
	##passing_args $@

}


return_code() {

	echo -n "STATUS | "
	get_list=$(ls -l /home/cookie/)
	get_result=$?
	echo "$get_list"	
	echo "return list result: $get_result"
	echo ""

	echo -n "STATUS | "
	get_file=$(cat /home/cookie/gitrepo/readme.txt)
	get_result=$?
	echo "return file result: $get_result"

}

assigning_values_read_3() {

	read -p "what is your account ? " account
	read username password create_date role < "dummy-sample/$account-userlogin.txt"
	echo "username : $username"
	echo "password : $password"
	echo "job-role : $role"
	echo "registed successfully at $create_date"

}

unset_variabel() {

	var="hello world"
	echo "STATUS: hello, my message is, $var"

	unset var
	if [ -z "$var" ] # check if variable is empty
	then
		echo "STATUS: sorry, i don't have any message"
	else
		echo "STATUS: and again, my message is, $var"		
	fi

}

getopts() {

	check=""
	while getopts ":hu:p:" flag
	do
		case "${flag}" in
			h)
				echo "this is the help section"
				echo "usage : -u, specify the username"			
				echo "      : -p, specify the password"
				echo "      : avoid any whitespace for both input!"
				;;
			u)
				get_user=${OPTARG}
				check+="yes"
				;;
			p)
				get_pass=${OPTARG}
				check+="yes"
				;;			
		esac
	done

	if [[ $check == "yesyes" ]]
	then
		echo "username : $get_user"
		echo "password : $get_pass"
		echo "You have successfully logged in!"
	else
		echo "options are required. go -h for more help"
	fi

}

debugging() {

	echo "error is occured in '$0'"
	echo "in section '${FUNCNAME[0]}()', at line ${LINENO} of ${BASH_LINENO[0]}"

}

random() {

	min=10
	max=50
	range=$(($max-$min+1))
	loop=$(seq 1 5)

	echo "Randomize your number and unique serial code:"
	for i in $loop
	do
		getrand_str=""
		getrand_str+=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)		
		getrand_num=$(($RANDOM%$range+$min))

		for m in $loop
		do
			getrand_str+="-"			
			getrand_str+=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
		done
		echo "$i. $getrand_num/$max  --  $getrand_str"
	done

}

reply() {

	echo "Jame: Good morning. What is your name, kid ? "
	read -p "xxxx: my name is "
	nickname=${REPLY:0:4}	
	echo "Jame: oh, hi $nickname! are you one of my students ?"
	echo "$nickname: yes sir, im in class CS120 with Kirl Hughe, your son lmao"

}

checkdir() {

	read -p "username: " username
	read -s -p "password: " password
	printf "\n---\n"

	log_path="dummy-sample/account-regist.log"
	get_date=$(date +'%d-%m-%Y') 	
	acc_check="FALSE"	
	if [ -e $log_path ] # cek apakah file sudah ada
	then
		while IFS= read -r get_line # read berdasarkan line dari file
		do
			IFS="#"	# pisah kalimat berdasarkan tanda '#'
			read -a get_info <<< "$get_line"
			if [[ $username == ${get_info[1]} && $password == ${get_info[2]} ]]
			then
				printf "Logged on successfully!\n"
				printf "Welcome, $username!\n"
				acc_check="TRUE"
				break
			fi
		done < $log_path
		if [[ $acc_check == "FALSE" ]]
		then
			read -p "detecting new account. create one (y/n) ? " answer
			if [[ $answer == "y" ]]
			then
				printf "#$username#$password#$get_date#user\n" >> $log_path
				printf "Create account successfully!\n"	
			fi
		fi		
	fi
}

checkdir
#pwd
#list
#check file


#checkdir
#writefile
#ifs
