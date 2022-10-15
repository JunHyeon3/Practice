/*
 * [code review]
 * - 문제에서 랜덤값을 저장하는 변수는 random으로 선언하라고 했다.
 * - 마지막 else if의 조건 userValue == randomValue은 
 *   위의 두 조건을 만족하지 못하는 나머지 경우 이므로 else로 적어도 된다.
 */

import java.util.Scanner;

public class Quiz02dd {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		int random = (int) (Math.random() * 10) + 1;
		int userValue = 0;
		int count = 0;
		
		System.out.println("*** 숫자를 맞추어 보세요(1~10) ***\n");
		
		while(true) {
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();
			
			count++;
			
			if(userValue > random)
				System.out.println("컴퓨터의 숫자가 더 작습니다");
			else if(userValue < random)
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			else {
				System.out.println(count + "번만에 정답입니다.");
				break;
			}
		}
		
		input.close();
	}

}
