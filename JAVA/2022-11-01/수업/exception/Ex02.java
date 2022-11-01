/*
 * [예외 처리2]
 * - throws : 예외 전가 -> 호출한 메서드로 전가
 * - 예외 전가에 대한 표현은 "메서드"에서 함
 * - 예외가 여러개일 경우 쉼표(,)로 연결 함
 * - 예외가 발생한 시점에 전가 받은 곳으로 넘어감.
 * - 즉, 발생 시점 아래의 코드는 실행이 안됨
 * - 예외 처리는 전가 받은 곳(호출한 곳)에서 처리함
 */
package exception;

import java.util.Scanner;

public class Ex02 {

	// 메서드 명과 중괄호 시작({) 사이에 throws 예외클래스명
	public static void inputData() throws ArithmeticException, Exception {
		System.out.println("inputData 메서드 시작!");
		Scanner input = new Scanner(System.in);	
		
		System.out.print("정수 2개 입력 : ");
		int num1 = input.nextInt();
		int num2 = input.nextInt();
		
		// num2가 0일 때 예외 발생 : ArithmeticException
		int result1 = num1 / num2;
		int result2 = num1 % num2;
		System.out.println("몫 >> " + result1);
		System.out.println("나머지 >> " + result2);
		
		input.close();
		System.out.println("inputData 메서드 종료!");
	}
	
	public static void main(String[] args) {
		System.out.println("=====메인 메서드 시작!=====");
		try {
			inputData();
		} catch (Exception e) {
			System.out.println("예외 처리 합니다!");
			System.out.println("e.getMessage() >> " + e.getMessage());
			e.printStackTrace();
		}
		
		System.out.println("=====메인 메서드 종료!=====");
	}

}
