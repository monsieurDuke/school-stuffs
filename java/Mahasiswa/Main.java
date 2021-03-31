/*
--------
Mahasiswa
--------
- nim : int
- nama : String
--------
+ Mahasiswa()
+ Mahasiswa(nama : String)
+ Mahasiswa(nim : init, nama : String)
+ getNim() : int 	| + setNim(nim : int)
+ getNama() : int 	| + setNama(nama : String)
--------
*/

public class Main {
	public static void main(String[] args) {
		Mahasiswa obj = new Mahasiswa();
		System.out.println("NAMA : "+obj.getNama()+"\nNIM  : "+obj.getNim()+"\n---");
		obj.setNama("Irsyad"); obj.setNim(1807422020);
		System.out.println("NAMA : "+obj.getNama()+"\nNIM  : "+obj.getNim()+"\n---");
		obj = new Mahasiswa("Jonathan");
		System.out.println("NAMA : "+obj.getNama()+"\nNIM  : "+obj.getNim()+"\n---");
		obj = new Mahasiswa(1807422121,"Ransoom");		
		System.out.println("NAMA : "+obj.getNama()+"\nNIM  : "+obj.getNim()+"\n---");		
	}
}
