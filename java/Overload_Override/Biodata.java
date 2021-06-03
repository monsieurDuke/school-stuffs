public class Biodata {
	public static void main(String[] args) {
		Dosen[] dosen_arr = new Dosen[3];
		dosen_arr[0] = new Dosen("Agus");
		dosen_arr[1] = new Dosen("Budi",1807422020);
		dosen_arr[2] = new Dosen("Iwan",1807422020,21);
		for(int i = 0; i < dosen_arr.length; i++) {
			dosen_arr[i].info();
		}
	}
}
