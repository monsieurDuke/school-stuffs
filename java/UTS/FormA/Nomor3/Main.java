import kendaraan.*;
import java.util.Scanner;

public class Main {
	//
	private static Mobil[] mobil = new Mobil[4];
	private static Motor[] motor = new Motor[4];
	private static String vendor, color, type;
	private static int horsepwr, seat, rating;
	//
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		for (int i = 0; i < motor.length; i++) {
			System.out.print("["+i+"] vendor : "); vendor = read.next();
			System.out.print("["+i+"] color  : "); color = read.next();
			System.out.print("["+i+"] power  : "); horsepwr = read.nextInt();
			System.out.print("["+i+"] rating : "); rating = read.nextInt();
			System.out.println("---");
			motor[i] = new Motor(vendor, color, horsepwr, rating);
		}
		for (int i = 0; i < motor.length; i++) {motor[i].showInfo(i);}
	}
}
