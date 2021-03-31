import java.util.Scanner;
/*
--------
Mobil
--------
- private brand : String 	| - private color : String
- private type  : String 	| - private cc    : int
- private qty   : int
--------
+ Mobil(brand : String, type : String, color : String, cc : int, qty : int)
+ getInfo() : String
+ setBrand(brand : String)	| + setColor(color : String)
+ setType(type : String)	| + setCC(cc : int)
+ setQty(qty : int)
--------
*/

public class Main {
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		Mobil car1 = new Mobil("Toyota","Mini Bus","Blue Ocean",2000,7);
		Mobil car2 = new Mobil("Daihatsu","Pick Up","Black Mamba",2000,7);
		Mobil car3 = new Mobil("Suzuki","SUV","Silver Surfer",2000,7);
		Mobil car4 = new Mobil("Honda","Sedan","Red Maroon",2000,7);

		System.out.println(car2.getInfo());	
		System.out.println("---\naku mau " + car2.getBrand() + " warna " + car2.getColor());			

	}
}
