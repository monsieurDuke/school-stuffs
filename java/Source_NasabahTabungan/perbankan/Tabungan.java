package perbankan;

public class Tabungan {
	private int saldo;

	public Tabungan(int saldo){this.saldo = saldo;}
	public int getSaldo(){return this.saldo;}
	public void simpanUang(int jumlah){this.saldo += jumlah;}
	public boolean ambilUang(int jumlah){
		if((this.saldo - jumlah) < 0) {
			return false;
		} else {this.saldo -= jumlah; return true;} }

}