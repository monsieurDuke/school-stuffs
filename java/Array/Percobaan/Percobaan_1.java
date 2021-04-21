public class Percobaan_1 {
	private int nilai[] = new int[3];
	private double rata = 0.0;
	public Percobaan_1() {
		this.nilai[0] = 70;
		this.nilai[1] = 80;
		this.nilai[2] = 100;

		for(int i=0; i < this.nilai.length; i++) {this.rata += this.nilai[i];}
		this.rata /= this.nilai.length;
	}
	public int[] GetArr() {return this.nilai;}
	public double GetRata() {return this.rata;}
}
