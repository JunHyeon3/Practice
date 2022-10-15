/*
 * [code review]
 * - userValue 변수를 선언 후 초기화 까지 해주기
 * - 조건문이 참이면 명령식을 실행하고, 그 아래 조건문들은 확인 하지 않기 때문에 continue는 안써도 된다.
 * - 마지막 조건 userValue == random은 어차피 위 두 조건의 나머지인 경우 이므로 else로 써도 된다.
 */

import java.util.Scanner;

public class Quiz02ee {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		int random = (int)(Math.random() * 10) + 1;
		
		System.out.println("*** 숫자를 맞추어 보세요(1~10) ***\n");
		
		int userValue = 0;
		int count = 0;
		
		while(true) {
			count++;
			
			System.out.print("숫자 입력: ");
			userValue = input.nextInt();
			
			if(userValue < random) 
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			else if(userValue > random) 
				System.out.println("컴퓨터의 숫자는 더 작습니다.");
			else {
				System.out.printf("\n%d번만에 정답입니다.", count);
				break;
			}
		}
		
		input.close();
	}

}
