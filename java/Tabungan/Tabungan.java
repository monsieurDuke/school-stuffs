/**
	Tabungan Class
*/
public class Tabungan {
	int saldo; boolean check_bol;
	public Tabungan(int initSaldo) {saldo = initSaldo;}
	public int getSaldo() {return saldo;}	
	public void simpanUang(int jumlah) {saldo += jumlah;}

	public boolean ambilUang(int jumlah) {
		if ((saldo - jumlah) < 0) {
			check_bol = false;} 
		else {
			saldo -= jumlah;
			check_bol = true;}
		return check_bol;}

	public Tabungan transferUang(Tabungan trans, int jumlah) {
		check_bol = this.ambilUang(jumlah);
		if (check_bol) { trans.simpanUang(jumlah); }
		return trans;}
}