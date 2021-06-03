public class Child extends Parent {
	public void method_1() {System.out.println("Child.method_1");}
	public static void main(String[] args) {
		Parent p = new Child();
		p.method_2();
	}
}
