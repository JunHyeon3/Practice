/*
 * [code review]
 * - Scanner 사용 후 close() 해주기
 * - 랜덤 값은 반복문 밖에서 한번만 설정하기
 *   반복문 안에서 random 변수에 랜덤 값을 저장하게 되면, 반복문이 실행 될 때마다 랜덤값이 바뀐다.
 *   즉, 6보다 크다고 했는데 7을 입력했을 때 작다고 나올 수 있음
 * - random == userValue 조건은 위의 두 조건의 나머지 이므로 else로만 써도된다.  
 * - 레이블은 사용해도 상관은 없지만, 이중 반복문에서 주로 사용
 */

import java.util.Scanner;

public class Quiz02cc {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		int random = (int)(Math.random()*10)+1;
		int userValue = 0;
		int count = 0;
		
		System.out.println("*** 숫자를 맞춰 보세요(1~10) ***\n");
		
		outer :
		while(true) {
			count++;
			
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();
			
			if (random > userValue) {
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
			}
			else if (random < userValue) {
				System.out.println("컴퓨터의 숫자가 더 작습니다.");
			}
			else {
				System.out.println(count + "번만에 정답입니다.");
				break outer;
			}
		}
		
		input.close();
	}

}
