package perbankan;

public class Nasabah {
	private String nama_depan;
	private String nama_akhir;
	private Tabungan tabungan;

	public Nasabah(String nama_depan, String nama_akhir) {
		this.nama_depan = nama_depan;
		this.nama_akhir = nama_akhir; }

	public String getNama_Depan(){return this.nama_depan;}
	public String getNama_Akhir(){return this.nama_akhir;}
	public Tabungan getTabungan(){return this.tabungan;}
	public void setTabungan(Tabungan tabungan){this.tabungan = tabungan;}
}