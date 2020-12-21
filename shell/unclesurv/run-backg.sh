#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o MAIN RUN (BACKGROUND)
#--------------------------
rules_check=$(sudo iptables -L -n -v | grep UNCLE)
if [[ $rules_check == '' ]]
then
	sudo iptables -I INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix "LOGGING_PING_UNCLESURV"
fi

echo -ne "\n[WAIT]: Loading recent iptables rules ..."
nohup sudo service netfilter-persistent save &> /dev/null &
wait $!
nohup sudo service netfilter-persistent restart &> /dev/null &
wait $!

echo -ne "\n[WAIT]: Restarting rsyslog daemon ..."
nohup sudo service rsyslog restart &> /dev/null &
wait $!

echo -ne "\n[WAIT]: Enabling firewall ..."
ufw_check=$(sudo ufw verbose | cut -d ':' -f 2 | tr -d ' ')
if [[ $ufw_check == 'inactive' ]]
then
	nohup sudo ufw enable &> /dev/null &
fi

#while :
#do
	date_year=$(date +'%Y')	
	file_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6 | tr -s ' ' '.')
	regx_prefix=$(sudo cat /var/log/syslog | tail -n 1 | cut -c 1-6)	
	tail -n 700 /var/log/syslog | grep "$regx_prefix" >> "log/.tmp"
	cat "log/.tmp" | grep "UNCLE" | sort | uniq -d > "log/$file_prefix.$date_year.log"
#done
##flush : sudo service netfilter-persistent flush

