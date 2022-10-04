/*
 * [문제]
 * 정수 1개를 입력받아서 팩토리얼을 출력하는 메서드 정의
 * 메서드명 : factorial, 매개변수 : 1개, 리턴값 : 있음
 * [출력 형태]
 * 5! = 120
 */

public class MethodQuiz04 {
	
	public static int factorial(int num) {
		if (num == 1)
			return 1;
		else 
			return num * factorial(num - 1);
	}
	
	public static void main(String[] args) {
		System.out.println("5! = " + factorial(5));
	}

}
