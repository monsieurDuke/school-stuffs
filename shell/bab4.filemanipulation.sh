#!/bin/bash
# ---------
# od, cut, echo, paste, pr
# printf, fmt, head, tail

list_path=".load.lst"
while : 
do
	clear	
	echo "+--------------------------------------------+"				
	echo "| cut  @| od     @| echo  x| printf  x| pr  x|"
	echo "| fmt  x| paste  x| head  x| tail    x| wc  x|"
	echo "| shuf x| sort   x| tr    x| uniq    x| ..   |"
	echo "+--------------------------------------------+"		
	echo "| [EDIT] : TXT // STR // LS // EXT           |"          
	echo "+--------------------------------------------+"	
	echo "::::::::::::::::::::::::::::::::::::::::::::::"		
	while :
	do
		read -p ">> " opsi
		case $opsi in
			"txt"|"TXT")
				read -p ":: -- LOAD FILE(S) : " file
				fl_list=$(ls -lah $file)				
				if [[ "$file" && "$fl_list" ]]
				then
					echo "$fl_list" > "$list_path"
					wc_get=$(cat $list_path | wc -l)
					echo ":: -- SELECTED FILE ($wc_get) ..."
					while IFS= read -r get_list
					do
						echo ":: -- $get_list"						
					done < $list_path
					echo ""										
				else
					unset file
				fi
				;;
			"STR"|"str")
				read -p ":: -- INSERT STRING : " string
				if [[ "$string" ]]
				then
	  			   	echo ":: -- VARIABLE HAVE BEEN SET, ${#string} chars ..."					
					echo ""	  			   	
				else
					unset string
				fi
				;;							
			"LS"|"ls")
				pwd=$(pwd)
				read -p ":: -- VIEW DIRECTORY (current) : " dir
				if [ ! $dir ]
				then
					path_dir=$pwd
					path_dir=$(realpath -s "$path_dir")					
				else
					path_dir=$(realpath -s "$dir")					
				fi
				echo ":: -- LISTED DIRECTORY : $path_dir/"
				echo "--"
				ls $dir
				echo ""
				;;		
			"EXT"|"ext")
				exit 0
				;;				
			"cut")
				if [[ "$file" ]]
				then
					read -p ":: -- [-c] ENTER CHAR  : " cut_c_o			
					read -p ":: -- [-d] ENTER DELI  : " cut_d_o
					read -p ":: -- [-f] ENTER FIELD : " cut_s_o
					if [[ "$cut_d_o" == "space" ]]
					then
						cut_d_o=" "
					fi
					if [[ "$cut_d_o" && "$cut_c_o" && "$cut_s_o" ]]
					then
						cut_c=$(cut -c $cut_c_o $file)
						cut_d=$(cut -d "$cut_d_o" -f $cut_s_o $file)
						cut_s=$(cut -s -d "$cut_d_o" -f $cut_s_o $file)
						echo "--"
						printf "[-c] : print only selected characters\n$cut_c\n--\n"
						printf "[-d] : print chopped-string by delimiter\n$cut_d\n--\n"
						printf "[-s] : print lines that only contain delimiter\n$cut_s\n\n"
					fi
				fi
				;;
			"od")
				if [[ "$file" ]]
				then
					read -p ":: -- [-w] ENTER WIDTH : " od_w_o					
					if [[ "$od_w_o" ]]
					then
						od_w_o="-w$od_w_o"
						od_b=$(od -Ax -b $file)
						od_c=$(od -Ax -c $file)
						od_w=$(od $od_w_o -Ax -c $file)
						echo -e "--\n[-b] : print ASCII code in octal byte format"
						echo "$od_b"
						echo -e "--\n[-c] : print characters and their backslash escapes"						
						echo "$od_c"
						echo -e "--\n[-w] : print output in a fix width of column"												
						echo "$od_w"
						echo ""
					fi
				fi
				;;
			"echo")
				for i in `seq 1 3`
				do
					echo_n+=$(echo -n "\t$string\n")
					echo_E+=$(echo -E "\t$string\n")
					echo_e+=$(echo -e "\t$string\n")
				done
				printf "echo -n : \n$echo_n\n\n"
				printf "echo -E : \n$echo_E\n\n"
				printf "echo -e : \n$echo_e\n\n"			
				;;
			"head")
				head_n=$(head -n 5 $file)
				head_c=$(head -c 50 $file)
				head_v=$(head -v $file)
				printf "head -n 5  : print lines from top\n$head_n\n\n"
				printf "head -c 50 : print chars to certain limit \n$head_c\n\n"
				printf "head -v    : print header of file\n$head_v\n\n"			
				;;			
			"tail")
				tail_n=$(tail -n 5 $file)
				tail_c=$(tail -c 50 $file)
				tail_v=$(tail -v $file)
				printf "tail -n 5  : print lines from top\n$tail_n\n\n"
				printf "tail -c 50 : print chars to certain limit \n$tail_c\n\n"
				printf "tail -v    : print header of file\n$tail_v\n\n"			
				;;	
			"paste")
				paste_d=$(paste -d ",|" $file)
				paste_s=$(paste -s -d ":" $file)
				printf "paste -d ',|' : merge files with delimter symbol\n$paste_d\n\n"
				printf "paste -s      : merge\n$paste_s\n\n"			
				;;					
			"clear")
				break
				;;
		esac
	done
done

