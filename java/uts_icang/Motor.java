public class Motor extends KendaraanBermotor {
	private String jenis_oli;
	protected void berkendara(String jenis_oli){this.jenis_oli = jenis_oli;}
	public String get_oli(){return this.jenis_oli;}
}
