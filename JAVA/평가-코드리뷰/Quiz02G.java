/*
 * [code review]
 * - 문제에서 랜덤값을 저장하는 변수명은 random으로 선언하기로 했다.
 * - userValue는 무한루프 밖에서는 값을 입력받지 않아도 된다.
 * - count++와 정수를 입력받는 코드는 조건문 밖으로 빼서 한 번씩만 적을 수 있다.
 *   count값을 1로 초기화하셨기 때문에 count++는 break;문이 있는 조건문 뒤에 위치한다.
 *   만일 count값을 0으로 초기화 하면 break;문이 있는 조건문 앞쪽(반복문 맨앞)에 위치
 */

import java.util.Scanner;

public class Quiz02G {

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		
		int random = (int)(Math.random() * 10) + 1;
		int userValue = 0;
		int count = 1;
		
		while(true) {
			
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();
			
			if(userValue == random)
				break;
			else if(userValue > random) 
				System.out.println("컴퓨터의 숫자가 더 작습니다.");
			else 
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			
			count++;
		}
		
		System.out.println(count + "번만에 정답입니다.");
		
		input.close();
	}

}
