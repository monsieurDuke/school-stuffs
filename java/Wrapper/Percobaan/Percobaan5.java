public class Percobaan5 {
	public Percobaan5() {
		Integer i = new Integer(20);
		System.out.println("angka : " + i + "\n---");
		System.out.println("binary      : " + Integer.toBinaryString(i) + " : " + i);
        System.out.println("binary <- 2 : " + Integer.toBinaryString(Integer.rotateLeft(i, 2)) + " : " + Integer.rotateLeft(i, 2));
        System.out.println("binary -> 2 : " + Integer.toBinaryString(Integer.rotateRight(i, 2)) + " : " + Integer.rotateRight(i, 2));
		System.out.println("binary <<>> : " + Integer.toBinaryString(Integer.reverse(i)) + " : " + Integer.reverse(i));
		System.out.println("binary ^1   : " + Integer.highestOneBit(i));
		System.out.println("binary v1   : " + Integer.lowestOneBit(i));
		System.out.println("binary (n)  : " + Integer.bitCount(i));
		System.out.println("binary 0... : " + Integer.numberOfLeadingZeros(i));
		System.out.println("binary ...0 : " + Integer.numberOfTrailingZeros(i));
	}
}
