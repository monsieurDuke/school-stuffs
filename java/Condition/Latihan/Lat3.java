public class Lat3 {
	private int get_order, temp_hop, hop, back_hop;
	public Lat3(int get_order){this.get_order = get_order; this.hop = 1;}
	public void fibonnaci() {
		for (int i = 0; i <= get_order; i++) {
			System.out.println(hop+" + "+temp_hop);
			back_hop = hop;
			hop = temp_hop + hop;
			temp_hop = back_hop;
		}
	}
}
