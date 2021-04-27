public class CariHuruf {
	private char[] list_char;
	private int count;

	public CariHuruf(String kalimat) {this.list_char = kalimat.toCharArray();}
	public int locate(char huruf) {
		for (int i = 0; i < this.list_char.length; i++) {
			if (huruf == this.list_char[i]) {this.count ++;}
		}
		return this.count;
	}
}
