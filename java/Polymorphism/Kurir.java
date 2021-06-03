public class Kurir extends Pegawai {
	private String kendaraan;
	//
	public Kurir(String nama, double gaji, String kendaraan) {super(nama,gaji); this.kendaraan = kendaraan;}
	public String getKendaraan() {return this.kendaraan;}
	public void work() {System.out.println("Aku mengirimkan supply kepada client");}
}
