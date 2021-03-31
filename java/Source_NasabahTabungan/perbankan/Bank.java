package perbankan;

public class Bank {
	private Nasabah[] nasabah;
	private int jumlah_nasabah;

	public Bank(){jumlah_nasabah = 0; nasabah = new Nasabah[10];}
	public void tambahNasabah(String nama_depan, String nama_akhir){
		nasabah[this.jumlah_nasabah] = new Nasabah(nama_depan,nama_akhir);
		this.jumlah_nasabah++;
	}
	public int getJumlahNasabah(){
		this.jumlah_nasabah = nasabah.length; 
		return this.jumlah_nasabah;
	}
	public Nasabah getNasabah(int index){return nasabah[index];}

}