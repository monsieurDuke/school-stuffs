#!/bin/bash
ip=$(ifconfig eth0 | grep inet | head -n 1 | tr -s ' ' '@' | cut -d '@' -f 3)
sm=$(ifconfig eth0 | grep inet | head -n 1 | tr -s ' ' '@' | cut -d '@' -f 5)
##
case $1 in
	"ip")
		echo -n "$ip"
		;;
	"sm")
		echo -n "$sm"
		;;
esac