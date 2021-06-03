package perbankan;
public class PenyimpananUang extends Tabungan {
	//
	private double tingkatBunga;
	//
	public PenyimpananUang(int saldo, double tingkatBunga) {
		super.simpanUang(saldo);
		this.tingkatBunga = tingkatBunga;
		this.saldo += (saldo * this.tingkatBunga);
	}
	public double cekUang() {return Double.valueOf(this.saldo);}
	public double getBunga() {return this.tingkatBunga;}
}
