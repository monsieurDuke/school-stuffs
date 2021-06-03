import perbankan.*;
public class Main {
	public static void main(String[] args) {
		PengambilanUang tabungan = new PengambilanUang(5000,1000);
		System.out.println("awal tabungan  : 5000");
		System.out.println("batas proteksi : " + tabungan.getProteksi() + "\n---");
		System.out.print("uang diambil   : 4500");
		if (tabungan.ambilUang(4500)) {System.out.print("[OK]\n");}
		else {System.out.print("[GAGAL]\n");}
		System.out.println("saldo sekarang : " + tabungan.getSaldo() + "\n---");
		System.out.print("uang diambil   : 2500");
		if (tabungan.ambilUang(2500)) {System.out.print("[OK]\n");}
		else {System.out.print("[GAGAL]\n");}
		System.out.println("saldo sekarang : " + tabungan.getSaldo());
	}
}
