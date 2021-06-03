package packageX.packageY;
import packageX.*;

public class SubclassY extends SuperclassX {
	SuperclassX obj_x = new SubclassY();
	SubclassY obj_y = new SubclassY();
	public void submethod() {
		obj_y.supermethod();
		int i = 1;
		i = obj_y.supervar;
		System.out.println("sub " + i);
	}
}
