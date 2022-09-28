import java.util.Scanner;

public class ScannerEx02 {

	public static void main(String[] args) {

		// [사용자로 부터 문자열 입력 받기]
		
		// 1. Scanner 객체 생성
		Scanner input = new Scanner(System.in);
		
		// 2-1. 문자열 입력 : next() 메서드 : 공백 전 까지 사용
		System.out.print("문자열 입력 : ");
		String s1 = input.next();
		System.out.println("입력된 문자열 : " + s1);
		
		// 문자열을 다시 입력 받기 위해서 메모리에 저장된 내용을 비우는 용도
		input.nextLine();
		
		// 2-2. 문자열 입력 : nextLine() 메서드 : 엔터 전까지 사용
		System.out.print("문자열 입력 : ");
		String s2 = input.nextLine();
		System.out.println("입력된 문자열 : " + s2);

		input.close();
	}

}
