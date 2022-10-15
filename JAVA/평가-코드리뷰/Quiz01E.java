/*
 * [code review]
 * - while문 밖에서 정수를 입력받는 코드는 없어도 됨
 * - if-else문 대신 break가 포함된 명령식에만 if문을 사용해도 됨
 */

import java.util.Scanner;

public class Quiz01E {

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);

		int userValue = 0;
		int result = 1;
		
		while(true) {
			System.out.print("1~10 사이의 정수 입력 : ");
			userValue = input.nextInt();
			
			if (userValue >= 1 && userValue <= 10)  {
				for(int i=userValue; i>0; i--) {
					result *= i;
				}
				break;
			}
		}
				
		System.out.println(userValue + "! : " + result);
		
		input.close();
	}

}
