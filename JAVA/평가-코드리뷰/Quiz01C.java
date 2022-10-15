/*
 * [code review]
 * - if와 else 사이에 화이트라인 넣지 않기
 * - while문 안에서 정수를 입력 받기 때문에, 
 *   while문 밖에서 정수를 입력받는 코드는 필요가 없음
 */

import java.util.Scanner;

public class Quiz01C {
	
	public static int factorial(int userValue) {
		if(userValue==1) 
			return userValue;
		else
			return userValue * factorial(userValue - 1);
	}

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		
		int userValue = 0;
		
		while(userValue>10 || userValue<1) {
			System.out.print("1~10사이의 정수 입력 : ");
			userValue = input.nextInt();

			if(userValue<=10 && userValue>=1) 
				break;
		}
		
		System.out.println(userValue + "! : " + factorial(userValue));
		
		input.close();
	}

}
