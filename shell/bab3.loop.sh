#!/bin/bash

arr=("aku" "dia" "kamu" "uwu" "yayet" "aku")
for i in `seq 0 ${#arr[@]}`
do
	echo "-> ${arr[$i]}"
done
echo ""

for i in hello 1 * 2 goodbye
do
	echo "looping statement is $i"
done
echo ""

for i in {0..6}
do
	echo "-> ${arr[$i]}"
done
echo ""

loop_check="yes"
while [ ! $loop_check ]
do
	echo "preparing to unset"
	unset loop_check
	echo "unsetted, bye loop"
done
echo ""

while :
do
	read -p "read : " get_r
	echo "$get_r"
	unset get_r
done

# ---------------
a=0
while [ "$a" -lt 10 ]    # this is loop1
do
   b="$a"
   while [ "$b" -ge 0 ]  # this is loop2
   do
      echo -n "$b "
      b=`expr $b - 1`
   done
   echo
   a=`expr $a + 1`
done

a=9
while [ "$a" -ge 0 ]    # this is loop1
do
   b="$a"
   while [ "$b" -lt 10 ]  # this is loop2
   do
      echo -n " $b"
      b=`expr $b + 1`
   done
   echo
   a=`expr $a - 1`
done
