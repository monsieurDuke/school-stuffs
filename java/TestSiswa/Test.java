public class Test {
	public static void main(String[] args) {
		Siswa anak = new Siswa(100);
		System.out.println("1. " + anak.nilai);
		anak.setNilai(30);
		System.out.println("2. " + anak.getNilai());		
	}
}