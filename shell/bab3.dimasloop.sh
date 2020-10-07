#!/bin/bash
<<a
for i in 1 2 3 4 5
do
	echo "looping ... i is set to $i"
done
for i in hello 1 * 2 goodbye
do
	echo "looping ... i is set to $i"
done
for (( i=0 ; i <= 5 ; i++ ))
do
	echo "looping ... i is set to $i"
done

for i in {1..9}
do
	echo "lalala {$i} laal"

done

 while [ "$INPUT_STRING" != "bye" ]
 do
 	echo -n "tulis sesuatu: "
 	read INPUT_STRING
 	echo "$INPUT_STRING"
 done 

 while : 
 do
 	echo -n "coba dong tulis: "
 	read INPUT_STRING
 	echo "$INPUT_STRING"
 done 

## piramid

a
a=0
while [ "$a" -lt 10 ]
do
	b="$a"
	while [ "$b" -ge 0 ]
	do
		echo -n "$b "
		b=`expr $b - 1`
	done
	echo
	a=`expr $a + 1`
done

a=9
while [ "$a" -ge 0 ]
do
	b="$a"
	while [[ "$b" -le "$a" ]] && [[ "$b" -ge 0 ]]
	do
		echo -n "$b "
		b=`expr $b - 1`
	done
	echo
	a=`expr $a - 1`
done

a=0
max=9
while [ "$a" -lt 10 ]
do
	c=$max
	while [[ "$c" -le 10 ]] && [[ "$c" -ge 0 ]]
	do
		echo -n "  "
		c=`expr $c - 1`
	done 
	b="$a"
	while [ "$b" -ge 0 ]
	do
		echo -n "$b "
		b=`expr $b - 1`
	done
	echo
	a=`expr $a + 1`
	max=`expr $max - 1`
done

<<b
a=9
max=0
while [ "$a" -ge 0 ]
do
	c=$max
	while [[ "$c" -le 9 ]] 
	do
		echo -n "  "
		c=`expr $c + 1`
	done 
	b="$a"
	while [[ "$b" -le "$a" ]] && [[ "$b" -ge 0 ]]
	do
		echo -n "$b "
		b=`expr $b - 1`
	done
	echo
	a=`expr $a - 1`
	max=`expr $max + 1`
done
b
a=9
max=0
while [ "$a" -ge 0 ]
do
	c=$max
	while [[ "$c" -le "$max" ]]  && [[ "$c" -ge 0 ]]
	do
		echo -n "  "
		c=`expr $c - 1`
	done 
	b="$a"
	while [[ "$b" -le "$a" ]] && [[ "$b" -ge 0 ]]
	do
		echo -n "$b "
		b=`expr $b - 1`
	done
	echo
	a=`expr $a - 1`
	max=`expr $max + 1`
done

max=6
num=1
i=1
while [ "$i" -le "$max" ];
do
	b=1
	let "e=$max-$i"
	while [ "$b" -le "$e" ];
	do
		echo -n "  "
		let "b=$b+1"
	done
	num=$i
	d=0
	let "c=2*$i-2"
	while [ "$d" -le "$c" ];
	do
		echo -n "$d "
		let "d=$d+1"
	done
	echo
	let "i=$i+1"
done
