import java.util.Scanner;

public class WhileQuiz04 {

	public static void main(String[] args) {

		/*
		 * [문제]
		 * 1~10 사이의 정수를 입력받은 후, 랜덤 값에서 사용자가 입력한 정수 찾기!
		 * 반복문 실행 횟수도 출력하기
		 *
		 * [출력 형태]
		 * 1~10 사이의 정수 1개 입력 >> 3
		 * 7 1 2 5 3
		 * 5회 실행해서 찾았다!
		 */

		System.out.print("1~10 사이의 정수 1개 입력 >> ");
		Scanner input = new Scanner(System.in);
		int userInput = input.nextInt();

		int randomValue = 0, count = 0;

		while (true) {
			count++;

			randomValue = (int)(Math.random() * 10) + 1;
			System.out.print(randomValue + " ");

			if(userInput == randomValue)
				break;
		}

		System.out.println();
		System.out.println(count + "회 실행해서 찾았다!");

		input.close();
	}

}
