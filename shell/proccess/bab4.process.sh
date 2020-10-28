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
# exec     : test-exec.sh  (check all bug / stderr from this program)
# nohup    : nohup netdiscover > .netscan.log (log stdout dan stderr) 
# --------------
# LP (PS + SERVICE STATUS + JOBS) / LM (PROC/MEMINFO + I/O REDIRECTION + PIPELINE) 
# BG+FG (BACKGROUNDING) / KP (KILL) /  XR (EXEC + I/O REDIRECTION) / WB (WAIT) 
# CP (CHECK PS + PGREP) / RP (SERVICE START, SLEEP, NANO) / NP (NOHUP NETDISCOVER)

meminfo_path=".meminfo.part"
if [[ "$UID" -eq "0" ]]
then
	while :
	do
		clear
		echo "+-----------------------------------------------+"
		echo "| list-proc   @| list-mem   @| nohup-comm      @|"
		echo "| rand-proc   o| kill-proc  @| foreground-proc  |"
		echo "| check-proc  @| exec-redir  | wait-comm        |"
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
				"ex")
					exit 0
					;;
				"ls")
					get_ls=$(ls -lah)
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
					echo "--"
					if [[ "$nohup_path" ]]
					then
						if [[ -e "$nohup_path" ]]
						then
							echo "Overwriting file ..."
						fi
						nohup ping 0.0.0.0 &> "$nohup_path" &
						echo "Backgrounding stderr and stdout to '$nohup_path' ..."
					fi
					echo ""
					;;
				"tail-proc")
					echo "--"
					read -p "TAIL LOG-FILE : " tail_path
					if [[ "$tail_path" && -e "$tail_path" ]]
					then
						log_tail=$(cat "$tail_path" | tail -n 5)
						log_wc=$(cat "$tail_path" | wc -l)
						log_wc=$((--log_wc))
						echo -e "--\\n$log_tail\\n--\\nTotal sequences are $log_wc to 0.0.0.0 ...\\n"
					fi
					echo ""
					;;
				"kill-proc")
					echo "--"
					read -p "SPECIFY PID NUMBER : " pid_num
					pid_num2=$pid_num
					if [[ "$pid_num2" == *"%"* ]]
					then
						pid_num2=$(echo "$pid_num" | cut -c 2-)
						pid_comm="nohup background"											
					else
						pid_comm=$(ps -fp "$pid_num2" | cut -c 49-100 | tail -n 1)											
					fi
					kill "$pid_num"					
					echo "--"
					echo "Terminating PID $pid_num ($pid_comm) ..."
					echo -e "Updating snapshot of current process ...\\n"
					;;
				"check-proc")
					echo "--"
					read -p "SPECIFY PID NUMBER : " pid_num
					check_proc1=$(ls -la /proc/"$pid_num"/ | grep -e "cwd" -e "exe")
					check_proc2=$(ps -fp "$pid_num")
					echo -e "--\\n$check_proc1\\n$check_proc2\\n"
					;;
				"rand-proc")
					restart_ser1=$(service apache2 restart | cut -c 2-)
					restart_ser2=$(service ssh restart | cut -c 2-)
					min=1000
					max=3000
					range=$(($max-$min+1))					
					echo -e "--\\n$restart_ser1\\n$restart_ser2"
					for i in `seq 1 3`
					do
						getrand_num=$(($RANDOM%$range+$min))
						sleep "$getrand_num" &
						echo "Backgrounding : sleep $getrand_num &"
					done
					;;
			esac
		done
	done
else
	echo "This program requires root access"
	echo "Exitting ..."
	exit 0
fi
