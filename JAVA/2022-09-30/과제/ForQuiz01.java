/*
 * [문제]
 * 2단을 for문을 사용하여 다음과 같이 출력하기
 * [출력]
 * 2 * 2 = 4
 * 2 * 4 = 8
 * 2 * 6 = 12
 * 2 * 8 = 16
 * 2 * 10 = 20
 */

public class ForQuiz01 {

	public static void main(String[] args) {

		for (int i=2; i<11; i+=2)
			System.out.println("2 * " + i + " = " + (2 * i));
	}

}
