
public class WhileQuiz02 {

	public static void main(String[] args) {

		/*
		 * [문제]
		 * 구구단 2단을 출력하기
		 *
		 * [출력 형태]
		 * 2 * 1 = 2
		 * 2 * 2 = 4
		 * 2 * 3 = 6
		 * 2 * 4 = 8
		 * 2 * 5 = 10
		 * 2 * 6 = 12
		 * 2 * 7 = 14
		 * 2 * 8 = 16
		 * 2 * 9 = 18
		 */

		int idx = 1;

		while (idx < 10) {
			System.out.println(2 + " * " + idx + " = " + (2 * idx));
			idx++;
		}
	}

}
