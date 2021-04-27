public class Percobaan3 {
	public Percobaan3() {
		Integer i1 = new Integer(345);
		System.out.println("nilai int  = " + i1);
		System.out.println("bil binary = " + Integer.toBinaryString(i1));
		System.out.println("bil hexa   = " + Integer.toHexString(i1));
		System.out.println("bil oktal  = " + Integer.toOctalString(i1) + "\n");
		Integer i2 = new Integer(675);
		System.out.println("nilai int  = " + i2);
		System.out.println("bil binary = "+Integer.toString(i2, 2));
		System.out.println("bil hexa   = " +Integer.toString(i2, 8));
		System.out.println("bil oktal  = " + Integer.toString(i2, 16));
	}
}
