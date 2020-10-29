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
# wait     : test-update.sh
# exec     : test-exec.sh 
# nohup    : nohup netdiscover > .netscan.log (log stdout dan stderr) 
# --------------
# LP (PS + SERVICE STATUS + JOBS) / LM (PROC/MEMINFO + I/O REDIRECTION + PIPELINE) 
# BG+FG (BACKGROUNDING) / KP (KILL) /  XR (EXEC + I/O REDIRECTION) / WB (WAIT) 
# CP (CHECK PS + PGREP) / RP (SERVICE START, SLEEP, NANO) / NP (NOHUP NETDISCOVER)

meminfo_path=".meminfo.part"
bridge="_________________________________________________________________________"
if [[ "$UID" -eq "0" ]]
then
	while :
	do
		clear
		echo "+-----------------------------------------------+"
		echo "| list-proc   @| list-mem   @| nohup-comm      @|"
		echo "| rand-proc    | kill-proc  o| foreground-proc  |"
		echo "| check-proc  o| exec-redir  | wait-comm        |"
		echo "| tail-proc   @| clear       | ex               |"
		echo "+-----------------------------------------------+"
		echo ""
		while :
		do
			read -p ">> " opt
			case $opt in
				"clear")
					break
					;;
				"list-proc")
					sleep 5000 &
					nohup man echo &					
					ps_tree=$(ps axjf | cut -c 2-)
					ps_jobs=$(jobs)
					if [[ "$ps_jobs" ]]
					then
						echo -e "$bridge\\n\\n$ps_tree\\n---\\n$ps_jobs\\n"
					else
						echo -e "$bridge\\n\\n$ps_tree\\n$bridge\\n"						
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
					echo -e "---\\n$paste_meminfo\\n"
					;;
				"nohup-comm")
					read -p "CREATE LOG FILE : " nohup_path
					nohup ping 0.0.0.0 &> "$nohup_path" &
					echo -e "backgrounding : Ping Command\\n"
					;;
				"tail-proc")
					read -p "TAIL LOG FILE : " tail_path
					log_head=$(cat "$tail_path" | head -n 1)
					log_tail=$(cat "$tail_path" | tail -n 3)
					log_cntr=$(cat "$tail_path" | wc -l)	
					log_cntr=$((--log_cntr))
					log_head+="\\n$log_tail"				
					echo -e "$log_head\\n..."
					echo -e "total sequence, $log_cntr\\n"
					;;
				"kill-proc")
					read -p "SPECIFY PID NUMBER : " pid_num
					kill "$pid_num"
					echo ""
					;;
				"check-proc")
					read -p "SPECIFY PID NUMBER : " pid_num
					check_proc1=$(ls -la /proc/"$pid_num"/ | grep -e "cwd" -e "exe")					
					check_proc2=$(ps -fp "$pid_num")
					echo -e "$check_proc1\\n$check_proc2\\n"
					;;
			esac
		done
	done
else
	echo "This program requires root access"
	echo "Exitting ..."
	exit 0
fi
