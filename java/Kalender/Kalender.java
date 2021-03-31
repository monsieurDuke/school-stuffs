public class Kalender {

	private int date, month, year;
	public Kalender(int date) {this.date = date;}
	public Kalender(int month, int year) {this.month = month; this.year = year; this.date = 1;}
	public Kalender(int date, int month, int year) {this.date = date; this.month = month; this.year = year;}	

	public void setDate(int date) {this.date = date;}			public int getDate() {return this.date;}
	public void setMonth(int month) {this.month = month;} 		public int getMonth() {return this.month;}
	public void setYear(int year) {this.year = year;} 			public int getYear() {return this.year;}

	public String showKalender() {
		String date_s = "0"+this.date; date_s = date_s.substring(date_s.length()-2);
		String month_s = "0"+this.month; month_s = month_s.substring(month_s.length()-2);
		String year_s = ""+this.year; year_s = year_s.substring(year_s.length()-2);
		String result = date_s+"/"+month_s+"/"+this.year;
		return result;
	}	

}
