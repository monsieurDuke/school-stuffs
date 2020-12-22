#!/bin/bash
IFS=$'\n'
raw_mac=$(cat "Dec.22.2020.log" | cut -c 78- | cut -d ' ' -f 1 | sort | uniq -d | cut -d '=' -f 2)
arr_mac=($raw_mac)
echo "$raw_mac"
echo "${arr_mac[@]}"
echo "${#arr_mac[@]}"

