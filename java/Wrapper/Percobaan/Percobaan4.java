public class Percobaan4 {
	public Percobaan4() {
		Integer i; Double d; Byte b;
		Long l = 345L;
		i = l.intValue();
		System.out.println("Nilai pada Integer = " + i);
		l = i.longValue();
		System.out.println("Nilai pada Long    = " + l);
		d = l.doubleValue();
		System.out.println("Nilai pada Double  = " + d);
		b = d.byteValue();
		System.out.println("Nilai pada Octal   = " + b);
	}
}
