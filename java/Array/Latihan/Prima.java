public class Prima {
	private int deret[][];
	private int inc = 1;

	public void setLength(int len) {this.deret = new int[2][len];}
	public void calc() {
		for (int i = 0; i < this.deret[0].length; i++) {
			this.deret[0][i] = inc;
			if ((i % 2) != 0) {this.deret[1][i] = 1;}
			inc++;
		}
	}
	public int[][] getDeret() {return this.deret;}
}
