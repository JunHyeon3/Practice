/*
 * [code review]
 * - println() 대신 위의 문자열에 \n을 붙이기
 * - 랜덤 값은 반복문 밖에서 한번만 설정하기
 *   반복문 안에서 random 변수에 랜덤 값을 저장하게 되면, 반복문이 실행 될 때마다 랜덤값이 바뀐다.
 *   즉, 6보다 크다고 했는데 7을 입력했을 때 작다고 나올 수 있음
 */

import java.util.Scanner;

public class Quiz02I {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.println("*** 숫자를 맞춰보세요(1~10)\n");
		
		int random = (int)(Math.random() * 10) + 1;
		int userValue = 0;
		int count = 0;
		
		while (true) {
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();

			count++;
			
			if(userValue > random)
				System.out.println("컴퓨터가 더 작습니다.");
			else if(userValue < random)
				System.out.println("컴퓨터가 더 큽니다.");
			else
				break;
		}
		
		System.out.println(count + "번 만에 정답입니다.");
		
		input.close();
	}
}
