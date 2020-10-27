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
# nohup    : nohup [command] > 
# --------------
# LP (PS + SERVICE STATUS + JOBS) / LM (PROC/MEMINFO + I/O REDIRECTION + PIPELINE) 
# BG+FG (BACKGROUNDING) / KP (KILL) /  XR (EXEC + I/O REDIRECTION) / WB (WAIT) 
# 

if [[ "$UID" -eq "0" ]]
then
	while :
	do
		echo "[LP] LIST PROCESS   | [LM] LIST MEMORY  | [BG] BACKGROUND PROCESS"
		echo "[RP] RANDOM PROCESS | [KP] KILL PROCESS | [FG] FOREGROUND PROCESS"
		echo "[CP] CHECK PROCESS  | [XR] EXEC REDIRCT | [WB] WAIT BACKGROUND "
		echo "-----------------------------------------------------------------"
		sleep 100
	done
else
	echo "This program requires root access"
	echo "Exitting ..."
	exit 0
fi
get_meminfo=$(cat /proc/meminfo | grep -e "Mem" -e "Swap" -e "Cached")
echo "$get_meminfo"