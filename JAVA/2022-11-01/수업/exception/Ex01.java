/*
 * [예외의 종류]
 * compile : 컴파일할 때 발생 -> syntax error
 * runtime : 실행할 때 발생
 * 
 * [예외 처리1]
 * - try~catch~finally : try 구문 -> 해당 구문에서 직접 처리
 * - catch의 클래스 명은 발생 가능한 예외의 타입을 사용한다.
 * try {
 * 		예외가 발생할 수 있는 코드
 * } catch(클래스명 참조변수) {
 * 		예외가 발생했을 때, 처리할 코드
 * } catch(클래스명 참조변수) {
 * 		예외가 발생했을 때, 처리할 코드
 * } finally {
 * 		예외 발생 여부와 상관 없이, 마지막에 실행되는 코드
 * }
 */
package exception;

import java.util.Scanner;

public class Ex01 {

	public static void inputData() {
		System.out.println("inputData 메서드 시작!");
		Scanner input = new Scanner(System.in);	
		
		System.out.print("정수 2개 입력 : ");
		int num1 = input.nextInt();
		int num2 = input.nextInt();
		
		// num2가 0일 때 예외 발생 : ArithmeticException
//		int result1 = num1 / num2;
//		int result2 = num1 % num2;
//		System.out.println("몫 >> " + result1);
//		System.out.println("나머지 >> " + result2);
		
		try {
			// 예외가 발생할 수 있는 코드
			int result1 = num1 / num2;
			int result2 = num1 % num2;
			System.out.println("몫 >> " + result1);
			System.out.println("나머지 >> " + result2);
		} catch(ArithmeticException e) {
			// 예외가 발생했을 때, 실행할 코드
			System.out.println("분모가 0이므로 계산 불가능");
			System.out.println("e >> " + e);
		} catch(Exception e) {
			// Exception은 모든 예외의 부모이므로, 모든 예외를 처리함
			System.out.println("예외 발생");
		} finally {
			// 예외 발생 여부와 상관없이, 마지막에 실행되는 코드
			System.out.println("try~catch 구문의 마지막에 실행되는 코드");
		}
		
		
		input.close();
		System.out.println("inputData 메서드 종료!");
	}
	
	public static void main(String[] args) {
		System.out.println("=====메인 메서드 시작!=====");
		inputData();
		System.out.println("=====메인 메서드 종료!=====");
	}

}
