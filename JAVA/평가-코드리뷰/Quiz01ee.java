/*
 * [code review]
 * - 변수는 선언 후 초기화 까지 해주기
 * - else continue;는 없어도 되는 코드
 */

import java.util.Scanner;

public class Quiz01ee {
	
	static int factorial(int num) {
		int mul = 1;
		
		for(int i=1; i<=num; i++)	{
			mul *= i;
		}
		
		return mul;
	}

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		while(true) {
			System.out.print("1 ~ 10 사이의 정수 입력: ");
			userValue = input.nextInt();
			
			if(userValue>=1 && userValue<=10) {
				break;
			}
		}
		
		System.out.printf("%d!: %d", userValue, factorial(userValue));
		
		input.close();
	}

}
