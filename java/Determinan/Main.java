public class Main {
	public static void main(String[] args) {
		double get_det;
		Determinan obj = new Determinan(3,10,4);
		get_det = obj.get_Res();
		System.out.println(get_det);
		obj.calc(get_det);
		obj.display();
	}
}
