#!/bin/bash
get_date=$(date +'%F')
new_date="2020-11-30"
tsk_range=$(( ($(date -d $new_date +%s) - $(date -d $get_date +%s)) / 86400 ))

echo "H-$tsk_range"
