/*
 * [code review]
 * - 1~10사이의 랜덤값을 저장하기 위해서는 Math.random()에 *9가 아니라 *10을 해야함
 * - random 변수를 선언과 동시에 랜덤 값을 저장하기
 * - println대신 "숫자를 맞추어보세요(1~10)" 뒤에 \n을 넣기
 * - count++를 반복하여 쓰지 말고 무한 루프에서 한번만 쓰기
 *   count를 1로 초기화 했기 때문에 break문 뒤쪽에서 count++
 *   count를 0으로 초기화 할거면 break문 앞쪽에서 count++;
 */

import java.util.Scanner;

public class Quiz02C {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		int random = (int)(Math.random()*9)+1;
		int userValue=0, count=1;
		
		System.out.println("숫자를 맞추어보세요(1~10)\n");
		
		while(true) {
		
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();

			if(userValue>random) {
				System.out.println("컴퓨터의 숫자가 더 작습니다.");
			}
			else if(userValue<random) {
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			}
			else {
				break;	
			}

			count++;
			
		}
		
		System.out.println(count+"번 만에 정답입니다.");
		input.close();
	}

}
