public class Posisi {
	private int[][] pool_arr = {{32,87,3,589}, {12,1076,2000,8}, {622,127,77,955}};
	private int[] xy;
	private boolean check;
	public Posisi() {
		this.check = false; 
		this.xy = new int[2];
		for (int i = 0; i < this.pool_arr.length; i++) {
			for (int j = 0; j < this.pool_arr[i].length; j++) {
				System.out.print(this.pool_arr[i][j] + "\t");
			}
			System.out.println();
		}
	}
	public boolean locateXY(int num) {
		for (int i = 0; i < this.pool_arr.length; i++) {
			for (int j = 0; j < this.pool_arr[i].length; j++) {
				if (pool_arr[i][j] == num) {
					this.xy[0] = i;
					this.xy[1] = j;
					this.check = true;
					break;
				}
			}
		}
		return this.check;
	}
	public int[] getPosisi() {return this.xy;}
}
