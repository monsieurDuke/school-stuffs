public class Calc {
	private int number_a, number_b, result;
	public Calc(){this.number_a = 1; this.number_b = 1;}

	public void Calc(int number_a, int number_b){
		this.result = number_a + number_b;
	}
	public void Calc(int number_a, int number_b, int div){
		this.result = (number_a + number_b)/div;
	}	
	public int Calc(){return this.result;}
	public void Calc(int mod){this.result = this.result%mod;}
}
