public class Mobil {
	private String brand;
	private String type;
	private String color;
	private int cc;
	private int qty;

	public Mobil(String brand, String type, String color, int cc, int qty) {
		this.brand = brand;
		this.type = type;
		this.color = color;
		this.cc = cc;
		this.qty = qty; }

	public String getInfo() {
		String result = "NAME  : "+this.brand+"\nTYPE  : "+this.type+"\nCOLOR : "+this.color+"\nCC    : "+this.cc+" CC\nSTOCK : "+this.qty;
		return result; }

	public void setBrand(String brand) {this.brand = brand;}	public String getBrand() {return this.brand;}
	public void setType(String type) {this.type = type;}		public String getType() {return this.type;}			
	public void setColor(String color) {this.color = color;}	public String getColor() {return this.color;}
	public void setCC(int cc) {this.cc = cc;}					public int getCC() {return this.cc;}
	public void setQty(int qty) {this.qty = qty;} 				public int getQty() {return this.qty;}

}