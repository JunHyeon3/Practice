import java.util.Scanner;

public class SwitchQuiz02 {

	public static void main(String[] args) {

		/*
		 * [문제]
		 * 정수 2개와 사칙연산의 기호를 입력 받아서, 식을 출력하시오
		 * 단 정수를 먼저 입력 받으시오
		 *
		 * [입력 형태]
		 * 정수 2개를 입력하시오 :
		 * 사칙연산(+, -, *, /)중 하나를 입력하시오 :
		 *
		 * [출력 형태]
		 * 2 + 3 = 5
		 *  (정해진 연산이 아닌 것이 입력되었을 때)
		 *  잘못된 사칙연산 기호를 입력하셨군요!
		 */

		Scanner input = new Scanner(System.in);

		System.out.print("정수 2개를 입력하시오 : ");
		int inputNumOne = input.nextInt();
		int inputNumTwo = input.nextInt();

		System.out.print("사칙연산(+, -, *, /)중 하나를 입력하시오 : ");
		String inputOperation = input.next();

		int result = 0;
		boolean correct= true;

		switch (inputOperation) {
		case "+":
			result = inputNumOne + inputNumTwo;
			break;
		case "-":
			result = inputNumOne - inputNumTwo;
			break;
		case "*":
			result = inputNumOne * inputNumTwo;
			break;
		case "/":
			result = inputNumOne / inputNumTwo;
			break;
		default:
			correct = false;
			System.out.println("잘못된 사칙연산 기호를 입력하셨군요!");
		}

		if (correct)
			System.out.println(inputNumOne + " " + inputOperation + " " + inputNumTwo + " = " + result);

//		switch (inputOperation) {
//		case "+":
//			System.out.println(inputNumOne + " " + inputOperation + " " + inputNumTwo + " = "
//								+ (inputNumOne + inputNumTwo));
//			break;
//		case "-":
//			System.out.println(inputNumOne + " " + inputOperation + " " + inputNumTwo + " = "
//					+ (inputNumOne - inputNumTwo));
//			break;
//		case "*":
//			System.out.println(inputNumOne + " " + inputOperation + " " + inputNumTwo + " = "
//					+ (inputNumOne * inputNumTwo));
//			break;
//		case "/":
//			System.out.println(inputNumOne + " " + inputOperation + " " + inputNumTwo + " = "
//					+ (inputNumOne / inputNumTwo));
//			break;
//		default:
//			System.out.println("잘못된 사칙연산 기호를 입력하셨군요!");
//		}

		input.close();
	}

}
