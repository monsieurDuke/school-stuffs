public class Kecebong extends Katak {
	private double ekor;
	public Kecebong(int umur, String nama, double ekor) {super(umur,nama); this.ekor = ekor;}
	public String caraBergerak() {return "Berenang";}
	public double getEkor() {return this.ekor;}
}
