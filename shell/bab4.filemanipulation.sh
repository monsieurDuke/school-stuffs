#!/bin/bash
# ---------
# od, cut, echo, paste, pr
# printf, fmt, head, tail

list_path=".load.lst"
while : 
do
	clear	
 	echo -e "o-----------------------------------------o"
 	echo "| --------------------------------------- |"					
	echo "|    cut  | od    | echo | printf | pr    |"
	echo "|    fmt  | paste | ht   | wc     | ..    |"
	echo "|    shuf | sort  | tr   | uniq   | ..    |"
	echo "| --------------------------------------- |"		
	echo -e "o-----------------------------------------o"					
	while :
	do
		read -p "| >> " opsi
		case $opsi in
			"txt"|"TXT")
				read -p "| :: -- LOAD FILE(S) : " file
				fl_list=$(ls -lah $file)				
				if [[ "$file" && "$fl_list" ]]
				then
					echo "$fl_list" > "$list_path"
					wc_get=$(cat $list_path | wc -l)
					echo -e "| :: -- SELECTED FILE ($wc_get) ...\\n| --"
					while IFS= read -r get_list
					do
						echo "| -- $get_list"						
					done < $list_path
					echo ""										
				else
					unset file
				fi
				;;
			"STR"|"str")
				read -p "| :: -- INSERT STRING : " string
				if [[ "$string" ]]
				then
	  			   	echo "| :: -- VARIABLE HAVE BEEN SET, ${#string} chars ..."					
					echo ""	  			   	
				else
					unset string
				fi
				;;							
			"NUM"|"num")
				read -p "| :: -- INSERT NUMBER : " number
				re='^[+-]?[0-9]+([.][0-9]+)?$'
				if [[ "$number" ]]
				then
	  			   	echo "| :: -- VARIABLE HAVE BEEN SET, ${#number} chars ..."					
					echo ""	  			   	
				else
					unset number
				fi
				;;											
			"LS"|"ls")
				pwd=$(pwd)
				read -p "| :: -- VIEW DIRECTORY (current) : " dir
				if [ ! $dir ]
				then
					path_dir=$pwd
					path_dir=$(realpath -s "$path_dir")					
				else
					path_dir=$(realpath -s "$dir")					
				fi
				echo "| :: -- LISTED DIRECTORY : $path_dir/"
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
					read -p "| :: -- [-c] ENTER CHAR  : " cut_c_o			
					read -p "| :: -- [-d] ENTER DELI  : " cut_d_o
					read -p "| :: -- [-f] ENTER FIELD : " cut_s_o
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
						printf "[ cut -c $cut_c_o ]: print only selected characters\n--\n$cut_c\n--\n"
						printf "[ cut -d '$cut_d_o' -f $cut_s_o ]: print chopped-string by delimiter\n--\n$cut_d\n--\n"
						printf "[ cut -d '$cut_d_o' -f $cut_s_o -s ]: print lines that only contain delimiter\n--\n$cut_s\n\n"
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
						echo -e "--\n[ od -b ]: print ASCII code in octal byte format\n--"
						echo "$od_b"
						echo -e "--\n[ od -c ]: print characters and their backslash escapes\n--"						
						echo "$od_c"
						echo -e "--\n[ od $od_w_o -c ]: print output in a fix width of column\n--"												
						echo "$od_w"
						echo ""
					fi
				fi
				;;
			"echo")
				if [[ "$string" ]]
				then
					echo -e "--\n[ echo -n ]: print strings without adding trailing newlines\n--"					
					for i in `seq 1 3`
					do
						echo -n "$string"
					done
					echo ""
					echo -e "--\n[ echo -E ]: print strings without interprating backslash escpases (default)\n--"					
					for i in `seq 1 3`
					do
						echo -E "$string"
					done
					echo -e "--\n[ echo -e ]: print strings with interprating backslash escpases\n--"															
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
						echo -e "--\\n[ head -n $h_n | tail -n $t_n ]: print lines within a range from top and bottom\\n--\\n$ht_n"
						echo -e "--\\n[ head -c $h_c | tail -c $t_c ]: print characters within a range from top and bottom\\n--\\n$ht_c"
						echo -e "--\\n[ head -v ]: print the file names as the header\\n--\\n$ht_v\\n"
					fi
				fi
				;;			
			"paste")
				if [[ "$file" ]]
				then
					read -p ":: -- [-d] ENTER DELI  : " ps_d								
					if [[ "$ps_d" == "space" ]]
					then
						ps_d=" "
					fi					
					if [[ "$ps_d" ]]									
					then
						paste_n=$(paste $file)						
						paste_d=$(paste -d "$ps_d" $file)
						paste_s=$(paste -s -d "$ps_d" $file)
						echo -e "--\\n[ paste ]: print combined files with tab spacing\\n--\\n$paste_n"						
						echo -e "--\\n[ paste -d '$ps_d' ]: print combined files, seperated by delimiter symbol\\n--\\n$paste_d"
						echo -e "--\\n[ paste -s -d '$ps_d' ]: print combined files in serial format\\n--\\n$paste_s\\n"
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
					echo -e "--\\nSTR : $string"
					echo -e "NUM : $number\\n--"								
					echo -e "[ printf '%s' ]: print strings within 's' placeholder  : $str"
					echo -e "[ printf '%f' ]: print floats within 'f' placeholder   : $flt"
					echo -e "[ printf '%s' ]: print integers within 'd' placeholder : $int\\n"					
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
						echo -en "--\\n[ pr -f -n ]: print line numbers along with the column\\n--\\n$pr_n"						
						echo -en "--\\n[ pr -f -h $ph ]: print a centered custom header\\n--\\n$pr_h"						
						echo -en "--\\n[ pr -f $p_n ]: print content in a spesific column width\\n--\\n$pr_c"						
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
					echo -e "--\\nTXT : $file, ($wc_get) selected\\n--"								
					echo -e "[ cat | wc -l ]: print the newline counts of a file   : $wc_l lines"					
					echo -e "[ cat | wc -c ]: print the character counts of a file : $wc_c chars"					
					echo -e "[ cat | wc -w ]: print the word counts of a file      : $wc_w words\\n"
				fi
				;;
			"fmt")
				# -w : max width of column, -t : indent paragrapsh format, -s : spacing long lines (default 75)
				if [[ "$file" ]]				
				then
					read -p ":: -- [-w] ENTER WIDTH : " fmt_w_o										
					if [[ "$fmt_w_o" ]]
					then
						fmt_s=$(fmt -s $file)
						fmt_w=$(fmt -w $fmt_w_o -s $file)
						fmt_t=$(fmt -t $file)					
						echo -e "--\\n[ fmt -s ]: print each lines by providing 75 column width (default)\\n--\\n$fmt_s"																	
						echo -e "--\\n[ fmt -s -w $fmt_w_o ]: print each lines by providing custom column width (default)\\n--\\n$fmt_w"																	
						echo -e "--\\n[ fmt -t ]: print lines by adding indent into a paragraph-format\\n--\\n$fmt_t\\n"																							
					fi
				fi
				;;
			"sort")
				# -r : sort descending, -n: sort by numerical value, .. : sort by 
				if [[ "$file" ]]
				then
					sort_d=$(sort $file)
					sort_r=$(sort -r $file)
					sort_n=$(sort -n $file)
					echo -e "--\\n[ sort ]: sort content according to ASCII table\\n--\\n$sort_d"																											
					echo -e "--\\n[ sort -r ]: sort content in descending manner\\n--\\n$sort_r"																											
					echo -e "--\\n[ sort -n ]: sort content based on numerical value\\n--\\n$sort_n\\n"																																
				fi
				;;
			"shuf")
				# .. : pure shuffle, -n : limit output, -e : argument shuffle (variabel)
				if [[ "$file" ]]
				then
					read -p ":: -- [-n] ENTER LINE OUT  : " shuf_n_o															
					read -p ":: -- [-e] ENTER ARGUMENTS : " shuf_e_o	
					if [[ "$shuf_n_o" && "$shuf_e_o" ]]				
					then
						shuf_d=$(shuf $file)
						shuf_n=$(shuf -n $shuf_n_o $file)
						shuf_e=$(shuf -e $shuf_e_o)
						echo -e "--\\n[ shuf ]: shuffle content in a single sequence\\n--\\n$shuf_d"																											
						echo -e "--\\n[ shuf -n $shuf_n_o ]: shuffle content and output the line counts\\n--\\n$shuf_n"																											
						echo -e "--\\n[ shuf -e $shuf_e_o ]: shuffle content that based on given arguments\\n--\\n$shuf_e\\n"																											
					fi
				fi
				;;
			"tr")
				#-s : replace, -d : delete, -c : exception to next opt, ::
				if [[ "$file" ]]
				then
					read -p ":: -- [-s] REPLACE CHAR : " tr_s_o_1																			
					read -p ":: -- [-s] REPLACE WITH : " tr_s_o_2																											
					read -p ":: -- [-d] REMOVE CHAR  : " tr_d_o																								
					if [[ "$tr_s_o_1" && "$tr_s_o_2" && "$tr_d_o" ]]
					then
						if [[ "$tr_s_o_1" == "space" || "$tr_s_o_2" == "space" ]]
						then
							tr_s_o_1=" "
						fi
						tr_s=$(cat $file | tr -s "'$tr_s_o_1'" "'$tr_s_o_2'")
						tr_d=$(cat $file | tr -d "'$tr_d_o'")						
						tr_u=$(cat $file | tr [:lower:] [:upper:])
						echo -e "--\\n[ cat | tr -s '$tr_s_o_1' '$tr_s_o_2' ]: replace each character with given list of new character\\n--\\n$tr_s"																																	
						echo -e "--\\n[ cat | tr -d '$tr_d_o' ]: remove each charater that based on given list\\n--\\n$tr_d"																																	
						echo -e "--\\n[ cat | tr 'a-z' 'A-Z' ]: change SETs as a representation of a group\\n--\\n$tr_u\\n"																																							
					fi
				fi
				;;
			"uniq")
				# -c : count repeated / identical line, -D : print all duplicated lines, -w : compare chars
				if [[ "$file" ]]
				then
					read -p ":: -- [-w] CHECK CHAR : " uniq_w_o																							
					if [[ "$uniq_w_o" ]]
					then
						uniq_c=$(sort $file | uniq -c)
						uniq_D=$(sort $file | uniq -D)
						uniq_w=$(sort $file | uniq -w $uniq_w_o)						
						echo -e "--\\n[ sort | uniq -c ]: add a identical-counter on every lines\\n--\\n$uniq_c"																																							
						echo -e "--\\n[ sort | uniq -D ]: print all duplicated lines without grouping them\\n--\\n$uniq_D"																																							
						echo -e "--\\n[ sort | uniq -w $uniq_w_o ]: check identical line by the range of characters\\n--\\n$uniq_w\\n"
					fi
				fi
				;;
			"clear")
				break
				;;
		esac
	done
done

