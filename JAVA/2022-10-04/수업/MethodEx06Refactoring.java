import java.util.Scanner;

public class MethodEx06Refactoring {

	public static void main(String[] args) {
		
		int num = 5;		
		increment(num);
				
		Scanner input = new Scanner(System.in);
		System.out.print("정수 1개 입력 >> ");
		
		int userValue = input.nextInt();		
		increment(userValue);
		
		int var = 10;		
		increment(var);
		
		input.close();
	}

	public static void increment(int num) {
		num++;
		System.out.println(num);
	}

}
