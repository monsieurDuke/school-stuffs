package kendaraan;
public class Mobil {
	// Class Variable
	private String vendor, color, type;
	private int horsepwr, seat;
	// Constructor
	public Mobil(String vendor, String color, String type, int horsepwr, int seat) {
		this.vendor = vendor;		this.color = color;		this.type = type;
		this.horsepwr = horsepwr;	this.seat = seat;
	}
	// Setter Getter
	public void setVendor(String vendor) {this.vendor = vendor;}		public String getVendor() {return this.vendor;}
	public void setColor(String color) {this.color = color;}			public String getColor() {return this.color;}
	public void setType(String type) {this.type = type;}				public String getType() {return this.type;}
	public void setHorsePwr(int horsepwr) {this.horsepwr = horsepwr;}	public int getHorsePwr() {return this.horsepwr;}
	public void setSeat(int seat) {this.seat = seat;}					public int getSeat() {return this.seat;}
	// Function
	public void showInfo(int idx) {System.out.println("[mobil_" + idx + "] " + this.vendor + "\t" + this.color + "\t" + this.type + "\t" + this.horsepwr + " cc\t  " + this.seat + " seat");}
}
