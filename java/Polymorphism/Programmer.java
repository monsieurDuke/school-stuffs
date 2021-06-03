public class Programmer extends Pegawai {
	private double bonus;
	//
	public Programmer(String nama, double gaji, double bonus) {super(nama,gaji); this.bonus = bonus;}
	public double getBonus() {return this.bonus;}
	public void work() {System.out.println("Aku merancang program dan sistem pada produk");}
}
