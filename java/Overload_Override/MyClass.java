public class MyClass {
	public void method(int i) {System.out.println("integer " + i);}
	public void method(String s) {System.out.println("string " + s);}
	public static void main(String[] args) {
		MyClass obj = new MyClass();
		char c = 'a';
		obj.method(c);
	}
}
