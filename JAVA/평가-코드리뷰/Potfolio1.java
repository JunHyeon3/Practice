/*
 * [code review]
 * - 들여쓰기가 제대로 되었는지 확인하기
 * - 사용자가 입력하는 값의 변수를 userValue로 하라는 문제를 확인하기
 * - 화이트라인은 1줄이상 사용하지 않기
 * - 1~10이외의 정수가 입력되었을 때 다시 정수 입력받는 코드 작성하기
 * - Scanner를 사용하고 close() 해주기
 */

import java.util.Scanner;
public class PotfolioF {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int userValue = 0;
		int result = 1;
		
		while(true) {
			System.out.print("입력 : ");
			userValue = sc.nextInt();
			
			if (userValue > 0 && userValue <11)
				break;
		}
		
		for(int i = 1; i <= userValue; i++) {
			result *= i;
		}
		
		System.out.println("출력 : " + result);
		
		sc.close();
	}

}
