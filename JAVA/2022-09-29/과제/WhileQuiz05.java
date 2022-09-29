import java.util.Scanner;

public class WhileQuiz05 {

	public static void main(String[] args) {

		/*
		 * [문제]
		 * 사용자에게 정수 1개를 입력받아 누적 합을 구하시오.
		 * 실행하면, "정수를 입력하시오(종료 -1) >> " 문자열 출력
		 * 사용자가 -1을 입력하면, 정수 입력을 끝내고,
		 * 입력된 정수의 총합을 출력하시오.
		 *
		 * [출력 형태]
		 * 정수를 입력하시오 >> 2
		 * 정수를 입력하시오 >> 3
		 * 정수를 입력하시오 >> -2
		 * 정수를 입력하시오 >> 7
		 * 정수를 입력하시오 >> -1
		 * 총합 >> 10
		 */

		Scanner input = new Scanner(System.in);
		int sum = 0;

		while(true) {
			System.out.print("정수를 입력하시오(종료 -1) >> ");
			int userInput = input.nextInt();

			if(userInput == -1)
				break;

			sum += userInput;
		}

		System.out.println("총합 >> " + sum);

		input.close();
	}

}
