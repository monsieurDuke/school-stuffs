#!/bin/bash
# ---------
# touch = create file
# cp    = copy (*)
# mv    = rename / rename + move (*)
# rm    = remove file  (*)
# rm -r = remove dir parent (*)
# mkdir = create dir
# cp, mv, rm bisa menggunakan regex | *.doc *.pdf test.* *module*

# redirection, df, mktemp, join, install
# mkdir, membuat file, mv, cp, rm
# dd, split, tee, touch, find, find -exec

while :
do
	clear	
	echo "Command List:"
	echo "--------------------------------"
	echo "- touch    - cp        - rm     "
	echo "- mkdir    - move      - join   "
	echo "- install  - redirect  - mktemp "
	echo "- df       - clear     - ls / ll"
	echo "- cat      - tee       - rename "
	echo "- dd       - split     - find   "
	echo "--------------------------------"
	while :
	do
		read -p ">> " menu
		case "$menu" in
			"touch")
				read -p "-- NEW NAME OF FILE : " file
				touch "$file"
				echo ":: FILE HAVE BEEN CREATED, $file !"
				echo ""			
				;;
			"cat")
				read -p "-- NAME OF FILE : " file
				if [[ -e "$file" && "$file" ]]
				then					
					echo "::"				
					cat $file
					echo ""	
				fi		
				;;					
			"install")
				read -p "-- NAME OF PACKAGE : " pack
				echo "::"				
				apt-get install $pack
				echo ""			
				;;								
			"mkdir")
				read -p "-- NAME OF DIRECTORY : " dir
				mkdir $dir
				echo ":: DIRECTORY HAVE BEEN CREATED, $file/ !"				
				echo ""			
				;;			
			"ls")
				pwd=$(pwd)
				read -p "-- VIEW DIRECTORY (current) : " dir
				if [ ! $dir ]
				then
					path_dir=$pwd
					path_dir=$(realpath -s "$path_dir")					
				else
					path_dir=$(realpath -s "$dir")					
				fi
				echo    ":: LISTED DIRECTORY         : $path_dir/"
				echo "::"	
				ls -h $dir
				echo ""
				;;				
			"redirect")
				echo    "-- CURRENT COMMAND    : date"
				read -p "-- REDIRECT BUFFER TO : " file
				get_disp=$(date)
				echo "$get_disp" > "$file"
				echo ":: FILE HAVE BEEN CREATED, $file !"				
				echo ""
				;;
			"move")
				read -p "-- NAME OF FILE       : " file
				if [[ -e "$file" && "$file" ]]
				then									
					read -p "-- DESTINATION FOLDER : " folder
					if [[ -d "$folder" && "$folder" ]]
					then
						mv "$file" "$folder"
					fi
					echo ":: FILE HAVE BEEN MOVED, $file to $folder/ !"	
					echo ""							
				fi
				;;
			"rename")
				read -p "-- NAME OF FILE     : " file
				if [[ -e "$file" && "$file" ]]
				then									
					read -p "-- NEW NAME OF FILE : " file2
					if [ ! -d "$file2" ]
					then
						mv "$file" "$file2"
					fi			
					echo ":: FILE HAVE BEEN RENAMED, $file to $file2 !"					
					echo ""			
				fi
				;;			
			"cp")
				read -p "-- NAME OF FILE       : " file				
				if [[ -e "$file" && "$file" ]]
				then					
					read -p "-- NEW NAME OF FILE   : " file2
					read -p "-- DESTINATION FOLDER : " folder
					if [[ "$file2" && ! "$folder" ]]
					then
						file2="$folder$file2"					
						echo ":: FILE HAVE BEEN COPIED, $file to $file2 !"					
					fi
					if [[ "$folder" && -d "$folder" && ! "$file2" ]]
					then
						file2="$folder/$file2"					
						echo ":: FILE HAVE BEEN COPIED, $file to $folder/ !"					
					fi				
					if [[  "$folder" && -d "$folder" && "$file2" ]]
					then
						file2="$folder/$file2"					
						echo ":: FILE HAVE BEEN COPIED, $file to $file2 !"											
					fi
					cp "$file" "$file2"				
					echo ""			
				fi
				;;						
			"rm")
				#buat opsi bisa file bisa folder
				read -p "-- NAME OF FILE       : " file				
				if [[ -e "$file" && "$file" ]]
				then					
					rm "$file"
					echo ":: FILE HAVE BEEN REMOVED, $file !"					
					echo ""
				fi
				;;									
			"clear")
				break
				;;
			"df")
				echo "-- DISPLAYING DISK SPACE USAGE : "
				echo "::"					
				df -h
				echo ""			
				;;
			"join")
				read -p "-- NAME OF FIRST FILE  : " file				
				read -p "-- NAME OF SECOND FILE : " file2			
				if [[ -e "$file" && "$file" && -e "$file2" && "$file2" ]]
				then									
					read -p "-- DESTIONATION FILE   : " file3
					read -p "-- NUMBER OF COLUMNS   : " col						
					join -o "$col" "$file" "$file2" > "$file3"
					echo ":: FILE HAVE BEEN JOINED, $file3 !"									
					echo ""		
				fi	
				;;				
			"mktemp")
				read -p "-- NAME OF FILE TO BACK-UP : " file				
				if [[ -e "$file" && "$file" ]]
				then
					out=$(mktemp)
					get_file=$(cat $file)
					echo "$get_file" > $out
					echo ":: FILE HAVE BEEN BACKED-UP, $file to $out !"
				fi
				echo ""
				;;
			"dd")		
				read -p ":: CREATE BACKUP/RESTORE BACKUP (c/r) ? : " choose
				case $choose in
					"c")	
						read -p "-- NEW NAME OF ISO               : " file				
						read -p "-- DESTIONATION OF ISO (current) : " path_file
						path_file+="$file"					
						echo    "-- AVAILABLE PARTITION :"
						df -h | grep -e '/dev' -e ':'
						echo ""
						read -p "-- SELECT A PARTITION TO BACK-UP : " partition
						echo ":: TRANSFERING FILES, PLEASE WAIT ..."
						dd if="$partition" of="$path_file"
						;;
					"r")
						read -p "-- NAME OF BACKED-UP ISO         : " file				
						read -p "-- ORIGIN OF ISO (current)       : " path_file
						path_file+="$file"
						if [[ -e "$path_file" && "$path_file" ]]
						then						
							echo    "-- AVAILABLE PARTITION :"
							df -h | grep -e '/dev' -e ':'
							echo ""
							read -p "-- SELECT A PARTITION TO RESTORE : " partition
							echo ":: TRANSFERING FILES, PLEASE WAIT ..."
							dd if="$path_file" of="$partition"
						fi
						;;
				esac
				echo ""
				;;
			"find")
				read -p "REMOVE FILES/COPY FILES/FIND (r/c/f) ? : " choose
				case $choose in
					"r")
						read -p "-- SEARCH BY REGEX : " regex
						regex="*$regex*"						
						find . -type f -name "$regex" -exec rm {} \;
						echo ":: FILES WITH '$regex' HAVE BEEN REMOVED"						
						echo ""
						;;
					"c")
						read -p "-- SEARCH BY REGEX    : " regex
						read -p "-- DESTINATION FOLDER : " path_dir
						regex="*$regex*"
						find -maxdepth 1 -name "$regex" -exec cp {} "$path_dir" \;				
						echo ":: FILES WITH '$regex' HAVE BEEN COPIED TO $path_dir !"												
						echo ""
						;;					
					"f")
						read -p "-- SEARCH BY REGEX    : " regex
						read -p "-- DESTINATION FOLDER : " path_dir
						regex="*$regex*"
						find . -type f -name "$regex" -exec echo {} \;
						echo ""
						;;
				esac
				;;
			"tee")
				read -p "-- NAME OF FILE                : " file
				if [[ -e "$file" && "$file" ]]
				then
					read -p "-- NAME OF FILE TO SAVE BUFFER : " file2				
					cat "$file" | tee -a "$file2"
				fi
				echo ":: FILE HAVE BEEN SAVED, $file2 !"																
				echo ""
				;;
			"split")
				read -p "-- NAME OF FILE  : " file
				if [[ -e "$file" && "$file" ]]
				then			
					read -p "-- LINES TO CHOP : " line
					read -p "-- PREFIX NAME   : " prefix
					split -l "$line" -e "$file" "$prefix"
				fi
				echo ""
				;;
			"ex")
				exit 0
				;;
			"ll")
				pwd=$(pwd)
				read -p "-- VIEW DIRECTORY (current) : " dir
				if [ ! $dir ]
				then
					path_dir=$pwd
					path_dir=$(realpath -s "$path_dir")					
				else
					path_dir=$(realpath -s "$dir")					
				fi
				echo    ":: LISTED DIRECTORY         : $path_dir/"
				echo "::"	
				ls -lah $dir
				echo ""
				;;				
		esac
	done
done




