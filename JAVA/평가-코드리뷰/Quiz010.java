/*
 * [code review]
 * - 패키지 지우기
 * - 들여쓰기 확인하기
 * - while문 안의 else { factorial(userValue); }는 필요 없는 코드
 *   입력된 정수가 1~10 사이가 아닐 때, 그 값에 대한 필요 없는 factorial 계산을 하게됨
 */

import java.util.Scanner;

public class Quiz010 {

	public static int factorial(int num) {	
		int result = 1;	
		
		for (int i=1; i<=num; i++) {
			result *= i;
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int userValue=0;

		while(true) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();
		
			if(userValue>=0 && userValue<=10) {
				break;
			} 
		}
		
		System.out.println(userValue + "! : " + factorial(userValue));
		
		input.close();
	}
}
		

