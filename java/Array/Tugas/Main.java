import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
	//	boolean check;
	//	Posisi obj = new Posisi();
	//	System.out.print("Mencari posisi dari angka : "); int num = in.nextInt();
	//	check = obj.locateXY(num);
	//	int[] posisi = obj.getPosisi();
	//	if (check) {
	//		System.out.println(num + " berada di [ " + posisi[0] + " , " + posisi[1] + " ]");
	//	}
	//	--------------
	//	System.out.print("Masukan Kalimat : "); String kalimat = in.nextLine();
	//	System.out.print("Cari Huru-mu    : "); char huruf = in.next().charAt(0);
	//	CariHuruf obj = new CariHuruf(kalimat);
	//	System.out.println("Huruf " + huruf + " muncul  : " + obj.locate(huruf) + " kali");
	//	--------------
		AksesArray obj = new AksesArray();
		obj.display();
	}
}
