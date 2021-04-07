public class Lat4 {
	private int get_order, seq, temp_seq;
	public Lat4(int get_order){this.get_order = get_order; this.temp_seq = 1;}
	public void sequence() {
		for (int i = 1; i <= get_order; i++) {
			if ((i % 2) == 0 && (i % 6) != 0) {
				System.out.println(i);
			}
		}
	}
}
