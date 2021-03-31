import java.util.Scanner;

public class lat_118 {

	static class Balance {
		void Calc(double balance) {
			double rate = 0.2;
			double temp_balance;
			for (int i = 0; i <= 4; i++) {
				if (i > 0 ) {
					temp_balance = balance * rate;
					balance += temp_balance;
				}
				System.out.println(i+" "+balance);
			}
		}
	}

	public static void  main(String[] args) {
		Balance obj = new Balance();
		Scanner read = new Scanner(System.in);
		System.out.print("Balance: "); double get_balance = read.nextDouble();	
		obj.Calc(get_balance);
	}
}