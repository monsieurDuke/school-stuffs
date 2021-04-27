public class Fibonnaci {
	private int deret[];
	private int temp, get_temp;

	public void setLength(int len) {this.deret = new int[len];}
	public void calc() {
		for(int i = 0; i < this.deret.length; i++) {
			if (i < 2) {this.deret[i] = i; continue;}
			this.deret[i] = this.deret[i-1] + this.deret[i-2];
		}
	}
	public int[] getDeret() {return this.deret;}
}
