#!/bin/bash
check_rule=$(sudo iptables -S INPUT | grep "172")
if [[ ! $check_rule ]]
then
	echo "no entry. proceed"
fi

