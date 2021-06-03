public class MyChild extends MyParent{
	int z;
	MyChild(int x, int y, int z) {super(x,y); this.z = z;}
	public int addMe(int x, int y, int z) {return this.x + x + this.y + y + this.z + z;}
	public int addMe(MyChild obj) {return addMe(obj.x, obj.y, obj.z);}
	public int addMe(int x, int y) {return this.x + x + this.y + y;}
}
