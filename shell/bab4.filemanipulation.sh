#!/bin/bash
# ---------
# od, cut, echo, paste, pr
# printf, fmt, head, tail

list_path=".load.lst"
while : 
do
	clear	
	echo "+--------------------------------------------+"				
	echo "| cut  @| od     @| echo  @| printf  @| pr  @|"
	echo "| fmt  x| paste  @| head & tail      @| wc  @|"
	echo "| shuf x| sort   x| tr    x| uniq    x| ..   |"
	echo "+--------------------------------------------+"		
	echo "| [OPTS] : TXT // STR // NUM // LS // EXT // |"          
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
			"NUM"|"num")
				read -p ":: -- INSERT NUMBER : " number
				re='^[+-]?[0-9]+([.][0-9]+)?$'
				if [[ "$number" ]]
				then
	  			   	echo ":: -- VARIABLE HAVE BEEN SET, ${#number} chars ..."					
					echo ""	  			   	
				else
					unset number
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
				if [[ "$file" ]]
				then
					read -p ":: -- [-d] ENTER DELI  : " ps_d								
					read -p ":: -- [-f] ENTER FIELD : " ps_f		
					if [[ "$ps_d" == "space" ]]
					then
						ps_d=" "
					fi					
					if [[ "$ps_d" && "$ps_f" ]]									
					then
						paste_n=$(paste $file)						
						paste_d=$(paste -d "$ps_d" $file)
						paste_s=$(paste -s -d "$ps_d" $file)
						echo -e "--\\n[..] : print combined files with tab spacing\\n$paste_n"						
						echo -e "--\\n[-d] : print combined files, seperated by delimiter symbol\\n$paste_d"
						echo -e "--\\n[-s] : print combined files in serial format \\n$paste_s\\n"
					fi
				fi
				;;		
			"printf")
				if [[ "$string" && "$number" ]]
				then
					conv=$(printf "%.0f" "$number")
					int=$(printf "%d" "$conv")					
					flt=$(printf "%.3f" "$number")
					str=$(printf "%s" "$string")		
					echo -e "--\\nSTRING : $string // NUMBER : $number"								
					echo -e "[%s] : print strings within 's' placeholder  : $str"
					echo -e "[%f] : print floats within 'f' placeholder   : $flt"
					echo -e "[%s] : print integers within 'd' placeholder : $int\\n"					
				fi
				;;			
			"pr")
				#-n : line number, -h : custom header, -2 : n column
				if [[ "$file" ]]
				then
					read -p ":: -- [-w] ENTER COLUMN : " p_n										
					read -p ":: -- [-h] ENTER HEADER : " p_h
					if [[ "$p_n" && "$p_h" ]]
					then					
						p_n="-$p_n"
						pr_n=$(pr -f -n $file)
						pr_h=$(pr -f -h "$p_h" $file)
						pr_c=$(pr $p_n -f $file)
						echo -en "--\\n[-n] : print line numbers along with the column$pr_n"						
						echo -en "--\\n[-h] : print a centered custom header$pr_h"						
						echo -en "--\\n[-c] : print contents in a spesific column width$pr_c"						
					fi
				fi
				;;
			"wc")
				# -l : total line, -c : total character, -w : total word count
				if [[ "$file" ]]
				then
					wc_l=$(cat $file | wc -l)
					wc_c=$(cat $file | wc -c)
					wc_w=$(cat $file | wc -w)					
					echo -e "--\\nFILE : $file, ($wc_get) selected"								
					echo -e "[-l] : print the newline counts of a file   : $wc_l lines"					
					echo -e "[-c] : print the character counts of a file : $wc_c chars"					
					echo -e "[-w] : print the word counts of a file      : $wc_w words\\n"										
				fi
				;;
			"clear")
				break
				;;
		esac
	done
done

