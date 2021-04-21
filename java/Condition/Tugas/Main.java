public class Main {
	public static void main(String[] args) {
		double get_det;
		Tugas1 obj = new Tugas1(1,5,4);
		get_det = obj.get_Res();
		obj.calc(get_det);
		obj.display();

		boolean check;
		Tugas2 obj2 = new Tugas2(2020,2000,2030);
		check = obj2.calc_kabisat();
		obj2.check_kabisat(check);

	}
}
/*
a = 1, b = 5, c = 4
D : b2 - 4ac
D : 25 - 4(1x4)
D : 9

x1 : (-5 + 3) / 2 : -2 / 2 : -1
x2 : (-5 - 3) / 2 : -8 / 2 : -4

*/
