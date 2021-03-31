public class Truk {

	private double muatan, max_muatan;
	public Truk(double max_berat) {this.max_muatan = kilo2new(max_berat);}
	public double new2kilo(double newton) {return (newton / 9.8);}
	public double kilo2new(double kilo) {return (kilo * 9.8);}

	public double getMaxMuatan() {return (Math.floor(this.max_muatan*100)/100);} 	public void setMaxMuatan(double berat) {this.max_muatan = kilo2new(berat);}
	public double getMuatan() {return (Math.floor(this.muatan*100)/100);}			public void setMuatan(double berat) {this.muatan = kilo2new(berat);}

	public boolean addMuatan(double berat) {
		if ((kilo2new(berat) + this.muatan) <= this.max_muatan) {
			this.muatan += kilo2new(berat);
			return true;
		} else {return false;}
	}

	public boolean removeMuatan(double berat) {
		if (this.muatan - (kilo2new(berat)) > 0) {
			this.muatan -= kilo2new(berat);
			return true;
		} else {return false;}
	}

}