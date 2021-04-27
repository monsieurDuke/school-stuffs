import java.util.Scanner;

public class Latihan {
	public void Num1() {
		Integer i = 42;
		String s = (i<40)?"life":(i>50)?"universe":"everything";
		System.out.println(s);
	}
	public void Num2() {
		Short s = 15;
		Boolean b;
		b = (s instanceof Short);
	}
	public void Num3(String[] argz) {
		if (argz.length == 1 | argz[1].equals("test")) {System.out.println("test case");}
		else {System.out.println("production " + argz[0]);}
	}
	public void Num4() {
		Integer x = 0;
		Integer y = 0;
		for (Short z = 0; z < 5; z++) {
			if ((++x > 2) || (++y > 2)) {x++;}}
		System.out.println(x + " " + y);
	}
	public void Num5() {
		Boolean b1 = true;
		boolean b2 = false;
		boolean b3 = true;
		if ((b1 & b2) | (b2 & b3) & b3) {System.out.print("alpha ");}
		if ((b1 = false) | (b1 & b3) | (b1 | b2)) {System.out.print("beta ");}
	}
	public void Num6() {
		Long x = 42L;
		Long y = 44L;
		System.out.print(" " + 7 + 2 + " ");
		System.out.print(foo() + x + 5 + " ");
		System.out.println(x + y + foo());
	}
	public String foo() {return "foo";}
	//---------------------------------------------------
	public void Num78() {
		Scanner in = new Scanner(System.in);
		System.out.print("integer : "); int num = in.nextInt();
		System.out.print("basis   : "); int basis= in.nextInt();

		System.out.println("---\nbiner   : " + Integer.toBinaryString(num));
		System.out.println("octal   : " + Integer.toOctalString(num));
		System.out.println("hexa    : " + Integer.toHexString(num));
		System.out.println("decimal : " + Integer.toString(num, basis));
	}
	public void Num9() {
		Float f = 2.3f;
		Double d = 34.7;
		System.out.println(f + " | " + d);
		f = d.floatValue();
		System.out.println(f + " | " + d);
	}
	public void Num9b() {
		Long l = 10L;
		Integer i = 2;
		System.out.println(i + " | " + l);
		i = l.intValue();
		l = i.longValue();
		System.out.println(i + " | " + lcat );
	}

	public static void main(String[] args) {
		Latihan obj = new Latihan();
		obj.Num9b();
	}
}
