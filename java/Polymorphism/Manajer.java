public class Manajer extends Pegawai {
	private double tunjangan;
	//
	public Manajer(String nama, double gaji, double tunjangan) {super(nama,gaji); this.tunjangan = tunjangan;}
	public double getTunjangan() {return this.tunjangan;}
	public void work() {System.out.println("Aku me-manage karyawan dan projek-nya");}
}
