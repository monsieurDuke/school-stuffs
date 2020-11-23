#!/bin/bash
#------------------
# run in root lmao
#------------------
if [[ "$UID" -eq "0" ]]
	then
	nohup tail -f /var/log/apt/history.log &> "process/tail-apt.log" &
	while :
	do
		clear
		echo -e "RUNNING NOHUP ...\\n---------------------------------------------------------"	
		echo "| basename @| date    @| dirname  @| openssl @| id/grp @|"
		echo "| nano     @| getent  @| logger   @| md5sum  @| mkfifo  |"
		echo "| netcat   @| ssh-scp  | factor   @| nohup   @| seq     |"
		echo "| timeout   | uname   @| uuencode  | xargs    | yes     |"
		echo "| telnet    | ping    @| sleep    @| ..       | ..      |"
		echo "---------------------------------------------------------"
		while :
		do
			read -p ">> " ans
			case $ans in
				"clear")
					break
					;;
				"ls")
					pwd=$(pwd)
					echo "--"
					read -p ":: VIEW DIRECTORY (current) : " dir
					if [ ! $dir ]
					then
						path_dir=$pwd
						path_dir=$(realpath -s "$path_dir")					
					else
						path_dir=$(realpath -s "$dir")					
					fi
					echo ":: LISTED DIRECTORY : $path_dir/"
					echo "--"
					ls $dir
					echo ""
					;;					
				"nano")
					echo "--"
					read -p ":: INSERT FILE : " nan_f
					nano $nan_f
					echo ""
					;;	
				"basename")
					#cek kalau direktori doang
					echo "--"
					echo -e ":: CURRENT DIR : $PWD"
					read -p ":: INSERT PATH : " b_path
					read -p ":: INSERT SUFF : " b_suff
					if [[ "$b_path" && "$b_suff" ]]
					then
						ext_path=$b_path
						len_path=${#b_path}
						lst_suff=$((--len_path))
						if [[  "${b_path:$lst_suff}" != "/" ]] 
						then
							ext_path+="/"
						fi
						ext_path+="*"					
						base_n=$(basename "$b_path")				
						base_s=$(basename -s $b_suff $ext_path > .base_s.tmp)
						base_z=$(basename -az $ext_path > .base_z.tmp)		
						remv_z=$(tr < .base_z.tmp -d '\000' > .base_z.tmp.2)
						getb_z=$(cat .base_z.tmp.2)
						inc=1
						while IFS= read -r get_list
						do
							for i in `seq 1 30`
							do
								if [[ ${#get_list} -le 28 ]]
								then
									get_list+=" "
								fi
							done
							echo "$get_list" >> ".base_s.tmp.$inc"						
							inc=$((++inc))
							if [[ "$inc" -gt 3 ]]
							then
								inc=1
							fi
						done < .base_s.tmp
						paste_base_s=$(paste -d " " .base_s.tmp.1 /dev/null .base_s.tmp.2 /dev/null .base_s.tmp.3)
						echo "--"
						echo -e "PATH : $b_path >>\\n     : $base_n\\n--" #no opsi								
						echo -e "REMOVE SUFFIX '$b_suff' : \\n--\\n$paste_base_s\\n--"   #suffix
						echo -e "REMOVE NEWLINE : \\n--\\n$getb_z"
						rm .base_s.tmp.*
					fi
					echo ""
					;;
				"date")
					date_a=$(date +'%D - %j/366')
					date_b=$(date +'%T %p')
					date_c=$(date +'%A, %d %B %Y %r')
					echo "--"
					echo -e "DATE OPTS : $date_a"
					echo -e "TIME OPTS : $date_b"
					echo -e "MIX OPTS  : $date_c\\n"
					;;
				"dirname")
					echo "--"
					echo -e ":: CURRENT DIR : $PWD"
					read -p ":: INSERT PATH : " d_path
					echo "--"
					if [[ "$d_path" && -d "$d_path" || -e "$d_path" ]]
					then
						dir_n=$(dirname "$d_path")
						echo -e "PATH : $d_path >> \\n     : $dir_n"
					fi
					echo ""
					;;
				"factor")
					echo "--"
					read -p ":: INSERT NUMBER(1) : " num1
					read -p ":: INSERT NUMBER(2) : " num2		
					if [[ "$num1" && "$num2" ]]
					then
						echo "--"
						f_1=$(factor $num1 | cut -d ":" -f 2)
						f_2=$(factor $num2 | cut -d ":" -f 2)
						echo -e "FACTOR-1 :$f_1 ($num1)\\nFACTOR-2 :$f_2 ($num2)"
					fi
					echo ""
					;;
				"id")
					# ls /home/ , id -u [user], id -g
					id_list=$(ls -l /home)
					echo -e "--\\n$id_list\\n--"
					read -p ":: SELECT USER : " id_usr
					if [[ "$id_usr" ]]
					then
						echo "--"
						id_uid=$(id -u $id_usr)
						id_num=$(id -r -G $id_usr)
						id_nam=$(id -r -nG $id_usr)		
						IFS=" "
						read -a get_num <<< "$id_num"											
						read -a get_nam <<< "$id_nam"															
						len=$((${#get_nam[@]}-1))
						inc=0
						echo -e "USER  : $id_usr($id_uid)\\nGROUP :\\n--"
						while [[ $inc -le $len ]]
						do
							echo -en "- ${get_nam[$inc]}(${get_num[$inc]}) \\t"
							inc=$((++inc))
							if [[ $inc%3 -eq 0 ]]
							then
								echo ""
							fi					
						done				
						echo ""
					fi
					echo ""
					;;
				"getent")
					id_list=$(ls -l /home)
					echo -e "--\\n$id_list\\n--"
					read -p ":: SELECT USER : " gnt_usr
					if [[ "$gnt_usr" ]]
					then
						echo "--"
						getent_h=$(getent hosts)
						getent_g=$(getent group $gnt_usr)
						getent_p=$(getent passwd $gnt_usr)
						echo -e "HOSTS : \\n--\\n$getent_h\\n--"
						echo -e "GROUP : $getent_g"
						echo -e "PASSW : $getent_p"
					fi
					echo ""
					;;
				"logger")
					#logger [input] , logger -f [file] , logger -t [tag]
					id_list=$(ls -l process/ | grep -e "log" -e "total")
					echo -e "--\\n$id_list\\n--\\n:: SYSLOG FILE : /var/log/syslog\\n--"
					read -p ":: INSERT TAG  : " log_t
					read -p ":: INSERT HEAD : " log_m				
					read -p ":: INSERT FILE : " log_f
					if [[ "$log_m" && "$log_f" && "$log_t" && -e "$log_f" ]]
					then
						echo "--"
						get_logf=$(cat "$log_f" | tail -n 5 > .log.tmp)
						logger -t "$log_t" "<<< $log_m ($log_t:$UID) >>>"
						logger -t "$log_t" -f .log.tmp
						get_all=$(cat /var/log/syslog | tail -n 10)
						echo -e "$get_all"
					fi
					echo ""
					;;
				"md5sum")
					# md5sum file.txt > file.md5 | md5sum -c file.md5
					echo "--"
					read -p ":: CHECK OR CREATE FILE ? (ch/cr) : " md_opt
					read -p ":: INSERT FILE : " md_source				
					chck_file=$(exec ls $md_file 2>&1)
					if [[ "$md_source" && "$chck_file" != *"cannot access"* ]]
					then
						case $md_opt in
							"ch")
								echo "--"
								md_file=$md_source
								md_lst=$(md5sum -c $md_file 2>/dev/null | cut -d ":" -f 1 | tr -s '\n' ' ')
								md_hsh=$(md5sum $md_file | cut -d " " -f 1)
								md_stt=$(md5sum -c $md_file 2>/dev/null | cut -d ":" -f 2 | tr -s '\n' ' ')
								echo -e "MD5 FILE : $md_file ( $md_lst)"
								echo -e "MD5 HASH : $md_hsh"
								echo -e "MD5 STAT :$md_stt"
								;;
							"cr")
								read -p ":: INSERT NAME : " md_file
								md_file+=".md5"
								md5sum $md_source > $md_file
								echo "--"
								md_lst=$(md5sum -c $md_file | cut -d ":" -f 1 | tr -s '\n' ' ')
								md_hsh=$(md5sum $md_file | cut -d " " -f 1)
								echo -e "MD5 FILE : $md_file ( $md_lst)"
								echo -e "MD5 HASH : $md_hsh"
								;;
						esac
					fi				
					echo ""
					;;
				"netcat")
					## ncat -l -p 8080 > [filename] /opsi listen atau send
					ipad=$(ifconfig | grep inet | head -1 | tr -s '\t' ' ' | cut -d ' ' -f 3)
					ipnm=$(ifconfig | grep inet | head -1 | tr -s '\t' ' ' | cut -d ' ' -f 5)
					echo -e "--\\n:: HOST IP ADD : $ipad $ipnm"
					read -p ":: SEND OR RECIEVE FILE ? (se/re) : " nt_opt
					echo "--"
					read -p ":: INSERT FILE : " nt_file
					read -p ":: INSERT DEST : " nt_dest
					read -p ":: INSERT PORT : " nt_port
					chck_file=$(exec ls $nt_file 2>&1)				
					if [[ "$nt_file" && "$nt_dest" && "$nt_port" ]]
					then
						case $nt_opt in
							"re")
								echo -e "--\\nLISTENING FROM : $nt_dest:$nt_port ..."
								echo -e "SELECTED FILE  : $nt_file ..."
								ncat -l --recv-only $nt_dest -p $nt_port -w1 > $nt_file &
								;;
							"se")
								chck_file=$(exec ls $nt_file 2>&1)
								if [[ "$chck_file" != *"cannot access"* ]]
								then				
									echo -e "SPEAKING TO   : $nt_dest:$nt_port ..."
									echo -e "SELECTED FILE : $nt_file ..."
									ncat --send-only $nt_dest -p $nt_port < $nt_file
								fi
								;;
						esac
					fi
					echo ""
					;;
				"uname")
					echo "--"
					una_machine=$(uname -r -i -n)
					una_kernel=$(uname -s -o)
					una_proces=$(lshw -short 2>&1 | grep proc | tr -s '\t' ' ' | cut -d ' ' -f 3-)
					lscp_machine=$(lscpu | grep vendor | tr -s '\t' ' ' | cut -d ' ' -f 3)
					echo "MACHINE : $lscp_machine $una_machine"
					echo "PROCSSR : $una_proces"				
					echo "KERNEL  : $una_kernel"
					echo ""
					;;
				"ping")
					# ping -c [sequence] -i [interval] -D [dest] / 
					ipad=$(ifconfig | grep inet | head -1 | tr -s '\t' ' ' | cut -d ' ' -f 3)
					ipnm=$(ifconfig | grep inet | head -1 | tr -s '\t' ' ' | cut -d ' ' -f 5)
					echo -e "--\\n:: HOST IP ADD : $ipad $ipnm\\n--"
					read -p ":: INSERT DEST : " png_dest
					read -p ":: INSERT INTV : " png_intv
					read -p ":: INSERT SEQC : " png_seqc
					if [[ "$png_seqc" && "$png_dest" && "$png_seqc" ]]
					then
						echo "--"
						ping -c $png_seqc -i $png_intv -D $png_dest
					fi
					echo ""
					;;
				"nohup")
					# nohup apt-get (install/remove) [package] &> file .log &
					echo "--"				
					read -p ":: REMOVE OR INSTALL PACKAGE ? (re/in) : " nhp_opt
					echo "--"
					read -p ":: INSERT PACKAGE : " package
					echo -e ":: LOGGING PATH   : /process/tail-apt.log\\n--"
					case $nhp_opt in
						"re")
							check1=$(exec apt-get remove "$package" -y 2>&1)
							check2=$(echo "$check1" | grep "E:")
							if [[ "$check2" == *"E:"* ]]
							then
								continue
							fi
							;;
						"in")
							check1=$(exec apt-get install "$package" -y 2>&1)
							check2=$(echo "$check1" | grep "E:")
							if [[ "$check2" == *"E:"* ]]
							then
								continue
							fi
							;;
					esac
					get_aptlog=$(cat process/tail-apt.log | uniq -w 1 | tail -n 5 > nohup.tmp);										
					while IFS= read -r get_line
					do
						if [[ "$get_line" ]]
						then
							echo "$get_line"
						fi
					done < nohup.tmp
					echo ""
					;;
				"sleep")
					echo "--"
					read -p ":: INSERT NUMBER : " sleep_num
					read -p ":: INSERT SUFFIX : " sleep_suf
					echo "--"
					if [[ "$sleep_num" && "$sleep_suf" == 's' || "$sleep_suf" == 'm' || "sleep_suf" == 'h' && "$sleep_suf" == 'd' ]]
					then
						sleepstart=$(date +'%X.%N' | cut -c -13)
						echo "SLEEP STARTED : $sleepstart"
						sleep $sleep_num$sleep_suf
						sleepend=$(date +'%X.%N' | cut -c -13)
						echo -e "SLEEP STOPPED : $sleepend"				
					fi
					echo ""
					;;
				"openssl")
	                key_list=$(ls -l | grep -e ".key" -e "total")
	                echo -e "--\\n$key_list\\n--"
					read -p ":: ENCIPHER OR DECIPHER TEXT ? (en/de) : " ssl_ci_opt
					read -p ":: IMPORT OR CREATE KEY ? (im/cr)      : " ssl_ke_opt
					echo "--"
					if [[ "$ssl_ci_opt" && "$ssl_ke_opt" ]]
					then
						case $ssl_ke_opt in
							"im")
								read -p ":: INSERT KEY : " ssl_keyfile	
								echo "--"
								ssl_check=$(openssl rsa -check -in "$ssl_keyfile" | head -n 1)
								echo "$ssl_check"
								stat="cont"
								;;
							"cr")
								read -p ":: INSERT NEW KEY  : " ssl_keyfile
								read -p ":: INSERT AES BIT  : " ssl_aesbit
								read -p ":: INSERT KEY SIZE : " ssl_keybit
								echo -e ":: PREPARING KEY   : $ssl_keyfile > $ssl_keyfile.key\\n--" 
								ssl_keyfile+=".key"
								openssl genrsa -aes"$ssl_aesbit" -out "$ssl_keyfile" "$ssl_keybit"
								stat="cont"
								;;
						esac
						if [[ "$stat" == "cont" ]]
						then
							echo "--"
							read -p ":: INSERT SOURCE FILE : " src_file						
							case $ssl_ci_opt in
								"en")
									out_file="$src_file.enc"
									chpr_act="-encrypt"
									stat="cont2"
									echo ":: PREPARING CIPHER   : $src_file > $out_file"
									;;
								"de")
									out_file="$src_file.dec"
									chpr_act="-decrypt"
									stat="cont2"
									echo ":: PREPARING DECIPHER : $src_file > $out_file"																		
									;;
							esac
							if [[ "$stat" == "cont2" ]]
							then
								openssl rsautl $chpr_act -inkey $ssl_keyfile -in $src_file -out $out_file
								disp_out=$(cat $out_file)
								echo -e "--\\n$disp_out"
							fi
						fi
					fi
					echo ""
					;;
			esac
		done
	done
else
	echo "This program requires root access"
	echo "Exitting ..."
	exit 0
fi

