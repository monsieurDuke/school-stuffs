public class MyParent {
	int x, y;
	MyParent(int x, int y) {this.x = x; this.y = y;}
	public int addMe(int x, int y) {return this.x + x + this.y + y;}
	public int addMe(MyParent obj) {return addMe(obj.x, obj.y);}
}
