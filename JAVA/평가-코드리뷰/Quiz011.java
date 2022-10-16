/*
 * [code review]
 * - Scanner 사용 후 input.close() 써주기
 * - 화이트 라인 1줄이상 사용하지 않기
 * - 들여쓰기 확인하기
 * - 변수명을 카멜 표기법이나 스네이크 표기법을 사용하여 표현하기 (uservalue x, userValue o)
 * - 정수를 입력 받는 코드를 while문 밖과 안에서 2번 쓰지 않게 하기 위해서
 *   while문 안에서 정수를 먼저 입력 받은 후 특정 조건을 만족하면 break문이 실행되도록 순서 바꾸기
 */

import java.util.Scanner;

public class Quiz011 {
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		while(true) {
			if (userValue>0 && userValue<11) {
				System.out.println(userValue+"! : "+factorial(userValue));
				break;
			}
			
			System.out.print("정수 1~10사이 입력 >>");
			userValue = input.nextInt();
		}  
		
		input.close();
	}
	
	public static int factorial(int user_value) {
		if(user_value == 1)
			return 1;
		else
			return user_value * factorial(user_value -1);
	}
	
}
