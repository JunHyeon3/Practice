import java.util.Scanner;

public class SwitchQuiz01 {

	public static void main(String[] args) {

		// 계절을 출력하는 코딩을 작성하시오
		// 12, 1, 2는 겨울 / 3, 4, 5는 봄 / 6, 7, 8은 여름 / 9, 10, 11은 가을

		Scanner input = new Scanner(System.in);
		
		System.out.print("현재 월을 입력하세요 >>> ");
		int month = input.nextInt();
		input.close();
		
		String season = "";
		
		switch(month) {
			case 12: case 1: case 2: 
				season = "겨울";
			break;
			case 3: case 4: case 5: 
				season = "봄";
			break;
			case 6: case 7: case 8: 
				season = "여름";
			break;
			case 9: case 10: case 11 : 
				season = "가을";
			break;
		}
		
		if(season != "") {
			System.out.println("현재 계절은 " + season + "입니다.");
		}
		else {
			System.out.println("잘못된 월을 입력하셨습니다.");
		}
	}

}
