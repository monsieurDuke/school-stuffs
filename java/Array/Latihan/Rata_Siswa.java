public class Rata_Siswa {
	private String siswa[] = {"Ahmad","Adang","Dani","Edi"};
	private String pelajaran[] = {"MTK","ENG","ISS"};
	private double nilai[][] = new double[this.siswa.length][this.pelajaran.length];
	private double rata_rata[] = new double[this.nilai.length];

	public Rata_Siswa() {
		for(int i = 0; i < this.siswa.length; i++) {
			for(int j = 0; j < this.pelajaran.length; j++) {
		    	int random_int = (int)Math.floor(Math.random()*(100-71)+71);
				this.nilai[i][j] = Double.valueOf(random_int);
			}
		}
	}

	public void Calc() {
		for(int i = 0; i < this.siswa.length; i++) {
			for(int j = 0; j < this.pelajaran.length; j++) {
				this.rata_rata[i] += this.nilai[i][j];
			}
			this.rata_rata[i] /= this.nilai[i].length;
		}
	}
	public double[] GetRata_Rata() {return this.rata_rata;}
}
