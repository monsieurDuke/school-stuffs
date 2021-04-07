public class Tugas2 {
	private int year, temp_year, floor, ceil;
	private char chck;
	public Tugas2(int year, int floor, int ceil){this.year = year; this.floor = floor; this.ceil = ceil;}
	public boolean calc_kabisat(){
		if ((year >= floor) && (year <= ceil)) {
			if ((year % 4) == 0) {
				if ((year % 100) != 0) {chck = 'T';}
				else {
					if ((year % 400) == 0) {chck = 'T';}
					else {chck = 'F';}
				}
			}
		} else {
			System.out.println("tahun "+year+" tidak dalam range ("+floor+"-"+ceil+")");
			chck = 'E';
		}
		if (chck == 'T') {return true;}
		else {return false;}
	}
	public void check_kabisat(boolean check) {
		if (check) {System.out.println(this.year+" adalah tahun kabisat");}
		else {
			if (chck == 'F') {
				System.out.println(this.year+" bukan tahun kabisat");
			} else {System.out.println(this.year+" tidak dalam pencarian");}
		}
	}
}
