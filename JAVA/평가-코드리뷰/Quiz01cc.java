/*
 * [code review]
 * - factorial 메서드 내에서 필요없는 userValue변수 지우기
 * - for문의 문법을 다시 확인 해보기
 * - 변수는 선언 후 초기화 해주기
 * - userValue를 0으로 초기화 하면, while문 밖에서 정수를 입력 받는 코드는 필요 없음
 * - Scanner 사용후 close() 해주기
 */

import java.util.Scanner;

public class Quiz01cc {

	public static void factorial(int num) {
		
		int fact = 1;
		
		for(int i=num; i>0; i--) {
			fact = fact * i;
		}
		
		System.out.println(num + "! : " + fact);
	}
	
	
	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		while(userValue < 1 || userValue > 10) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();
			
			if(userValue >= 1 && userValue <= 10) {
				factorial(userValue);
			}
		}
		
		input.close();
	}

}
