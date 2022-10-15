/*
 * [code review]
 * - userValue값이 10보다 작으면 break문이 실행된다.
 *   10일 때 factorial 계산이 안됨
 *   음수와 0이 입력 될 때 에러 발생 
 * - userValue가 1이상 10이하일 때 break문이 실행되도록 조건식을 변경하기 
 */

import java.util.Scanner;

public class Quiz01I {
	
	public static int factorial(int userValue) {
		if (userValue == 1)
			return 1;
		else
			return userValue * factorial(userValue - 1);
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int userValue = 0;
		
		while(true) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();
			
			if (userValue >= 1 && userValue <= 10)
				break;
		}
		
		System.out.println(userValue + "! : " + factorial(userValue));
		
		input.close();
	}
}
