public class TestKatak {
	public static void main(String[] args) {
		Katak katak = new Katak(5,"Froggy");
		Kecebong kecebong = new Kecebong(2,"Junior Froggy",10);
		System.out.println("OBJ1\t" + katak.getUmur() + " tahun\t\t" + katak.getNama() + "\t\t\t" + katak.caraBergerak());
		System.out.println("OBJ2\t" + kecebong.getUmur() + " tahun\t\t" + kecebong.getNama() + "\t" + kecebong.getEkor() + "\t" +kecebong.caraBergerak());
	}
}
