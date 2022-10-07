import java.util.Scanner;

/*
 * [문제]
 * 사용자로 부터 하나의 숫자를 입력 받아, 덧셈식을 출력하시오.
 * 즉, 10을 입력하면 덧셈 결과로 10이 나오는 모든식을 출력
 * 
 * [출력 형태]
 * 정수하나 입력 : 10
 * 1+9=10
 * 2+8=10
 * 3+7=10
 * 4+6=10
 * 5+5=10
 * 6+4=10
 * 7+3=10
 * 8+2=10
 * 9+1=10
 */

public class P1 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		System.out.print("정수하나 입력 : ");
		int number = input.nextInt();
		
		for(int i=1; i<number; i++) {
			System.out.println(i + " + " + (number-i) + " = " + number);
		}
		
		input.close();
	}

}
