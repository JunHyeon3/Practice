import java.util.Scanner;

public class IfQuiz02 {

	public static void main(String[] args) {

		// 성별 : 남 - 1 , 여 - 2
		// 입력할 때, "성별 1 또는 2를 입력하세요 >>> " 문자열이 먼저 출력
		
		// 성별을 정수 1 또는 2로 입력 받아서
		// 1이 입력되면, "남자입니다."를 출력하고
		// 2가 입력되면, "여자입니다."를 출력하시오.
		// 1, 2 이외의 정수가 입력되면 "잘못된 값을 입력하셨습니다."를 출력하시오.
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("성별 1 또는 2를 입력하세요 >>> ");
		int gender = input.nextInt();
		input.close();
		
		if (gender == 1) {
			System.out.println("남자입니다.");
		}
		else if (gender == 2) {
			System.out.println("여자입니다.");
		}
		else {
			System.out.println("잘못된 값을 입력하셨습니다.");
		}
	}

}
