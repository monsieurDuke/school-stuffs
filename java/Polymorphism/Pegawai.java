public class Pegawai {
	protected String nama;
	protected double gaji;
	//
	public Pegawai(String nama, double gaji) {this.nama = nama; this.gaji = gaji;}
	public String getNama() {return this.nama;}
	public double getGaji() {return this.gaji;}
	public void work() {System.out.println("@override");}
}
