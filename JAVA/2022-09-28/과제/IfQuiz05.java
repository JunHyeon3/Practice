import java.util.Scanner;

public class IfQuiz05 {

	public static void main(String[] args) {

		// [학점을 출력하는 코드를 작성하시오.]
		// 90~93 : A-, 94~96 : A0, 97~100 : A+ 
		// 80~83 : B-, 84~86 : B0, 87~89 : B+ 
		// 70~73 : C-, 74~76 : C0, 77~79 : C+ 
		// 나머지 : F 
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("점수를 입력하세요 >> ");
		int score = input.nextInt();
		input.close();
		
		char grade = ' ';
		char grade_plus = ' ';
		
		if (score >= 90) {
			grade = 'A';
		} else if (score >= 80) {
			grade = 'B';
		} else if (score >= 70) {
			grade = 'C';
		} else {
			grade = 'F';
		}
		
		if (score == 100 || score%10 >= 7) {
			grade_plus = '+';
		} else if (score%10 >= 4) {
			grade_plus = '0';
		} else {
			grade_plus = '-';
		}
		
		if (score >= 70) {
			System.out.println("당신의 학점은 " + grade + grade_plus + "입니다.");
		}
		else {
			System.out.println("당신의 학점은 " + grade + "입니다.");
		}
	}

}
