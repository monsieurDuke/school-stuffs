#!/bin/bash
# --------------
# ps, kill / killall, pgrep, ls -ld /proc/[pid]
# redirection of std, backgrounding + kill %1, random background dummy
# service, sys/device,system, wait, 
# bluman : exec (bug tracking)
# --------------
# redirect : ls -l /proc/self/fd/ 0>> .stdinn.txt 1>> .stdout.txt 2>> .stderr.txt 
# service  : sudo service [service] status >>
# netstat  : sudo netstat -lptan
# kill     : kill %[no] background // kill [PID]
# killall  : kill [service]
# pkil     : sudo pkill [service]
# backgr   : jobs, .. &, fg [no]
# ps       : ps aux , ps axjf
# check ps : ls -la /proc/[PID/ | grep -e "cwd" -e "exe"
#		   : cat /proc/[PID]/comm : cat /proc/[PID]/cmdline		
# param    : $! recen bg, $? recent fg
# wait     : test-update.sh (satu command dipastikan kelar dulu)
# exec     : test-exec.sh  (check all bug / stderr from this program)
# nohup    : nohup netdiscover > .netscan.log (log stdout dan stderr) 
# --------------
# LP (PS + SERVICE STATUS + JOBS) / LM (PROC/MEMINFO + I/O REDIRECTION + PIPELINE) 
# BG+FG (BACKGROUNDING) / KP (KILL) /  XR (EXEC + I/O REDIRECTION) / WB (WAIT) 
# CP (CHECK PS + PGREP) / RP (SERVICE START, SLEEP, NANO) / NP (NOHUP NETDISCOVER)
# gen_proc : htop v, ncat, iptraf v, tail /var/log/apt/history.log v

meminfo_path=".meminfo.part"
log_apk="tail-apk.log"
log_err="tail-err.log"
if [[ "$UID" -eq "0" ]]
then
	set -m	
	while :
	do
		clear
		echo "+----------------------------------------------+"
		echo "| list-proc   v| list-mem     v| nohup-comm   X|"
		echo "| gen-proc    v| kill-proc    @| wait-comm    X|"
		echo "| check-proc  v| exec-stderr  @| ..            |"
		echo "| tail-log    X| net-stat     v| ..            |"
		echo "+----------------------------------------------+"
		echo ""
		while :
		do
			read -p ">> " opt
			case $opt in
				"clear")
					break
					;;
				"ex")
					exit 0
					;;
				"ls")
					get_ls=$(ls -lh)
					echo -e "--\\n$get_ls\\n"
					;;
				"list-proc")

					ps_tree=$(ps axjf | cut -c 2-)
					ps_jobs=$(jobs)
					ps_ser1=$(service apache2 status)
					ps_ser2=$(service ssh status)
					ps_serv="$ps_ser1\\n$ps_ser2"
					if [[ "$ps_jobs" ]]
					then
						echo -e "--\\n$ps_serv\\n--\\n$ps_tree\\n--\\n$ps_jobs\\n"
					else
						echo -e "--\\n$ps_serv\\n--\\n$ps_tree\\n"						
					fi

					;;
				"list-mem")

					get_meminfo1=$(cat /proc/meminfo | head -n 8)
					get_meminfo2=$(cat /proc/meminfo | head -n 16 | tail -n 8)
					get_meminfo3=$(cat /proc/meminfo | head -n 24 | tail -n 8)
					echo "$get_meminfo1" > "$meminfo_path.1"
					echo "$get_meminfo2" > "$meminfo_path.2"
					echo "$get_meminfo3" > "$meminfo_path.3"
					paste_meminfo=$(paste -d " " $meminfo_path.1 /dev/null $meminfo_path.2 /dev/null $meminfo_path.3)
					echo -e "--\\n$paste_meminfo\\n"

					;;
				"nohup-comm")

					echo -e "--\\nCURRENT COMMAND : ping 0.0.0.0"
					read -p "CREATE LOG-FILE : " nohup_path
					if [[ "$nohup_path" ]]
					then
						if [[ -e "$nohup_path" ]]
						then
							echo "Overwriting file ..."
						fi
						nohup ping 0.0.0.0 &> "$nohup_path" &
						echo "--"													
						echo "Backgrounding stderr and stdout to '$nohup_path' ..."
					fi
					echo ""

					;;
				"tail-proc")

					echo "--"
					read -p "TAIL LOG-FILE : " tail_path
					if [[ "$tail_path" && -e "$tail_path" ]]
					then
						if [[ "$tail_path" == "$log_apk" ]]
						then
							log_tail=$(cat "$tail_path" | tail -n 5)
							log_apt=$(cat "$tail_path" | tail -n 5 | grep "apt-get" | cut -c 14-)
							echo -e "--\\n$log_tail\\n--\\nRecent installation, $log_apt ..."							
						else
							log_tail=$(cat "$tail_path" | tail -n 5)
							log_wc=$(cat "$tail_path" | wc -l)
							log_wc=$((--log_wc))
							echo -e "--\\n$log_tail\\n--\\nTotal sequences are $log_wc to 0.0.0.0 ..."
						fi
					fi
					echo ""

					;;
				"kill-proc")

					echo "--"
					read -p "SPECIFY PID NUMBER / JOB SESSION : " pid_num
					if [[ "$pid_num" ]]
					then
						pid_num2=$pid_num
						if [[ "$pid_num2" == *"%"* ]]
						then
							pid_num2=$(echo "$pid_num" | cut -c 2-)
							pid_comm=$(jobs | grep "$pid_num2" | cut -c 31-)
							kill "$pid_num"
							echo "--"
							echo "Terminating PID $pid_num ($pid_comm) ..."
							echo -e "Updating snapshot of current process ..."							
						else
							check1=$(exec ps -fp "$pid_num2" 2>&1 | cut -c 49-100 | tail -n 1)
							check2=$(exec kill "$pid_num" 2>&1 > /dev/null)
							time=$(date | cut -c 5-20)
							if [[ "$check2" == *"failed"* || "$check2" == *"No such"* ]]
							then
								echo -e "--\\nProcess not found with PID $pid_num. Aborting ..."
								echo "$time - $check1$check2" >> "$log_err"
							else
								pid_comm="$check1"
								echo "--"
								echo "Terminating PID $pid_num ($pid_comm) ..."
								echo -e "Updating snapshot of current process ..."								
							fi
						fi
					fi
					echo ""
					
					;;
				"check-proc")

					echo "--"
					read -p "SPECIFY PID NUMBER : " pid_num
					check_proc1=$(ls -la /proc/"$pid_num"/ | grep -e "cwd" -e "exe")
					check_proc2=$(ps -fp "$pid_num")
					echo -e "--\\n$check_proc1\\n$check_proc2\\n"

					;;
				"gen-proc")

					restart_ser1=$(service apache2 restart | cut -c 2-)
					restart_ser2=$(service ssh restart | cut -c 2-)
					echo "$restart_ser1" > ".service.part.1"
					echo "$restart_ser2" > ".service.part.2"
					get_ser=$(cat .service.part.* | grep "Restarting")
					min=1000
					max=3000
					range=$(($max-$min+1))					
					getrand_num=$(($RANDOM%$range+$min))
					sleep "$getrand_num" &
					nohup tail -f /var/log/apt/history.log &> "tail-apk.log" &
					ncat -l -p "$getrand_num" > "message.txt" &
					echo -e "--\\n$get_ser\\n--"										
					regex_proc=("sleep $getrand_num &" "tail -f /var/log/apt/history.log &" "ncat -l -p $getrand_num > message.txt &")
					for i in "${regex_proc[@]}"
					do
						echo "Backgrounding: $i ..."						
					done
					echo -e "--\\nUpdating snapshot of current process ...\\n"

					;;
				"net-stat")

					get_net=$(netstat -lptan)
					tst_net=$(netstat -lptan | grep "tcp")
					if [[ "$tst_net" ]]
					then
						echo -e "--\\n$get_net\\n"
					else
						echo -e "--\\nNo Active Internet connections (servers were not established) ...\\n"
					fi

					;;
				"exec-stderr")
					get_tail=$(cat "$log_err")
					echo -e "--\\n$get_tail\\n"
					;;
				"wait-comm")

					echo "--"
					read -p "INSTALL PACKAGE : " package
					if [[ "$package" ]]
					then
						echo -e "--\\nUpdating packages ...\\n--"
						apt-get update &
						wait $!
						check1=$(exec apt-get install "$package" -y 2>&1)
						check2=$(echo "$check1" | grep "E:")
						time=$(date | cut -c 5-20)
						if [[ "$check2" == *"E:"* ]]
						then
							echo -e "--\\nPackage not found. Aborting ..."
							echo "$time - $check2" >> "$log_err"	
						else
							echo -e "--\\nInstalling package ...\\n--\\n$check1"
							echo -e "--\\nPackage have been installed, $package ..."							
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
