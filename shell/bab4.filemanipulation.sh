#!/bin/bash
# ---------
# od, cut, echo, paste, pr
# printf, fmt, head, tail

list_path=".load.lst"
while : 
do
	clear	
	echo "+--------------------------------------------+"				
	echo "| cut  @| od     @| echo  @| printf  x| pr  x|"
	echo "| fmt  x| paste  x| head & tail      @| wc  x|"
	echo "| shuf x| sort   x| tr    x| uniq    x| ..   |"
	echo "+--------------------------------------------+"		
	echo "| [OPTS] : TXT // STR // LS // EXT // CLEAR  |"          
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
					echo -e ":: -- SELECTED FILE ($wc_get) ...\\n--"
					while IFS= read -r get_list
					do
						echo "$get_list"						
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
				if [[ "$string" ]]
				then
					echo -e "--\n[-n] : print strings without adding trailing newlines"					
					for i in `seq 1 3`
					do
						echo -n "$string"
					done
					echo ""
					echo -e "--\n[-E] : print strings without interprating backslash escpases (default)"					
					for i in `seq 1 3`
					do
						echo -E "$string"
					done
					echo -e "--\n[-e] : print strings with interprating backslash escpases"															
					for i in `seq 1 3`
					do
						echo -e "$string"
					done
					echo ""
				fi
				;;
			"ht")
				if [[ "$file" ]]
				then
					read -p ":: -- [-n] ENTER HEIGHT (H) : " h_n			
					read -p ":: -- [-n] ENTER HEIGHT (T) : " t_n			
					read -p ":: -- [-c] ENTER CHAR (H)   : " h_c			
					read -p ":: -- [-c] ENTER CHAR (T)   : " t_c			
					if [[ "$h_n" && "$h_c" && "$t_c" && "$t_n" ]]
					then
						ht_n=$(head -n $h_n $file | tail -n $t_n)
						ht_c=$(head -c $h_c $file | tail -c $t_c)
						ht_v=$(head -v $file)
						echo -e "--\\n[-n] : print lines within a range from top and bottom\\n$ht_n"
						echo -e "--\\n[-c] : print characters within a range from top and bottom\\n$ht_c"
						echo -e "--\\n[-v] : print the file names as the header\\n$ht_v\\n"
					fi
				fi
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

