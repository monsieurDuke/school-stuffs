public class MyBoi {
	public static void main(String[] args) {
		MyChild child = new MyChild(10,20,30);
		MyParent parent = new MyParent(10,20);
		int x = child.addMe(10,20,30);
		int y = child.addMe(child);
		int z = parent.addMe(parent);
		System.out.println("x : " + x + "\ny : " + y + "\nz : " + z);
	}
}
