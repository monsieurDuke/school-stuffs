package kendaraan;
public class Taksi extends Mobil {
	//
	protected int tarif_awal;
	protected int tarif_km;
	//
	public void setTarifAwal(int tarif_awal) {this.tarif_awal = tarif_awal;}
	public void setTarifKM(int tarif_km) {this.tarif_km = tarif_km;}
	public int getTarifAwal() {return this.tarif_awal;}
	public int getTarifKM() {return this.tarif_km;}
}
