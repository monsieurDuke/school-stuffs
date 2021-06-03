class Over extends Base {
	public void method(int o) { System.out.println("Over.method" + o); }
	public static void main(String[] args) {
		Over obj = new Over();
		int i = 100;
		obj.method(i);
	}
}
