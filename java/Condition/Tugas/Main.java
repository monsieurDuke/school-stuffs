public class Main {
	public static void main(String[] args) {
		double get_det;
		Tugas1 obj = new Tugas1(3,10,4);
		get_det = obj.get_Res();
		System.out.println(get_det);
		obj.calc(get_det);
		obj.display();

		boolean check;
		Tugas2 obj2 = new Tugas2(2020,2000,2030);
		check = obj2.calc_kabisat();
		obj2.check_kabisat(check);

	}
}
