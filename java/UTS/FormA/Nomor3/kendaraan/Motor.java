package kendaraan;
public class Motor {
	// Class Variable
	private String vendor, color;
	private int horsepwr, rating;
	// Constructor
	public Motor(String vendor, String color, int horsepwr, int rating) {
		this.vendor = vendor;		this.color = color;
		this.horsepwr = horsepwr;	this.rating = rating;
	}
	// Setter Getter
	public void setVendor(String vendor) {this.vendor = vendor;}		public String getVendor() {return this.vendor;}
	public void setColor(String color) {this.color = color;}			public String getColor() {return this.color;}
	public void setHorsePwr(int horsepwr) {this.horsepwr = horsepwr;}	public int getHorsePwr() {return this.horsepwr;}
	public void setRating(int rating) {this.rating = rating;}			public int getRating() {return this.rating;}
	// Function
	public void showInfo(int idx) {System.out.println("[motor_" + idx + "] " + this.vendor + "\t" + this.color + "\t" + this.horsepwr + " cc\t  " + this.rating + " stars");}
}
