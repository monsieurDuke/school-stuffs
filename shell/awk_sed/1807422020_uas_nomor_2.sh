#!/bin/bash
#-------------
#1807422020
#-------------
data="data_karyawan.lst"
while IFS= read -r karyawan; do
	nama=$(echo "$karyawan" | tr -s '\t' '@' | cut -d '@' -f 1)
	golongan=$(echo "$karyawan" | tr -s '\t' '@' | cut -d '@' -f 2)	
	anak=$(echo "$karyawan" | tr -s '\t' '@' | cut -d '@' -f 3)
	jam_kerja=$(echo "$karyawan" | tr -s '\t' '@' | cut -d '@' -f 4)

	if [[ "$golongan" -eq 1 ]]; then
		uang_gaji_pk=1500000
	elif [[ "$golongan" -eq 2 ]]; then
		uang_gaji_pk=2000000
	else
		uang_gaji_pk=3000000		
	fi

	if (( "$jam_kerja" > 50 )); then
		uang_lembur=$(echo "(($jam_kerja-50)*10000)" | bc -l | cut -c 1-5)
	else
		uang_lembur=0
	fi

	uang_tunjangan=$(echo "($anak*($uang_gaji_pk*0.1))" | bc -l | cut -c 1-5)
	uang_total=$(echo "($uang_gaji_pk + $uang_lembur + $uang_tunjangan)" | bc -l)
	
	echo -e "$nama\t$anak anak\tGolongan $golongan | Gaji PK: $uang_gaji_pk\tLembur: $uang_lembur\tTunjangan: $uang_tunjangan  >>  Gaji Total: $uang_total"

done < $data
