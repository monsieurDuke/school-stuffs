import java.util.Scanner;
/*
--------
Truk
--------
- muatan : double
- max_muatan : double
--------
+ Truk(max_berat : double)
+ getMuatan() : double
+ getMaxMuatan() : double
+ setMuatan(berat : double)
+ setMaxMuatan(berat : double)
+ addMuatan(berat : double) : boolean
+ removeMuatan(berat : double) : boolean
+ new2kilo(berat : double) : double    // kilo = nw / 9.8
+ kilo2new(berat : double) : double    // newton = kg * 9.8 
--------
*/

public class Main {
	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);		
		Truk obj = new Truk(500);
		double berat; String opt; boolean check;

		while (true) {
			System.out.println("1. SET MUATAN\t\t4. TAMBAH MUATAN\n2. SET MAX MUATAN\t5. KURANG MUATAN\n3. CEK MUATAN\n-----"); 
			while (true) {
				System.out.print(">> "); opt = read.next();
				System.out.println("-----");
				switch (opt) {
					case "4":
						System.out.print("NILAI MUATAN : "); berat = read.nextDouble(); check = obj.addMuatan(berat);
						if (check) {System.out.println("[STATUS]: OK");} else {System.out.println("[STATUS]: GAGAL");}
						break;
					case "5":
						System.out.print("NILAI MUATAN : "); berat = read.nextDouble(); check = obj.addMuatan(berat);
						if (check) {System.out.println("[STATUS]: OK");} else {System.out.println("[STATUS]: GAGAL");}					
						break;
					case "3":
						System.out.println("MUATAN SEKARANG : "+obj.getMuatan()+" ("+obj.new2kilo(obj.getMuatan())+" kg)");
						System.out.println("MUATAN MAKSIMAL : "+obj.getMaxMuatan()+" ("+obj.new2kilo(obj.getMaxMuatan())+" kg)");
						break;
					case "1":
						System.out.print("NILAI MUATAN : "); berat = read.nextDouble();					
						obj.setMuatan(berat);
						break;
					case "2":
						System.out.print("NILAI MUATAN : "); berat = read.nextDouble();					
						obj.setMaxMuatan(berat);
						break;
				}
				System.out.println("");
			}
		}

	}
}