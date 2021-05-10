#!/bin/bash
#----------
total_nf=$(cat $1 | awk --field-separator=" " "{ print NF }")
least_nf=$(echo $total_nf | cut -d ' ' -f 1)

x=1;
while [[ $x -le $least_nf ]]; do
	cat $1 | cut -d ' ' -f $x > $1.$x
	x=$((++x))
done
