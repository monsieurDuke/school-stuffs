package perbankan;
public class Tabungan {
	//
	private int saldo;
	//
	public Tabungan(int saldo) {this.saldo = saldo;}
	public int getSaldo() {return this.saldo;}
	public void simpanUang(int amount) {this.saldo += amount;}
	public boolean ambilUang(int amount) {
		if ((this.saldo - amount) >= 0) {this.saldo -= amount; return true;}
		else {return false;}
	}
}
