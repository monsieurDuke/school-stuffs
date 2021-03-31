import java.util.Scanner;
import perbankan.*;

public class Main {
	public static void main(String[] args) {
		int tmp; boolean status; String nama_depan, nama_akhir;

		Scanner read = new Scanner(System.in);		
		System.out.print("nama depan : "); nama_depan = read.next();
		System.out.print("nama akhir : "); nama_akhir = read.next();; System.out.println("---");		
		Nasabah nasabah = new Nasabah(nama_depan,nama_akhir);
		System.out.println("nama nasabah    : " + nasabah.getNama_Depan()+" "+nasabah.getNama_Akhir());

		nasabah.setTabungan(new Tabungan(5000));
		System.out.println("saldo sekarang  : " + nasabah.getTabungan().getSaldo());

		nasabah.getTabungan().simpanUang(3500);
		System.out.println("saldo + 3500    : " + nasabah.getTabungan().getSaldo() + "\t[OK]");

		status = nasabah.getTabungan().ambilUang(10000);
		if (status) {
			System.out.println("saldo - 10.000  : " + nasabah.getTabungan().getSaldo() + "\t[OK]");			
		} else {System.out.println("saldo - 10.000  : " + nasabah.getTabungan().getSaldo() + "\t[GAGAL]");}

		nasabah.getTabungan().simpanUang(1500);
		System.out.println("saldo + 1500    : " + nasabah.getTabungan().getSaldo() + "\t[OK]");

		status = nasabah.getTabungan().ambilUang(1000);
		if (status) {
			System.out.println("saldo - 1000    : " + nasabah.getTabungan().getSaldo() + "\t[OK]");			
		} else {System.out.println("saldo - 1000    : " + nasabah.getTabungan().getSaldo() + "\t[GAGAL]");}
		System.out.println("---");


		Bank bank = new Bank();
		bank.tambahNasabah("Muhammad","Irsyad");
		bank.getNasabah(0).setTabungan(new Tabungan(7000));
		bank.tambahNasabah("Erocooo","Altar");
		bank.getNasabah(1).setTabungan(new Tabungan(8500));
		bank.tambahNasabah("Exmonad","Mobar");
		bank.getNasabah(2).setTabungan(new Tabungan(9000));		

		for (int i=0; i<bank.getJumlahNasabah(); i++) {
			try {
				System.out.println("Nasabah ("+i+") | "+bank.getNasabah(i).getNama_Depan()+" "+bank.getNasabah(i).getNama_Akhir()+"\t Rp."+bank.getNasabah(i).getTabungan().getSaldo());
			}
			catch(Exception e){}
		}

	}
}
