import java.util.Scanner;

public class IfQuiz03 {

	public static void main(String[] args) {
		
		// 정수 2개를 입력 받아 큰 값, 작은 값을 출력하시오
		// 결과
		// 큰 값 : 5, 작은 값 : 2
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("정수 2개 입력 : ");
		int num1 = input.nextInt();
		int num2 = input.nextInt();
		input.close();
		
		int large = 0;
		int small = 0;
		
		if (num1 > num2) {
			large = num1;
			small = num2;
		}
		else {
			large = num2;
			small = num1;
		}
		
		System.out.println("큰 값 : " + large + ", " + "작은 값 : " + small);
	}

}
