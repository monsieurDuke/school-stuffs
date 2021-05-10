import java.util.Scanner;
import perbankan.*;

public class Main {
	//
	private static int idx, jumlah, idx_transfer;
	private static boolean check;
	//
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		System.out.print("banyak nasabah   : "); int tot_nasabah = read.nextInt(); System.out.println("=====");
		Bank bank = new Bank(tot_nasabah);
		for (int i = 0; i < bank.getJumlahNasabah(); i++) {
			System.out.print("["+i+"] nama_awal nasabah  : "); String nama_awal = read.next();
			System.out.print("["+i+"] nama_akhir nasabah : "); String nama_akhir = read.next();
			bank.tambahNasabah(nama_awal, nama_akhir);
			bank.getNasabah(i).setTabungan(new Tabungan(1000));
			System.out.println("["+i+"] jumlah saldo awal  : " + bank.getNasabah(i).getTabungan().getSaldo()); System.out.println("---");
		}
		while (true) {
			System.out.println("\n1. cek saldo\n2. simpan uang\n3. tarik uang\n4. transfer uang\n---");
			System.out.print(">> "); char opt = read.next().charAt(0);
			switch (opt) {
				case '1':
					System.out.print("---\nindex  : "); idx = read.nextInt();
					System.out.println("saldo  : " + bank.getNasabah(idx).getTabungan().getSaldo());
					break;
				case '2':
					System.out.print("---\nindex  : "); idx = read.nextInt();
					System.out.print("jumlah : "); jumlah = read.nextInt();
					bank.getNasabah(idx).getTabungan().simpanUang(jumlah);
					System.out.println("saldo  : " + bank.getNasabah(idx).getTabungan().getSaldo());
					break;
				case '3':
					System.out.print("---\nindex  : "); idx = read.nextInt();
					System.out.print("jumlah : "); jumlah = read.nextInt();
					check = bank.getNasabah(idx).getTabungan().ambilUang(jumlah);
					if (check) {System.out.println("saldo  : " + bank.getNasabah(idx).getTabungan().getSaldo());}
					break;
				case '4':
					System.out.print("---\nindex  : "); idx = read.nextInt();
					System.out.print("jumlah : "); jumlah = read.nextInt();
					System.out.print("tujuan : "); idx_transfer = read.nextInt();
					check = bank.getNasabah(idx).getTabungan().ambilUang(jumlah);
					if (check) {
						bank.getNasabah(idx_transfer).getTabungan().simpanUang(jumlah);
						System.out.println("saldo  : " + bank.getNasabah(idx).getTabungan().getSaldo());
						System.out.println("tujuan : " + bank.getNasabah(idx_transfer).getTabungan().getSaldo());
					}
					break;
			}
		}
	}
}
