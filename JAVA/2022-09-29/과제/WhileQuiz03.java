
public class WhileQuiz03 {

	public static void main(String[] args) {

		/*
		 * [문제]
		 * 1부터 10까지의 합
		 *
		 * [출력 형태]
		 * 1~10 누적합 : 55
		 */

		int idx = 1, sum = 0;

		while (idx < 11) {
			sum += idx;

			idx++;
		}

		System.out.println("1~10 누적 합 : " + sum);
	}

}
