#!/bin/bash

arr_asc=(9 8 7 6 5 4 3 2 1 0)
arr_dec=(0 1 2 3 4 5 6 7 8 9)

loop_asc="check"
loop_dec="check"

inc=9
while [ $inc -ge 0 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc - 1))
done

echo "-----------------"


inc=0
while [ $inc -le 9 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc + 1))
done

echo "-----------------"

inc=9
space_check="false"
while [ $inc -ge 0 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do		
		space=$((-1 + $inc))
		if [ $space_check == "false" ]
			then
			for j in `seq 0 $space`
			do
				echo -n " "
				space_check="true"
			done
		fi
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc - 1))
	space_check="false"
done

echo "-----------------"

inc=9
space_check="false"
while [ $inc -ge 0 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do		
		space=$((-1 + $inc))
		if [ $space_check == "false" ]
			then
			for j in `seq 0 $space`
			do
				echo -n " "
				space_check="true"
			done
		fi
		echo -n "${arr_asc[$i]}"
	done
	for i in `seq $inc ${#arr_asc[@]}`
	do
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc - 1))
	space_check="false"
done

echo "-----------------"

inc=9
while [ $inc -ge 0 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc - 1))
done


inc=0
while [ $inc -le 9 ]
do
	for i in `seq $inc ${#arr_asc[@]}`
	do
		echo -n "${arr_asc[$i]}"
	done
	echo ""
	inc=$(($inc + 1))
done
