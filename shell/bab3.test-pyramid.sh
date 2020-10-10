#!/bin/bash

arr=(0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9)

## PIRAMID ATAS
piramid_atas() {
	panjang_array=$(($1 - 1))
	panjang=0	
	while [ $panjang -le $panjang_array ]
	do
		for m in `seq 0 $panjang`
		do 
			echo -n " "
		done
		for i in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$i]}"
		done
		echo ""
		panjang=$((++panjang))	
	done
}

## PIRAMID BAWAH
piramid_bawah() {
	panjang_array=$(($1 - 1))
	panjang=$1
	while [ $panjang -ge 0 ]
	do
		for j in `seq 0 $panjang`
		do 
			echo -n " "
		done
		for k in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$k]}"
		done
		echo ""
		panjang=$((--panjang))	
	done
}

## PIRAMID KANAN
piramid_kanan() {
	panjang_array=$(($1 - 2))
	panjang=$1
	puncak=0
	while [ $panjang -ge 0 ]
	do
		for k in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$k]}"
		done
		echo ""
		panjang=$((--panjang))	
		puncak=$((++puncak))
	done	

	puncak=$(($puncak - 2))
	for m in `seq 0 $puncak`
	do
		echo -n " ${arr[$m]}"		
	done
	echo ""

	panjang=0	
	while [ $panjang -le $panjang_array ]
	do
		for i in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$i]}"
		done
		echo ""
		panjang=$((++panjang))	
	done	
}

## PIRAMID KIRI
piramid_kiri() {
	panjang_array=$(($1 - 2))
	panjang=$1
	puncak=0
	while [ $panjang -ge 0 ]
	do
		for j in `seq 0 $panjang`
		do 
			echo -n "  "
		done		
		for k in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$k]}"
		done
		echo ""
		panjang=$((--panjang))	
		puncak=$((++puncak))
	done	

	puncak=$(($puncak - 2))
	for m in `seq 0 $puncak`
	do
		echo -n " ${arr[$m]}"		
	done
	echo ""

	panjang=0	
	while [ $panjang -le $panjang_array ]
	do
		for j in `seq 0 $panjang`
		do 
			echo -n "  "
		done				
		for i in `seq $panjang $panjang_array`
		do
			echo -n " ${arr[$i]}"
		done
		echo ""
		panjang=$((++panjang))	
	done	
}

while :
do
	read -p "pilih segitiga (atas/bawah/kanan/kiri) : " pilihan
	read -p "kamu tingginya berapa : " tinggi_user
	case $pilihan in
		"atas")
			piramid_atas "$tinggi_user"
			;;
		"bawah")
			piramid_bawah "$tinggi_user"
			;;
		"kanan")
			piramid_kanan "$tinggi_user"
			;;
		"kiri")
			piramid_kiri "$tinggi_user"
			;;
	esac
done

