import java.util.Scanner;

public class lat_119 {

	static class Display {
		void Calc(double min) {
			double totall = 0; 
			double temp_min = 0; 
			double price_min = 29.95; 
			double temp_price = 0;
			if (min <= 300) {
				totall = price_min;
			} else {
				temp_min = min - 300;
				temp_price = temp_min * 0.45;
				totall = price_min + temp_price;
			}
			totall = totall * 1.125;
			System.out.println(totall);
		}
	}	
	public static void  main(String[] args) {
		Scanner read = new Scanner(System.in);
		System.out.print("Minute : "); double in = read.nextDouble();		
		Display obj = new Display();
		obj.Calc(in);
	}
}