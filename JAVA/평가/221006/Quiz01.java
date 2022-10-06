import java.util.Scanner;

/* 
 * [문제]
 * 사용자에게 정수 하나를 입력 받아, 팩토리얼 값을 구하려고 한다.
 * 단, 입력 값은 1에서 부터 10까지의 정수만 입력되도록 한다.
 * 만약, 1~10이외의 값을 입력하면, 다시 입력 받도록 한다.
 */

public class Quiz01 {

	public static int factorial(int num) {
		if (num == 1)
			return 1;
		else 
			return num * factorial(num - 1);
	}
	
	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		int userValue = 0; 
		
		while(true) {
			System.out.print("1~10 사이의 정수 입력 : ");
			
			userValue = input.nextInt();
			
			if (userValue > 0 && userValue < 11)
				break;
		}
		
		System.out.printf("%d! : %d", userValue, factorial(userValue));
		
		input.close();
		
	}

}