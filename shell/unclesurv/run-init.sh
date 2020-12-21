#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o PRE-REQUESITES CHECK
#--------------------------
pkg_arr=("tcpdump" "debconf-utils" "iptables" "netfilter-persistent" "ufw" "rsyslog")
pth_arr=("log" "host-allowed" "host-suspected" "host-blocked")
arr_len=${#pth_arr[@]}
echo -ne "[WAIT]: Preparing internal directory ... "
for i in `seq 0 $arr_len`; do echo -ne "[$i/$arr_len]"'\r\t\t\t\t\t '; sleep 1; done;
for idx in ${pth_arr[@]}
do
	if [[ ! -d $idx ]]
	then
		mkdir $idx
	fi
done

echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections

arr_len=${#pkg_arr[@]}
echo -ne "\n[WAIT]: Checking required packages ...  "
#nohup sudo apt-get update &> /dev/null &
i=0
echo -ne " [$i/$arr_len]"'\r\t\t\t\t\t'; sleep 1;
wait $!
for idx in ${pkg_arr[@]}
do
	i=$((++i))
	pkg_stat=$(dpkg-query -l $idx | tail -n 1 | tr -s '\t' ' ' | cut -d ' ' -f 1)
	if [[ $pkg_stat == 'ii' ]]
	then
		echo -ne " [$i/$arr_len]"'\r\t\t\t\t\t'; sleep 1;
		continue
	fi
	nohup sudo apt-get install $idx -y &> /dev/null &
	wait $!
		echo -ne " [$i/$arr_len]"'\r\t\t\t\t\t'; sleep 1;
done