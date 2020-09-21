#! /bin/bash

typing() {

	echo "JONI : aku selalu makan buah $nama_buah, $jumlah_buah biji"
	nama_buah="apel"; jumlah_buah="12"
	echo "JONI : eh maaf, aku selalu makan buah $nama_buah, $jumlah_buah biji"

	jumlah_buah=$((jumlah_buah+5))
	echo "BOJO : kamu kalah, aku selalu makan buah $nama_buah, $jumlah_buah biji"

}

assigning_values_declare() {

	var1=foo        # OK
	var2="foo oof"  # OK
	var3=foo off    # WRONG
	var4 =foo       # WRONG
	var5= foo       # WRONG

	echo "$var1, $var2, $var3, $var4, $var5"

}

assigning_values_read_1() {

	read -p "SISWA : nama lengkap saya adalah " nama_depan nama_belakang	
	nama_panggilan=${nama_depan:0:3}
	echo    "DOSEN : oh baik $nama_depan, kamu adalah marga $nama_belakang ya"
	echo    "      : kalau begitu kamu saya panggil $nama_panggilan!"

}

assigning_values_read_2() {

	read get_line < readme.txt
	while read pass_file
	do
		get_file+=$pass_file
	done < readme.txt

	printf "the first line of readmet.txt is   : $get_line\n\n"
	printf "the full content of readmet.txt is : $get_file\n"


}

assigning_values_read_2