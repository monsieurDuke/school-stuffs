public class Percobaan6 {
	public Percobaan6() {
		System.out.println("Unboxing\n---");
		Integer y = new Integer(567);
		int x = y.intValue();
		System.out.println("x = " + x);
		x++;
		y = new Integer(x);
		System.out.println("y = " + y + "\n");

		System.out.println("Auto-boxing\n---");
		Integer z = new Integer(567);
		System.out.println(z);
		z++;
		System.out.println(z);
	}
}
