package perbankan;
public class PengambilanUang extends Tabungan {
	//
	private int proteksi;
	//
	public PengambilanUang(int saldo) {this.saldo = saldo;}
	public PengambilanUang(int saldo, int proteksi) {this.saldo = saldo; this.proteksi = proteksi;}
	public int getSaldo() {return this.saldo;}
	public int getProteksi() {return this.proteksi;}
	public boolean ambilUang(int jumlah) {
		if ((this.saldo - jumlah) > this.proteksi) {this.saldo -= jumlah; return true;}
		else {return false;}
	}
}
