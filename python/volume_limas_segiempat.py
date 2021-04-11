import math
#----------
lebar=float(input("lebar_alas   : "))
panjg=float(input("panjang_alas : "))
tnggi=float(input("tinggi_limas : "))
#----------
volme=(1/3)*(lebar*panjg)*(tnggi)
#----------
print("--------------")
print("rumus_limas  : 1/3 * ("+str(lebar)+" * "+str(panjg)+") * "+str(tnggi))
print("volume_limas : "+str(round(volme))+" cm")
