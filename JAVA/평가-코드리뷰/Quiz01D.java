/*
 * [code review]
 * - 팩토리얼 문제인데 누적합..?
 * - 문제에서 주어진 변수명(userValue)으로 선언하기
 * - break문을 실행할 조건식을 1이상 10이하로 변경하기
 * - 이중 while문이 아닌 안쪽 while문을 바깥쪽으로 빼서
 *   두개의 while문으로 따로 따로 사용하기
 * - sum * userValue 값이 아닌, sum 값만 출력하면 팩토리얼 값이 나옴 
 * - Scanner 사용후 close() 해주기
 */

import java.util.Scanner;

public class Quiz01D {

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		int userValue = 1;
		int sum = 1;
		
		while (true) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt() ;
			
			if (userValue >= 1 && userValue <=10)
				break;
		}
		
		while (userValue != 0) {
			sum = sum * userValue;
			userValue--;
		}	

		System.out.println("누적합 >> " + sum);

		input.close();
	}

}
