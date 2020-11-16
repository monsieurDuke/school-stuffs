#!/bin/bash
#------------------
while :
do
	clear
	echo "| basename @| date    @| dirname  @| factor  | identity  |"
	echo "| groups    | getent   | logger    | md5sum  | mkfifo    |"
	echo "| netcat    | ssh-scp  | openssl   | nohup   | seq       |"
	echo "| timeout   | uname    | uuencode  | xargs   | yes       |"
	echo "| telnet    | ping     | sleep     | ..      | ..        |"
	echo "----------------------------------------------------------"
	while :
	do
		read -p ">> " ans
		case $ans in
			"clear")
				break
				;;
			"basename")
				#cek kalau direktori doang
				echo "--"
				echo "PWD : $PWD"
				read -p "INSERT PATH   : " b_path
				read -p "INSERT SUFFIX : " b_suff
				if [[ "$b_path" && "$b_suff" && -d "$b_path" ]]
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
					echo -e "[ basename ] : strip the last directory from the path | $base_n\\n--" #no opsi								
					echo -e "[ basename -s $b_suff ] : remove suffix from the files\\n--\\n$paste_base_s\\n--"   #suffix
					echo -e "[ basename -az ] : change newline into null space\\n--\\n$getb_z"
					rm .base_s.tmp.*
				fi
				echo ""
				;;
			"date")
				date_a=$(date +'%D')
				date_b=$(date +'%T')
				date_c=$(date +'%A, %d %B %Y %r')
				echo "--"
				echo -e "[ date %D ] : custom date opts       | $date_a"
				echo -e "[ date %T ] : custom time opts       | $date_b"
				echo -e "[ date %A, %d %B %Y %r ] : more opts | $date_c\\n"
				;;
			"dirname")
				echo "--"
				echo "PWD : $PWD"				
				read -p "INSERT PATH : " d_path
				echo "--"
				if [[ "$d_path" && -d "$d_path" || -e "$d_path" ]]
				then
					dir_n=$(dirname "$d_path")
					dir_l=$(ls -l $dir_n)					
					echo -e "[ dirname ] : show previous directory | $dir_n\\n--\\n$dir_l"
				fi
				echo ""
				;;
		esac
	done
done