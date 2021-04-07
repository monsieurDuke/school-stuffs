public class Lat1 {
	private String nama = "irsyad2020!@#!#!{}ashiaaappnj2021";
	private char[] arr  = nama.toCharArray();
	public void tochar() {
	 	for(int i=0; i < arr.length; i++){
			if (Character.isLetter(arr[i])) {
				System.out.print(arr[i]+" :alfabet\t");
			} else if (Character.isDigit(arr[i])) {
				System.out.print(arr[i]+" :numeric\t");
			} else {
				System.out.print(arr[i]+" :simbol\t");
			}
			if (((i + 1)%5) == 0) {
				System.out.println("");
			}
		}
		System.out.println("");
	}
}
