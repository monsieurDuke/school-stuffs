public class RataNilai {
	public int average(int a, int b) {return ((a+b)/2);}
	public double average(double a, double b) {
		int aa = (int) a;
		int bb = (int) b;
		return (Double.valueOf(this.average(aa, bb)));
	}
	public int average(int a, int b, int c) {
		return ((this.average(a,b)+c)/2);
	}
}
