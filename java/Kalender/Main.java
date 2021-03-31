import java.util.Scanner;
/*
--------
Kalender
--------
- private date  : int
- private month : int
- private year  : int
--------
+ Kalender(date : int)
+ Kalender(month : int, year : int)
+ Kalender(date : int, month : int, year : int)
+ setDate(date : int)		| + getDate() : int
+ setMonth(month : int)		| + getMonth() : int
+ setYear(year : int)		| + getYear() : int
--------
*/

public class Main {
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		Kalender obj = new Kalender(1,1,2000);
		String opt; int d,m,y;
		while (true) {
			System.out.println("1. UPDATE TANGGAL\t5. UPDATE BULAN + TAHUN\n2. UPDATE BULAN\t\t6. UPDATE KALENDER\n3. UPDATE TAHUN\n4. CEK KALENDER\n-----"); 
			while (true) {
				System.out.print(">> "); opt = read.next();
				System.out.println("-----");
				switch (opt) {
					case "1":
						System.out.print("UPDATE DD : "); d = read.nextInt();
						obj.setDate(d);
						break;
					case "2":
						System.out.print("UPDATE MM : "); m = read.nextInt();
						obj.setMonth(m);
						break;
					case "3":
						System.out.print("UPDATE YY : "); y = read.nextInt();
						obj.setYear(y);
						break;
					case "4":
						System.out.println(obj.showKalender());
						break;	
					case "5":
						System.out.print("UPDATE MM : "); m = read.nextInt();
						System.out.print("UPDATE YY : "); y = read.nextInt();						
						obj = new Kalender(m,y);
						break;
					case "6":
						System.out.print("UPDATE DD : "); d = read.nextInt();
						System.out.print("UPDATE MM : "); m = read.nextInt();
						System.out.print("UPDATE YY : "); y = read.nextInt();						
						obj = new Kalender(d,m,y);
						break;
				}
				System.out.println("");
			}
		}

	}
}