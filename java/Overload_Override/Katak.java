public class Katak {
	protected int umur;
	protected String nama;
	public Katak(int umur, String nama) {this.umur = umur; this.nama = nama;}
	public String caraBergerak() {return "Melompat";}
	public int getUmur() {return this.umur;}
	public String getNama() {return this.nama;}
}
