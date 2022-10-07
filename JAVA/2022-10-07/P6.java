import java.util.Scanner;

/*
 * [문제]
 * 입력된 문자열에서 특정 문자의 개수 출력
 * 
 * [출력 형태]
 * 문자열 입력 : abcccca
 * 찾고자 하는 문자는? c
 * 문자 c의 개수 : 4
 */

public class P6 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		System.out.print("문자열 입력 : ");
		String inputString = input.nextLine();
		
		System.out.print("찾고자 하는 문자는? ");
		char findChar = input.next().charAt(0);
		
		int count = 0;
		
		for(int i=0; i<inputString.length(); i++) {
			if (inputString.charAt(i) == findChar)
				count++;
		}
		
		System.out.printf("문자 %s의 개수 : %d", findChar, count);
		
		input.close();
	}

}
