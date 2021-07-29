#!/bin/bash
#-------------
#1807422020
#-------------
data="data_siswa.lst"
while IFS= read -r siswa; do
	nama=$(echo "$siswa" | tr -s '\t' '@' | cut -d '@' -f 1)
	nim=$(echo "$siswa" | tr -s '\t' '@' | cut -d '@' -f 2)	
	grade_1=$(echo "$siswa" | tr -s '\t' '@' | cut -d '@' -f 3)
	grade_2=$(echo "$siswa" | tr -s '\t' '@' | cut -d '@' -f 4)
	grade_3=$(echo "$siswa" | tr -s '\t' '@' | cut -d '@' -f 5)	
	avg=$(echo "(($grade_1+$grade_2+$grade_3)/3)" | bc -l | cut -c 1-5)
	floor=$(echo $avg | cut -d '.' -f 1)
	str+="$nama\t($nim)\tRATA:\t$avg"

	if [[ "$floor" -ge 90 ]]; then
		str+="\tA\tLULUS"
	elif [[ "$floor" -lt 90 && "$floor" -ge 80 ]]; then
		str+="\tB\tLULUS"		
	elif [[ "$floor" -lt 80 && "$floor" -ge 70 ]]; then
		str+="\tC\tLULUS"		
	else		
		str+="\tD\tTIDAK_LULUS"		
	fi
	str+="\n"
done < $data
echo -e $str | sort -k 4,4 -r