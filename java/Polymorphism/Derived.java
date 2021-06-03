public class Derived extends Base {
	int i = -1;
	public static void main(String[] args) {
		Base a = new Base();
		Base b = new Derived();
		System.out.println("i = " + b.i);
		b.method();
	}
	public void method(){System.out.println("Derived.method");}
}
