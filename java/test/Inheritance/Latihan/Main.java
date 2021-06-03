import perbankan.*;
public class Main {
	public static void main(String[] args) {
		PenyimpananUang tabungan = new PenyimpananUang(5000, 8.5/100);
		System.out.println("awal tabungan  : 5000");
		System.out.println("tingkat bunga  : " + tabungan.getBunga());
		System.out.println("total tabungan : " + tabungan.cekUang());
	}
}
