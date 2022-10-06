import java.util.Scanner;

/*
 * [문제]
 * 컴퓨터가 생성한 1~10 사이의 랜덤값을 맞추시오. 
 * 마지막에는 사용자가 랜덤값을 몇 번 만에 맞췄는지(횟수) 출력하시오.
 */

public class Quiz02 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		int random = (int)(Math.random() * 10) + 1;		
		int userValue = 0, count = 0;
		
		System.out.println("*** 숫자를 맞추어 보세요(1~10) ***");
		
		while(true) {
			System.out.print("숫자 입력 : ");
			userValue = input.nextInt();
			
			count++;
			
			if (userValue == random)
				break;
			
			if (userValue > random)
				System.out.println("컴퓨터의 숫자가 더 작습니다.");
			else 
				System.out.println("컴퓨터의 숫자가 더 큽니다.");
		}
		
		System.out.printf("%d번 만에 정답입니다.", count);
		
		input.close();
		
	}

}
