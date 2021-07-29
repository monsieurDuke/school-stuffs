from operator import itemgetter, attrgetter
##
w = [3,4,1,7,6,8,9]
p = [4,5,2,5,5,8,11]
item = [[3,4],[4,5],[1,2],[7,5],[6,5],[8,8],[9,11]]
i = 0

while i < len(item):
	hasil = item[i][1] / item[i][0]
	item[i].append(hasil)
	i += 1

data = sorted(item,key=itemgetter(2),reverse=True)
def knapsack(data,cap,flag):
	total = 0
	tres = ""
	if (flag == 0):
		dataS = sorted(data,key=itemgetter(flag),reverse=True)
		tres = "bobot prioritas : "
	elif (flag == 1):
		dataS = sorted(data,key=itemgetter(flag),reverse=True)
		tres = "keuntungan prioritas : "
	elif (flag == 2):
		dataS = sorted(data,key=itemgetter(flag),reverse=True)
		tres = "prioritas : "
	else:
		return "Error"

	j = 0
	hasil = 0
	cek = 0
	weight = 0
	while j < len(dataS):
		if (cek + dataS[j][0] <= cap):
			hasil = hasil + dataS[j][1]
			weight = weight + dataS[j][0]
			print (dataS[j][0])
		cek = weight
		j += 1
	return "Optimal dalam "+str(tres)+str(hasil)+"\n"

print(knapsack(item,20,0))
print(knapsack(item,20,1))
print(knapsack(item,20,2))

