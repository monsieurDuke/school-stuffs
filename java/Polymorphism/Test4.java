public class Test4 {
	public static void tugasKerja(Pegawai peg) {peg.work();}
	public static void kendaraanKurir(Pegawai peg) {
		Kurir kur = (Kurir) peg;
		System.out.println("kendaraan : " + kur.getKendaraan());
	}
	public static void tampilTunjangan(Pegawai peg) {
		Manajer man = (Manajer) peg;
		System.out.println("tunjangan : " + man.getTunjangan());
		System.out.println("tot gaji  : " + (man.getTunjangan() + man.getGaji()));
	}
	public static void main(String[] args) {
		Pegawai peg1 = new Kurir("Irsyad",450000,"Motor (Yamaha Supra)");
		System.out.println("nama depn : " + peg1.getNama());
		System.out.println("gaji awal : " + peg1.getGaji());
		kendaraanKurir(peg1);
		tugasKerja(peg1);

		System.out.println();

		Pegawai peg2 = new Manajer("Muhammad",2000000,750000);
		System.out.println("nama depn : " + peg2.getNama());
		System.out.println("gaji awal : " + peg2.getGaji());
		tampilTunjangan(peg2);
		tugasKerja(peg2);
	}
}
