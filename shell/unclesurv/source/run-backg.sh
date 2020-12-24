#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o MAIN RUN (BACKGROUND)
#--------------------------
IFS=$'\n'
max_param=$(jq '.setup_param.max_ping_attempt' setup.json)
rule_param=$(jq '.setup_param.rule_chain_match' setup.json | cut -d '"' -f 2)
detect_param=$(jq '.setup_param.detection_method' setup.json | cut -d '"' -f 2)
proto_param=$(jq '.setup_param.disable_protocol[]' setup.json | cut -d '"' -f 2)
arr_proto=("$proto_param")

while :
do
	if [[ ! -e "log/.md5" ]]
	then
		touch "log/.md5"
	fi
	if [[ ! -e "log/.rules" ]]
	then
		touch "log/.rules"
	fi

	date_year=$(date +'%Y')	
	file_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6 | tr -s ' ' '.')
	regx_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6)	
	grep -a "UNCLE" /var/log/syslog | grep -a "$regx_prefix" > "log/$file_prefix.$date_year.log"

	curr_md5=$(md5sum "log/$file_prefix.$date_year.log" | cut -d ' ' -f 1)
	load_md5=$(cat "log/.md5")	

	if [[ $curr_md5 != $load_md5 ]]
	then
		cat /dev/null > "log/$file_prefix.$date_year.db"
		echo $curr_md5 > "log/.md5"
		echo    "------------------------------------------------------------------------------------------------------------------------" >> "log/$file_prefix.$date_year.db"		
		printf "%-41s | %-17s | %-17s | %-8s | %-15s | %-7s\n" "MAC ADDR" "SOURCE ADDR" "DESTINATION ADDR" "PROTOCOL" "SEQ" "STAT" >> "log/$file_prefix.$date_year.db"
		echo    "------------------------------------------------------------------------------------------------------------------------" >> "log/$file_prefix.$date_year.db"

		IFS=$'\n'
		raw_mac=$(cat "log/$file_prefix.$date_year.log" | cut -d '=' -f 4 | cut -d ' ' -f 1 | sort | uniq -d)
		raw_ptc=$(cat "log/$file_prefix.$date_year.log" | cut -d '=' -f 12 | cut -d ' ' -f 1 | sort | uniq -d)
		arr_mac=("$raw_mac")
		for i_mac in ${arr_mac[@]}
		do
			raw_src=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | cut -d '=' -f 5 | cut -d ' ' -f 1 | sort | uniq -d)
			arr_src=("$raw_src")
			for i_src in ${arr_src[@]}
			do
				timeinc=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | grep "$i_src" | wc -l)
				raw_dst=$(cat "log/$file_prefix.$date_year.log" | grep "$i_mac" | grep "$i_src" | cut -d '=' -f 6 | cut -d ' ' -f 1 | sort | uniq -d)
				arr_dst=("$raw_dst")

				if [[ $timeinc -ge $max_param ]]
				then
					stat="DROPPED"
				else
					check_stat=$(cat log/.rules | tr -s '\t' ' ' | cut -d ' ' -f 2 | sort | uniq | grep $i_src)
					if [[ $check_stat ]]
					then
						stat="DROPPED"
					else
						stat="ALLOWED"
					fi
				fi
				for i_dst in ${arr_dst[@]}
				do
					printf "%-41s | %-17s | %-17s | %-8s | %-15s | %-7s\n" "$i_mac" "$i_src" "$i_dst" "$raw_ptc" "$timeinc ATTEMPT(S)" "$stat" >> "log/$file_prefix.$date_year.db"
				done

				if [[ $stat == "DROPPED" ]] ## PERBAIKIN STATT DARI RULES
				then
					if [[ $detect_param == "ip" ]]
					then
						check_rule=$(sudo iptables -S INPUT | grep "$i_src")
						if [[ ! $check_rule ]]
						then
							for i_ptc in ${arr_proto[@]}
							do							
								sudo iptables -A INPUT -s $i_src -p $i_ptc -j $rule_param
								echo -e "$file_prefix.$date_year\t$i_src\t$i_ptc\t$rule_param" >> "log/.rules"
							done
						fi
					fi
				fi
			done
		done
		echo    "------------------------------------------------------------------------------------------------------------------------" >> "log/$file_prefix.$date_year.db"
	fi
done

## jq '.whitelist.ip[]' setup.json | cut -d '"' -f 2
## jq '.setup_param.max_ping_attempt' setup.json
## delete rule : sudo iptables -S INPUT | grep 'LOG' | cut -c 4-
##			   : sudo iptables -D [rule]
## insert rule : sudo iptables -A INPUT -s $ip_source -d $ip_destination -p $proto -j $rule