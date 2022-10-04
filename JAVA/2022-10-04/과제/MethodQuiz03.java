/*
 * [문제]
 * 정수 2개를 받아서 몫을 출력하는 메서드 정의
 * 메서드명 : divide, 매개변수 : 2개, 리턴값 : 없음
 * 
 * [출력 형태]
 * 나눗셈 결과 >> 1
 * 분모가 0으로 계산 불능
 * 나눗셈 결과 >> 2
 */
							
public class MethodQuiz03 {
	
	public static void divide(int num1, int num2) {
		// num2가 0이면 나눗셈이 불가능
		if (num2 == 0) {
			System.out.println("분모가 0으로 계산 불능");
			// return;을 사용하여 바로 메서드 종료
			return;
		}
		
		// num2가 0이 아니면 나숫셈 결과를 출력
		System.out.println("나눗셈 결과 >> " + (num1 / num2) );
	}

	public static void main(String[] args) {
		divide(5, 3);
		divide(4, 0);
		divide(6, 2);
	}

}
