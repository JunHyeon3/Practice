/*
 * [code review]
 * - break문 다음의 userValue와 random의 크기 비교하는 조건문을 else로 묶지 않아도 된다.
 */

import java.util.Scanner;

public class Quiz02E {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		int random = (int)(Math.random()*10)+1;
		int userValue = 0, result = 1;
		
		System.out.println("*** 숫자를 맞추어 보세요(1~10) ***\n");
		
		while(true) {
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();
			
			if(userValue == random) 
				break;

			if(userValue < random)
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			else
				System.out.println("컴퓨터의 숫자가 더 작습니다.");

			result++;
		}
		
		System.out.println(result + "번만에 정답입니다.");
		
		input.close();
	}

}
