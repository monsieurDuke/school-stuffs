public class Lat2 {
	private int get_order, temp_faktor, set_faktor;
	public Lat2(int get_order){this.get_order = get_order; this.temp_faktor = 1;}
	public void factor() {
		for (int i = 1; i <= get_order; i++) {
			set_faktor = temp_faktor  * i;
			temp_faktor = set_faktor;
			System.out.println(i+" | "+set_faktor);
		}
	}
}
