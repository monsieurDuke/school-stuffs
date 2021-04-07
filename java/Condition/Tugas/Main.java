import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		int year, floor, ceil;
		System.out.print("Cari Tahun  : "); year = read.nextInt();
		System.out.print("Awal Tahun  : "); floor = read.nextInt();
		System.out.print("Akhir Tahun : "); ceil = read.nextInt();
		Tugas2 obj = new Tugas2(year,floor,ceil);
		boolean check = obj.calc_kabisat();
		obj.check_kabisat(check);
	}
}
