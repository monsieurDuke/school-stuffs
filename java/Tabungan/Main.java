import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		Tabungan obj = new Tabungan(5000);
		Tabungan obj_teman = new Tabungan(5000);
		int pass_uang; boolean checker; String opsi;
		while (true) {
			System.out.println("-------------\n1. Simpan\n2. Ambil\n3. Cek Saldo\n4. Transfer\n-------------"); 
			while (true) {
				System.out.print(">> "); 
				opsi = read.next();
				System.out.println("----");
				switch(opsi) {
					case "1":
						System.out.print("Nominal Simpan : "); pass_uang = read.nextInt(); obj.simpanUang(pass_uang);
						System.out.println("Status : OK\n");
						break;
					case "2":
						System.out.print("Nominal Ambil  : "); pass_uang = read.nextInt(); checker = obj.ambilUang(pass_uang);
						if (checker) { System.out.println("Status : OK\n"); }
						else { System.out.println("Status : GAGAL\n"); }
						break;
					case "3":
						System.out.println("Saldo Saya     : " + obj.saldo);
						System.out.println("Saldo Teman    : " + obj_teman.saldo+"\n");						
						break;
					case "4":
						System.out.print("Nominal Kirim  : "); pass_uang = read.nextInt(); Tabungan obj2 = obj.transferUang(obj_teman, pass_uang);
						if (obj.check_bol) { System.out.println("Status : OK\n"); }
						else { System.out.println("Status : GAGAL\n"); }
						break;
				}
			}
		}
		/*
		System.out.print("Jumlah uang simpan    : "); pass_uang = read.nextInt(); obj.simpanUang(pass_uang);
		System.out.print("Jumlah uang ambil     : "); pass_uang = read.nextInt(); obj.ambilUang(pass_uang);
		System.out.print("Jumlah uang simpan    : "); pass_uang = read.nextInt(); obj.simpanUang(pass_uang);
		System.out.print("Jumlah uang ambil     : "); pass_uang = read.nextInt(); obj.ambilUang(pass_uang);
		System.out.print("Jumlah uang transfer  : "); pass_uang = read.nextInt(); Tabungan obj2 = obj.transferUang(new Tabungan(0), pass_uang);
		System.out.println("-------\nSaldo Obj   = " + obj.saldo);
		System.out.println("-------\nSaldo Obj 2 = " + obj2.saldo); */				
	}
}