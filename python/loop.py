for i in range(10,0,-1):
	print(' '*(10-i)+'*'*i+'*'*(i-1))

# loop tediri dari 3 unsur (whitepspace, bintang sisi kiri, dan bintang sisi kanan)
# ' '*(10-i) //  memberikan jarak dari atas, yaitu 0, hingga mengerucut kebawah.
# semakin kebawah, whitespace akan lebih menjorok ke kanan karena i akan bernilai 1, dan ada 9 spasi
# --
# *i // melakukan print bintang sebanyak i, yang diawali dari 10 hingga 1. karena membuat piramid,
# maka angka tersebut haruslah ganjil supaya terbentuk puncak nya
# --
# *(i-1) // melakukan print sebanyak i-1, yang diawali dari 9 hingga 0, yang di-print bersampingan
# dengan * sebelumnya. sehingga total baris paling atas adalah 19 (10 + 9) hingga puncak 1 (1 + 0)

i = 9
while i > 0:
	print(' '*(10-i)+'*'*i+'*'*(i-1))
	i -= 1
