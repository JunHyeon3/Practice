import java.util.Scanner;

public class OperatorQuiz01 {

	public static void main(String[] args) {

		// 사용자에게 정수 2개를 입력 받은 후 큰 값 출력
		// 삼항 연산자를 이용
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("서로 다른 정수 2개 입력 : ");
		
		int num1 = input.nextInt();
		int num2 = input.nextInt();
		input.close();
		
		int result = (num1 > num2) ? num1 : num2;
		
		System.out.println("큰 값 : " + result);
		
	}

}
