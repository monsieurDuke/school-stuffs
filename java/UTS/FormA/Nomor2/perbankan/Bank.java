package perbankan;
public class Bank {
	//
	private Nasabah[] nasabah;
	private int jumlah_nasabah;
	//
	public Bank(int jumlah_nasabah) {nasabah = new Nasabah[jumlah_nasabah];}
	public void tambahNasabah(String nama_awal, String nama_akhir) {
		this.nasabah[this.jumlah_nasabah] = new Nasabah(nama_awal, nama_akhir);
		this.jumlah_nasabah++;
	}
	public int getJumlahNasabah() {return this.nasabah.length;}
	public Nasabah getNasabah(int idx_nasabah) {return this.nasabah[idx_nasabah];}
}
