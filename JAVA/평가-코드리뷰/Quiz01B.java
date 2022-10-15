/*
 * [code review]
 * - 변수를 선언하고 초기화 해주기
 * - break문의 조건식에서 userValue != 0은 음수를 입력할 때 에러 발생
 *   userValue >= 1로 하여 1~10사이의 정수를 입력 받기
 */

import java.util.Scanner;

public class Quiz01B {

	public static int factorial(int num) {
		if (num == 1)
			return 1;
		else
			return num * factorial(num - 1);
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		while (true) {
			System.out.print("1 ~ 10 사이의 정수 입력 : ");
			userValue = input.nextInt();
			
			if (userValue >= 1 && userValue <= 10)
				break;
		}
		
		System.out.printf("%d! : %d", userValue, factorial(userValue));
		
		input.close();
	}

}
