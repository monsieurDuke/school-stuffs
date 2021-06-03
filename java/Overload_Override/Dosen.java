public class Dosen extends Orang {
	private int nip;
	public Dosen(String nama) {super(nama);}
	public Dosen(String nama, int nip) {super(nama); this.nip = nip;}
	public Dosen(String nama, int nip, int umur) {super(nama,umur); this.nip = nip;}
	public void info() {
		if (this.nama.equals("")) {System.out.println("NAMA : -");}
		else {System.out.println("NAMA : " + this.nama);}
		if (this.umur == 0) {System.out.println("UMUR : -");}
		else {System.out.println("UMUR : " + this.umur);}
		if (this.nip == 0) {System.out.println("NIP  : -");}
		else {System.out.println("NIP  : " + this.nip);}
		System.out.println();
	}
}
