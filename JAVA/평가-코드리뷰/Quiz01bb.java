/*
 * [code review]
 * - 화이트라인은 한줄만 사용하기
 * - 불필요한 조건식이 사용되었고, 팩토리얼을 계산하는 코드가 반복적으로 사용된다.
 * - 수정된 코드는 userValue를 0으로 초기화하여 선언해주고, 원래 else if 에 작성되었던 명령식만 적은 것이다.
 */

import java.util.Scanner;

public class Quiz01bb {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);

		int userValue = 0;

		while (userValue < 1 || userValue > 10) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();
		}
			
		int factorial = 1;
		for (int i = 1; i <= userValue; i++) {
			factorial *= i;
		}
		
		System.out.println(userValue + "! = " + factorial);

		input.close();
	}

}
