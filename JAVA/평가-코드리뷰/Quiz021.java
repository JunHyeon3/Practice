/*
 * [code review]
 * - 무한 루프 밖에서 idx에 정수를 입력 받을 필요는 없다.
 * - random변수를 선언과 동시에 랜덤 값을 저장하기 
 * - if-else if-else 형태로 변경하기
 * - if문 안에서 반복적으로 사용되는 숫자를 입력 받는 코드를 밖으로 빼기
 * - 코드를 수정하여 count+1 값을 출력할 필요가 없어짐
 */

import java.util.Scanner;

public class Quiz021 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		System.out.println("숫자를 맞춰 보세요 1~10");
		
		int idx = 0;
		int count = 0;
		int random = (int)(Math.random()*10) + 1; 
		
		while(true) {
			count++;	
			
			System.out.print("숫자 입력 :");
			idx = input.nextInt();
			
			if (idx > random)
				System.out.println("컴퓨터의 숫자가 더 작습니다");
			else if (idx < random) 
				System.out.println("컴퓨터의 숫자가 더 큽니다");
			else 
				break;

		}				
		
		System.out.println("\n" + count +"만에 정답입니다");
		
		input.close();
		
	}

}
