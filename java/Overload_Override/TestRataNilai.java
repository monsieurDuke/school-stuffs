public class TestRataNilai {
	public static void main(String[] args) {
		RataNilai rn = new RataNilai();
		System.out.println("Average 15.03 + 12.12 : " + rn.average(15.03,12.12));
		System.out.println("Average 3 + 20 : " + rn.average(3,20));
		System.out.println("Average 12 + 19 + 30 : " + rn.average(12,19,30));
	}
}
