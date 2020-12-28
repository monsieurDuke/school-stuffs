#!/bin/bash
#--------------------------
# jia2f adalah custom IDS/IPS yang dapat mengantisipasi ancaman dari potensi attacker
# seperti penggunaan ping-flood, port scan, serta failure-attempt pada service seperti SSH
#--------------------------
# o MAIN RUN (BACKGROUND)
#--------------------------
main() #class main
{
	while :
	do
		############# Feature program ############		
		clear		
		curr_date=$(date +'%D %T %p')
		echo "unclesurv 1.2.1              $curr_date"
		echo "-------------------------------------------------"
		echo "[1]      ADD NEW RULES x | 0 UPDATE PARAMETER   [5]"		
		echo "[2]  VIEW ACTIVE RULES x | 0 VIEW PROCESSES     [6]"
		echo "[3]    RESET ALL RULES 0 | 0 CLEAR SCREEN       [7]"
		echo "[4]          VIEW LOGS 0 | 0 EXIT               [8]"
		echo "-------------------------------------------------"
		while :
		do
			read -p ">> " opt_main
			case $opt_main in
				1) meth_addrule;; 	5) meth_updateparam;;
				2) meth_checkstat;;	6) meth_viewproc;;
				3) meth_resetrule;; 7) break;;
				4) meth_viewlog;;	8) meth_exit;;
			esac
		done
	done
}
meth_resetrule()
{
	sudo iptables -F
	sudo cat /dev/null > "log/.fetch/.tmp.rules"
	sudo cat /dev/null > "log/.fetch/.load.rules"
	echo -e "--\n:: Flushing iptables ..."
	echo -e ":: Overwritting log/.fetch/.tmp.rules ..."
	echo -e ":: Overwritting log/.fetch/.load.rules ...\n"	
}
meth_viewlog() {
	echo -e "--\n:: LISTING : log/\n--"
	ls log/
	echo "--"
	read -p ":: ENTER FILENAME : " view_file
	cat log/$view_file
	echo ""
}
meth_exit() {
	echo -e "--\n:: Running service in background ..."
	echo -e ":: Exitting program ..."
	exit 0
}
meth_viewproc()
{
	echo "--"
	ps axjf
	echo ""
}
meth_updateparam()
{
	echo -e "--\n:: LISTING : setup.json"
	echo -e ":: SECTION : .setup_param\n--"
	jq '.setup_param' setup.json
	echo -e "--"
	read -p ":: INSERT KEY NAMWE : " sec_entry
	read -p ":: INSERT NEW VALUE : " new_entry
	if [[ $sec_entry && $new_entry ]]
	then
		exec_jq=$(jq '.setup_param.'"$sec_entry"' = '"$new_entry"'' setup.json)
		if [[ $exec_jq ]]
		then
			echo "$exec_jq" > setup.json
		fi
	fi
	echo ""
}
meth_checkstat()
{
	echo -e "--"
	sudo iptables -S INPUT -v; echo "--"
	sudo iptables -S OUTPUT -v; echo "--"
	sudo iptables -S FORWARD -v; echo -e "--\n"	
}
meth_addrule()
{
	###############Implementasi aturan yang akan di buat############
	echo -e "--\n 1 | INPUT/INCOME" #Aturan ini akan berlaku untuk jaringan dari luar mencoba akses ke jaringan lokal
	echo " 2 | OUTPUT/OUTGOING" #Aturan ini akan berlaku untuk jaringan lokal yang akan mencoba akses jaringan luar/internet
	echo -e " 3 | FORWARD\n--" #Aturan ini mengizinkan jaringan lokal/internet untuk bypass aturan yang telah di implementasikan
	read -p ":: SPECIFY CHAIN FOR THE CONNECTION : " opt_ch
	if [ ! -z $opt_ch ]
	then
		case $opt_ch in
			1)	chain="INPUT"
				S_ipaddress;;
			2)	chain="OUTPUT"
				S_ipaddress;;
			3)	chain="FORWARD"
				S_ipaddress;;
		esac
	fi
}
S_ipaddress()
{
	#########Source IP Address##########
	echo -e "--\n 1 | CREATE RULES FOR SINGLE SOURCE IP ADDRESS"
	echo -e " 2 | CREATE RULES FOR SUBNET SOURCE NETWORK ADDRESS"
	echo -e " 3 | CREATE RULES FOR ALL SOURCE ADDRESS\n--"
	read -p ":: SPECIFY SOURCE ADDRESS OPTION : " opt_ip
	if [ ! -z $opt_ip ]
	then
		case $opt_ip in
			1)	echo -n ":: INSERT SOURCE IP ADDRESS : "
				read ip_source
				if [ ! -z $ip_source ] #kalo bisa dia detect isi variable sama bolehin angka doang
				then
					D_ipaddress
				fi
				;;
			2)	echo -n ":: INSERT SOURCE NETWORK ADDRESS (X.X.X.X/YY) : "
				read ip_source
				if [ ! -z $ip_source ] #kalo bisa dia detect isi variable sama bolehin angka doang
				then
					D_ipaddress
				fi
				;;
			3)	ip_source='all'
				;;
		esac
	fi
}

## TERAKIR DISINIIII
D_ipaddress()
{
	#########Tujuan akses IP Address##########
	echo -e "--\n 1 | CREATE RULES FOR SINGLE DESTINATION IP ADDRESS"
	echo -e " 2 | CREATE RULES FOR SUBNET DESTINATION NETWORK ADDRESS"
	echo -e " 3 | CREATE RULES FOR ALL DESTINATION ADDRESS\n--"
	read -p ":: SPECIFY DESTINATION ADDRESS OPTION : " opt_ipD
	if [ ! -z $opt_ipD ]
	then
	case $opt_ipD in
	1) echo -n "Masukan IP Address: "
		 read ip_destination
		 if [ ! -z $ip_destination ] #kalo bisa dia detect isi variable sama bolehin angka doang
		 then
			echo "IP Address berhasil terisi"
			protocol
		 else
			echo "IP Address belum terisi!!"
			D_ipaddress
		 fi
		 ;;
	2) echo -n "Masukan subnet IP Address(contoh: 192.168.10.0/24): "
		 read ip_destination
		 if [ ! -z $ip_destination ] #kalo bisa dia detect isi variable sama bolehin angka doang
		 then
			echo "IP Address berhasil terisi"
			protocol
		 else
			echo "IP Address belum terisi!!"
			D_ipaddress
		 fi
		 ;;
	*) read -p "Pilihan anda tidak tersedia !!"
		 D_ipaddress;;
	esac
	else
		read -p "Pilihan anda tidak boleh kosong!!"
		D_ipaddress
	fi
}

protocol()
{
	clear
	###############Protocol#############
	echo "Jenis Protokol yang akan digunakan"
	echo "1. Memblokir seluruh layanan TCP"
	echo "2. Memblokir layanan TCP tertentu"
	echo "3. Memblokir port tertentu" 
	echo "4. Tidak menggunakan protokol"
	echo -n "Pilihan anda: "
	read proto_ch
	if [ ! -z $proto_ch ]
	then
	case $proto_ch in
	1) proto=TCP
		 echo "Proses berhasil dilakukan"
		 read -p "Press any key"
		 rule
		 ;;
	2) echo -n "Masukkan Nama Layanan TCP(huruf kapital): "
		 read proto
		 if [ ! -z $proto ] #kalo bisa dia detect isi variable sama bolehin huruf kapital
		 then
			echo "Protokol yang telah di pilih berhasil terisi"
			rule
		 else
			echo "Protokol belum terisi!!"
			protocol
		 fi
		 ;;
	3) echo -n "Masukkan Nama Port(huruf kapital): "
		 read proto_ch
		 if [ ! -z $proto_ch ] #kalo bisa dia detect isi variable sama bolehin huruf kapital
		 then
			echo "Layanan port berhasil terisi"
			rule
		 else
			echo "Layanan port belum terisi!!"
			protocol
		 fi
		 ;;
	4) proto="NULL"
		 echo "Proses berhasil dilakukan"
		 read -p "Press any key"
		 rule
		 ;;
	*) read -p "Pilihan anda tidak tersedia !!"
		 protocol;;
	esac
	else
		read -p "Pilihan anda tidak boleh kosong!!"
		protocol
	fi
}

rule()
{
	 clear
	 #############Aturan implementasi hak izin############# 
	 echo "Implementasi aturan pada penerimaan koneksi/packet ?"
	 echo "1. Menerima koneksi/packet"
	 echo "2. Menolak koneksi/packet" #client bakal tahu kalo koneksi dia kaga keterima.
	 echo "3. Menghapus koneksi/packet" #client ga bakal tahu keadaan packet terkirim ke server karena server tidak membalas permintaan, 
						#dia langgsung menghapus permintaan tersebut.
	 echo "4. Log"					
	 echo -n "Pilihan anda: "
	 read rule_ch
	 if [ ! -z $rule_ch ]
	 then
	 case $rule_ch in
	 1) rule="ACCEPT"
			echo "Proses berhasil dilakukan"
			read -p "Press any key"
			generate_rule
			;;
	 2) rule="REJECT"
			echo "Proses berhasil dilakukan"
			read -p "Press any key"
			generate_rule
			;;
	 3) rule="DROP"
			echo "Proses berhasil dilakukan"
			read -p "Press any key"
			generate_rule
			;;
	 4) rule="LOG"
			echo "Proses berhasil dilakukan"
			read -p "Press any key"
			generate_rule
			;;
	 *) read -p "Pilihan anda tidak tersedia !!"
			protocol;;
	 esac
	 else
		 read -p "Pilihan anda tidak boleh kosong!!"
		 protocol
	 fi
}

generate_rule()
{
	 ###################Proses membuat aturan####################
	 echo "Implementasi aturan yang dimasukan ke dalam iptables"
	 echo "Aturan yang akan di implementasikan: "
	 if [ $proto == "NULL" ]
	 then
	 echo "Iptables -A $chain -s $ip_source -d $ip_destination -j $rule"
	 gen=1
	 else
	 echo "Iptables -A $chain -s $ip_source -d $ip_destination -p $proto -j $rule"
	 gen=2
	 fi
	 echo "Informasi aturan tersebut akan di implementasikan ke dalam iptables? Yes=1, No=2"
	 echo -n "Pilihan anda: "
	 read yesno
	 if [ $yesno == 1 ] && [ $gen == 1 ]; then
	 sudo iptables -A $chain -s $ip_source -d $ip_destination -j $rule
	 echo "Proses berhasil dilakukan"
	 read -p "Press any key"
	 main
	 else if [ $yesno == 1 ] && [ $gen == 2 ]; then
	 sudo iptables -A $chain -s $ip_source -d $ip_destination -p $proto -j $rule
	 echo "Proses berhasil dilakukan"
	 read -p "Press any key"
	 main         
	 else if [ $yesno == 2 ]; then
	 main
	 fi
	 fi
	 fi
}
main
