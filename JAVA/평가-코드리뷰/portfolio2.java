/*
 * [code review]
 * - 사용하지 않는 import는 제거하기
 * - 랜덤값은 random으로 변수를 선언하라는 문제를 확인하기
 * - Scanner를 가장 위에 선언하기
 * - count를 0으로 초기화하여, count++를 2번적지 않고 1번만 적을 수 있다. 
 * - 마지막 중괄호 2개 들여쓰기 되었음
 */

import java.util.Scanner;

public class portfolioF {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("컴퓨터가 1~100 중 랜덤 숫자 하나를 정합니다. \n이 숫자를 맞춰주세요.");

        int count = 0;
        int random = (int) (Math.random() * 10) + 1;
        int num_enter = 0;

        while (random != num_enter) {
            System.out.print("1~10 숫자 입력:");
            num_enter = sc.nextInt();
            
            count++;

            if (random > num_enter) {
                System.out.println("컴퓨터의 숫자가 더 큽니다");
            } else if (random < num_enter) {
                System.out.println("컴퓨터의 숫자가 더 작습니다");
            }
        }
        
        System.out.println("정답입니다! " + count + "회 만에 맞췄어요.");
        
        sc.close();
	}
}
