public class Parent {
	private void method_1() {System.out.println("Parent.method_1");}
	public void method_2() {System.out.println("Parent.method_2"); this.method_1();}
}
