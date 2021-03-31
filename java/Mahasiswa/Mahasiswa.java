public class Mahasiswa {

	private int nim; private String nama;
	public Mahasiswa() {this.nim = 0; this.nama = "default";}
	public Mahasiswa(String nama) {this.nim = 0; this.nama = nama;}
	public Mahasiswa(int nim, String nama) {this.nim = nim; this.nama = nama;}

	public void setNama(String nama) {this.nama = nama;} 	public String getNama() {return this.nama;}
	public void setNim(int nim) {this.nim = nim;}			public int getNim() {return this.nim;}

}