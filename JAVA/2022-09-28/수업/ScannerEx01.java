// Scanner class를 사용하기 위해 경로에서 읽어 온다.
import java.util.Scanner;

public class ScannerEx01 {

	public static void main(String[] args) {
		
		// [사용자로 부터 정수 입력 받기]
		
		// 1. 객체 생성하기
		// 값을 입력받기 위해 Scanner라는 객체를 생성한다.
		// input은 scanner 객체의 주소를 나타내는 변수
		Scanner input = new Scanner(System.in);
		

		// 2. 정수 입력 받기
		// .을 입력하면 사용가능한 메서드들이 나타난다.
		// [형태 1] - 정수 1개를 따로 따로 받기
//		System.out.print("정수 1개를 입력하세요 : ");
//		int num1 = input.nextInt();
//		System.out.println("입력 값 : " + num1);
//
//		System.out.print("정수 1개를 입력하세요 : ");
//		int num2 = input.nextInt();
//		System.out.println("입력 값 : " + num2);

		// [형태 2] - 정수 2개를 한번에 받기
		System.out.print("정수 2개를 입력하세요 : ");
		int num1 = input.nextInt();
		int num2 = input.nextInt();
		System.out.println("입력 값 : " + num1 + ", " + num2);
		
		input.close();
	}

}
