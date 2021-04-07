public class Truk extends KendaraanBermotor{
	private int daya_angkut;
	public void muatBarang(int daya_angkut){this.daya_angkut += daya_angkut;}
	public void bongkarMuatan(int bongkar_muatan){
		if ((this.daya_angkut - bongkar_muatan) > 0) {
			this.daya_angkut -= bongkar_muatan;
		}
	}
	public int get_dayaangkut(){return this.daya_angkut;}
}
