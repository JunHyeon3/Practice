/*
 * [문제]
 * 정수 1개를 받아서 제곱 값을 출력하는 메서드 정의
 * 메서드명 : square, 매개변수 : 1개, 리턴 값 : 없음
 * [출력 형태]
 * 2의 제곱은 4입니다.
 */

public class MethodQuiz02 {

	public static void square(int num) {
		System.out.println(num + "의 제곱은 " + (num * num) + "입니다.");
	}
	
	public static void main(String[] args) {
		square(2);
		square(3);
		square(9);
	}

}
