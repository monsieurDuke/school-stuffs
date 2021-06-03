public class MathCuz {
	public int getExponent(double num) {
		String str =  String.valueOf(num);
	    int pointIndex = str.indexOf('.');
	    if (pointIndex == -1  || pointIndex == str.length() - 1)
	        return 0;

	    while (str.endsWith("0")) {
	        str = str.substring(0, str.length() - 1);
	    }

	    pointIndex = str.indexOf('.');
	    if (pointIndex == str.length() - 1)
	        return 0;

	    String[] splitted = str.split("\\.");
	    return -splitted[1].length();
	}
}
