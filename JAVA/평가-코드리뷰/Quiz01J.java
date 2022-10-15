/*
 * [code review]
 * - Scanner 사용 후 close() 해주기
 * - 잘 작성 하였습니다.
 */

import java.util.Scanner;

public class Quiz01J {

	public static int factorial(int num) {
		if (num == 1)
			return 1;
		else
			return num * factorial(num - 1);
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		do {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();	
		} while (userValue < 1 || userValue > 10);
		
		System.out.println(userValue + "! = " + factorial(userValue));
		
		input.close();
	}

}
