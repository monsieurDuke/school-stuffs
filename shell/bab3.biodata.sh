#! /bin/bash
clear
read -p "DATA MAHASISWA     | Nama Lengkap   : " nama
read -p "ASAL SEKOLAH       | Tempat Lahir   : " tempat_l
read -p "DATA KELUARGA      | Tanggal Lahir  : " tanggal_l
read -p "PENGELUARAN        | Jenis Kelamin  : " jenis_k
read -p "LAIN - LAIN        | NIM            : " nim
read -p "CETAK TANDA BUKTI  | Agama          : " agama
read -p "                   | Warga Negara   : " agama
read -p "                   | Golongan Darah : " gol_dar
read -p "                   | Status Nikah   : " st_nikah
read -p "                   | Alamat         : " alamat
read -p "                   | No HP          : " no_hp
read -p "                   | Email          : " email
read -p "                   | Hobi           : " hobi
echo    "-------------------------------------"
read -p "Riwayat Pendidikan | SD             : " rp_sd rp_sd_thn
read -p "                   | SMP            : " rp_smp rp_smp_thn
read -p "                   | SMA            : " rp_sma rp_sma_thn
read -p "                   | UNI            : " rp_uni rp_uni_thn
echo    "------------------------------------- "
echo    ""
echo    ""

echo    ""
echo    "            BIODATA MAHASISWA         "
echo    ""
echo    "a. Biodata Mahasiswa                  "
echo    "------------------------------------- "
echo    "NIM                                 : "$nim
echo    "Nama Lengkap                        : "$nama
echo    "Tempat & Tanggal Lahir              : "$tempat_l", "$tanggal_l 
echo    "Agama                               : "$agama
echo    "Jenis Kelamin                       : "$jenis_k
echo    "Alamat Lengkap                      : "$alamat
echo    "No Telepon / HP                     : "$no_hp
echo    "ALamt Email                         : "$email
echo    ""
echo    "b. Riwayat Pendidikan Formal & Informal "
echo    "------------------------------------- "
echo    "1. "$rp_sd_thn  "  SD   "$rp_sd 
echo    "2. "$rp_smp_thn "  SMP  "$rp_smp 
echo    "3. "$rp_sma_thn "  SMA  "$rp_sma
echo    "4. "$rp_uni_thn "  UNI  "$rp_uni
echo    ""
echo    "Demikian Riwayat hidup ini saya buat dengan sebenarnnya"
echo    ""
echo    "                                 Jakarta, Desember 2011"
echo    "                                       Hormat saya,"
echo    ""
echo    "                                 "$nama


#--------------------------
#read -p "username : " name
#read -s -p "password : " pwd
#read -p "notrobot : " check
#echo "$name | $pwd ($check)"

