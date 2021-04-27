import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
	Scanner in = new Scanner(System.in);
	//	Rata_Siswa obj = new Rata_Siswa();
	//	obj.Calc();
	//	double get_arr[] = obj.GetRata_Rata();
	//	for(int i = 0; i < obj.GetRata_Rata().length; i++) {
	//		System.out.println(i + " | " + obj.GetRata_Rata()[i]);
	//	}
	// 	-----------
	//	Fibonnaci obj = new Fibonnaci();
	//	System.out.print("Masukan Panjang Deret : "); int get_len = in.nextInt();
	//	obj.setLength(get_len);
	//	obj.calc();
	//	int get_arr[] = obj.getDeret();
	//	for(int i = 0; i < get_arr.length; i++) {
	//		System.out.print(get_arr[i] + " ");
	//	}
	//	System.out.println();
	//	-----------
		Prima obj = new Prima();
		System.out.print("Masukan Panjang Deret : "); int get_len = in.nextInt();
		obj.setLength(get_len);
		obj.calc();
		int get_arr[][] = obj.getDeret();
		for (int i = 0; i < get_arr[0].length; i++) {
			System.out.print(get_arr[0][i] + " ");
			if (get_arr[1][i] == 1) {System.out.print("Genap\n");} else {System.out.print("Ganjil\n");}
		}
	}
}
