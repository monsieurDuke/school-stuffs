#!/bin/bash

# menulis/menimpa isi file (write out)
echo "administrator#hakc#swimminhakc###appleplie#hakc" > "file-writeout.txt"

# menulis/menambah isi file (append)
echo "this is my first line" >> "file-append.txt"
echo "this is ur second line" >> "file-append.txt"
echo "third is the third" >> "file-append.txt"

# membaca seluruh isi file ke variabel
get_file=$(cat "file-append.txt")
printf "$get_file\n\n"

# membaca isi file baris-per-baris ke variabel
while IFS= read -r get_line
do
	echo "-> $get_line"
done < "file-append.txt"
echo ""

# membaca isi file baris-per-baris ke array dengan delimiter
unset get_line
while IFS= read -r get_line
do
	IFS="h"
	read -a get_arr <<< "$get_line"
	echo "username : ${get_arr[0]}"
	echo "password : ${get_arr[1]}"
	echo "hobby    : ${get_arr[2]}"	
done < "file-writeout.txt"
echo ""



