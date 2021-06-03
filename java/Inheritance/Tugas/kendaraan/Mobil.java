package kendaraan;
public class Mobil extends Kendaraan {
	//
	protected String bahan_bakar;
	protected int kapasitas_mesin;
	//
	public void setBahanBakar(String bahan_bakar) {this.bahan_bakar = bahan_bakar;}
	public void setKapasitasMesin(int kapasitas_mesin) {this.kapasitas_mesin = kapasitas_mesin;}
	public String getBahanBakar() {return this.bahan_bakar;}
	public int getKapasitasMesin() {return this.kapasitas_mesin;}
}
