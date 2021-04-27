import java.util.Scanner;

public class Tugas {
	private String input;
	public void No1() {
		Scanner in = new Scanner(System.in);
		System.out.print("masukan input : "); input = in.nextLine();
		try {
			Integer c_int = Integer.valueOf(input);
			System.out.println("---\nString  > Integer : " + c_int);
			String s = Integer.toString(c_int);
			System.out.println("Integer > String  : " + s);
			int p_int = c_int;
			System.out.println("Integer > int     : " + p_int);
			Integer cc_int = new Integer(p_int);
			System.out.println("int     > Integer : " + cc_int);
			int pp_int = Integer.parseInt(s);
			System.out.println("int     > String  : " + pp_int);
			String ss = ""+pp_int;
			System.out.println("String  > int     : " + ss);
			Float f = cc_int.floatValue();
			System.out.println("Integer > Float   : " + f);
			double d = cc_int.doubleValue();
			System.out.println("Integer > double  : " + d);
		} catch(Exception e) {}
	}
	public void No2(String[] args) {
		int catch_num = 0;
		for (int i = 0; i < args.length; i++) {catch_num += Integer.valueOf(args[i]);}
		System.out.println("jumlah argumen : " + catch_num);
	}
}
