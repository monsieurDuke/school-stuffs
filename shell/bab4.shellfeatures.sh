#!/bin/bash
#------------------------
## INIT SCRIPTS 15-1
#- apa itu init scripts + kegunaan
#- apa itu init.d
#- perbedaan init.d dan sysctl.d
#- init_dir=/etc/init.d ## config nya dimana / main config
#	$ ls /etc/init.d/  ## list registered service
#	$ /etc/init.d/[service] start/stop/restart/reload
#------------------------
## DPKG REPORT 15-2
#- apa itu rpm vs dpkg
#- list dpkg database
#	$ dkpg -l | grep -e "||/" -e "+++" -e "[regex-pkg]" 
#	$ dpkg -s [pkg] | grep -e "Package:" -e "Status:" -e "Section:" -e "Maintainer:" -e "Architecture:" -e "Source:" -e "Version:" -e "Provides:" -e "Recommends:" -e "Suggests:"
#	$ dpkg -s [pkg] | grep -e "Depends:" | tr -s ',' '\n' | tr -d ' ' | sed s/"Depends:"//
#------------------------
## POST-INSTALL SCRIPTS (ubuntu) 15-3
#- apa itu ethernet bonding / LCAP ?
#	$ sudo apt-get install ifslave ifupdown
#	$ lsmod | grep bond # cek status bonding
#	$ modprobe --first-time bonding # cat /etc/modules
#	$ modprobe bonding
#	$ sudo nano /etc/network/interfaces >> ...
#	$ sudo nano /etc/modprobe.d/bonding >> alias bond0 bonding
#	$ sudo systemctl restart networking.service
#   ...
#	$ ifconfig
#	$ cat /proc/net/bonding/bond0
#------------------------	