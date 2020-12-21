#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o MAIN RUN
#--------------------------
if [[ "$UID" -eq "0" ]]
then
	sudo bash run-init.sh
	sudo bash run-backg.sh &
	echo -e "\n[NICE]: initiating program at $!"
else
	echo -e "[INFO] Program requires root permission ..."
	echo -e "[EXIT] Exitting program ..."
	exit 0
fi
