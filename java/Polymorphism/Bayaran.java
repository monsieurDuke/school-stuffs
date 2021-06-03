public class Bayaran {
	public double hitungBayaran(Pegawai peg) {
		double gaji = peg.getGaji();
		if(peg instanceof Manajer) {gaji += ((Manajer) peg).getTunjangan();}
		else {gaji += ((Programmer) peg).getBonus();}
		return gaji;
	}
	public static void main(String[] args) {
		Manajer mjr = new Manajer("Aguz",800,50);
		Programmer pgm = new Programmer("Buddy",600,30);
		Bayaran bayaran = new Bayaran();

		System.out.println("Bayaran Manajer    : Rp " + bayaran.hitungBayaran(mjr) + " ribu ");
		System.out.println("Bayaran Programmer : Rp " + bayaran.hitungBayaran(pgm) + " ribu ");
	}
}
