package perbankan;
public class Nasabah {
	//
	private String nama_awal;
	private String nama_akhir;
	private Tabungan tabungan;
	//
	public Nasabah(String nama_awal, String nama_akhir) {
		this.nama_awal = nama_awal;
		this.nama_akhir = nama_akhir; }

	public String getNamaAwal() {return this.nama_awal;}
	public String getNamaAkhir() {return this.nama_akhir;}
	public Tabungan getTabungan() {return this.tabungan;}
	public void setTabungan(Tabungan tabungan) {this.tabungan = tabungan;}
}
