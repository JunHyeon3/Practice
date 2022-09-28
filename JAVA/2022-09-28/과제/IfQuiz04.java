import java.util.Scanner;

public class IfQuiz04 {

	public static void main(String[] args) {

		// [점수를 입력 받은 후, 학점 출력하기] 
		// ------------------------------------
		// 점수 범위 
		// 0 ~ 100
		// 학점
		// 90 ~ 100 : A
		// 80 ~ 89 : B
		// 70 ~ 79 : C
		// 70 미만 : D
		// ------------------------------------
		
		// [출력]
		// "당신의 학점은 A입니다."
		
		Scanner input = new Scanner(System.in);
		
		int score = input.nextInt();
		input.close();
		
		char grade = ' ';
		
		if(score >= 90) {
			grade = 'A';
		} else if (score >= 80) {
			grade = 'B';
		} else if (score >= 70) {
			grade = 'C';
		} else {
			grade = 'D';
		}
		
		System.out.println("당신의 학점은 " + grade + "입니다.");
	}

}
