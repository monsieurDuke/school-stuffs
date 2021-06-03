import kendaraan.*;
import java.util.Scanner;
public class Main2 {
	//
	static Truk[] truk = new Truk[1];
	static Taksi[] taksi = new Taksi[1];
	static Sepeda[] sepeda = new Sepeda[1];
	static int roda, kapasitas_mesin, sadel, gir, tarif_awal, tarif_km, muatan_max;
	static String warna, bahan_bakar;
	static Scanner read = new Scanner(System.in);
	//
	public static void main(String[] args) {
		for(int i = 0; i < truk.length; i++) {
			System.out.print("[truk"+i+"]  - roda   : "); roda = read.nextInt();
			System.out.print("[truk"+i+"]  - warna  : "); warna = read.next();
			System.out.print("[truk"+i+"]  - bbm    : "); bahan_bakar = read.next();
			System.out.print("[truk"+i+"]  - cc     : "); kapasitas_mesin = read.nextInt();
			System.out.print("[truk"+i+"]  - muatan : "); muatan_max = read.nextInt();
			truk[i] = new Truk();
			truk[i].setRoda(roda);	truk[i].setWarna(warna); truk[i].setBahanBakar(bahan_bakar);
			truk[i].setKapasitasMesin(kapasitas_mesin); truk[i].setMuatanMax(muatan_max);

			System.out.println("---");
			System.out.print("[taksi"+i+"] - roda   : "); roda = read.nextInt();
			System.out.print("[taksi"+i+"] - warna  : "); warna = read.next();
			System.out.print("[taksi"+i+"] - bbm    : "); bahan_bakar = read.next();
			System.out.print("[taksi"+i+"] - cc     : "); kapasitas_mesin = read.nextInt();
			System.out.print("[taksi"+i+"] - tarif  : "); tarif_awal = read.nextInt();
			System.out.print("[taksi"+i+"] - per_km : "); tarif_km = read.nextInt();
			taksi[i] = new Taksi();
			taksi[i].setRoda(roda); taksi[i].setWarna(warna); taksi[i].setBahanBakar(bahan_bakar);
			taksi[i].setKapasitasMesin(kapasitas_mesin); taksi[i].setTarifAwal(tarif_awal); taksi[i].setTarifKM(tarif_km);

			System.out.println("---");
			System.out.print("[speda"+i+"] - roda   : "); roda = read.nextInt();
			System.out.print("[speda"+i+"] - warna  : "); warna = read.next();
			System.out.print("[speda"+i+"] - sadel  : "); sadel = read.nextInt();
			System.out.print("[speda"+i+"] - gir    : "); gir = read.nextInt();
			sepeda[i] = new Sepeda();
			sepeda[i].setRoda(roda); sepeda[i].setWarna(warna);
			sepeda[i].setSadel(sadel); sepeda[i].setGir(gir);
			System.out.println("");
		}
		System.out.println("");
		for(int i = 0; i < truk.length; i++) {
			System.out.println("truk"+i+" \t"+truk[i].getRoda()+" roda\t"+truk[i].getWarna()+"\t"+truk[i].getBahanBakar()+"\t"+truk[i].getKapasitasMesin()+" cc\t"+truk[i].getMuatanMax()+" kg");
		}
		for(int i = 0; i < taksi.length; i++) {
			System.out.println("taksi"+i+"\t"+taksi[i].getRoda()+" roda\t"+taksi[i].getWarna()+"\t"+taksi[i].getBahanBakar()+"\t"+taksi[i].getKapasitasMesin()+" cc\tRp "+taksi[i].getTarifAwal()+" awal\tRp "+taksi[i].getTarifKM()+" / km");
		}
		for(int i = 0; i < taksi.length; i++) {
			System.out.println("speda"+i+"\t"+sepeda[i].getRoda()+" roda\t"+sepeda[i].getWarna()+"\t"+sepeda[i].getSadel()+" sadel\t"+sepeda[i].getGir()+" gigi");
		}
	}
}
