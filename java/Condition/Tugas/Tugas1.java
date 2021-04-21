import java.lang.Math;

public class Tugas1 {
	private double var_a, var_b, var_c, det, pass_det;
	private double var_x1, var_x2;
	public Tugas1(int var_a, int var_b, int var_c){
		this.var_a = Double.valueOf(var_a); this.var_b = Double.valueOf(var_b); this.var_c = Double.valueOf(var_c);
		this.det = (Math.pow(this.var_b,2)) - (4 * this.var_a * this.var_c);
		System.out.println("det : "+this.det);
	}
	public double get_Res(){this.pass_det = Double.compare(this.det,0); return this.pass_det;}
	public double get_X1(){return this.var_x1;}
	public double get_X2(){return this.var_x2;}
	public void calc(double pass_det){
		if (pass_det == 0) {
			this.var_x1 = -1 * this.var_b / (2 * this.var_a);
			this.var_x2 = this.var_x1;
		} else if (pass_det > 0) {
			this.var_x1 = ((-1 * this.var_b) + Math.pow(this.det,0.5)) / (2 * this.var_a);
			this.var_x2 = ((-1 * this.var_b) - Math.pow(this.det,0.5)) / (2 * this.var_a);
		} else {
			this.var_x1 = ((-1 * this.var_b) / (2 * this.var_a)) + (Math.pow(this.det,0.5) / (2 * this.var_a));
			this.var_x2 = ((-1 * this.var_b) / (2 * this.var_a)) - (Math.pow(this.det,0.5) / (2 * this.var_a));
		}
	}
	public void display(){System.out.println("x1  : " + this.var_x1 + "\nx2  : " + this.var_x2);}
}
