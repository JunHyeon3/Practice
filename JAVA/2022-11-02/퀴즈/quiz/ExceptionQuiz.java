/*
 * [문제]
 * 예외 클래스 정의
 * - class명 	 : NameLengthException
 * - 생성자		 : 객체 생성시 매개변수로 받은 값을 멤버 변수(변수명 : wrongName)에 저장
 * - 변수명		 : wrongName
 * - 멤버 메서드 : wrongShowName(), 호출되면 멤버 변수에 저장된 이름 출력
 * 
 * main() method
 * - 사용자로 부터 입름 입력 받기 (2글자 이상)
 * - 이름의 길이를 확인하여 길이가 2보다 작으면 예외가 발생, 잘못 입력된 이름 출력
 * - 이름을 2글자 이상 입력할 때까지 계속 입력 받기
 * 
 * [출력]
 * 이름 입력 : 홍
 * 잘못된 이름 : 홍
 * 이름 입력 : 길
 * 잘못된 이름 : 길
 * 이름 입력 : 홍길
 * 입력받은 이름 : 홍길
 */
package quiz;

import java.util.Scanner;

class NameLengthException extends Exception {
	private String wrongName;
	
	public NameLengthException(String wrongName) {
		this.wrongName = wrongName;
	}
	
	public void wrongShowName() {
		System.out.println("잘못된 이름 : " + this.wrongName);
	}
}

public class ExceptionQuiz {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		String name = "";
		
		while(true) {
			System.out.print("이름 입력 : ");
			name = input.nextLine();
			
			if(name.length() > 1) {
				System.out.println("입력받은 이름 : " + name);
				break;
			}
			else {
				try {
					throw new NameLengthException(name);
				} catch (NameLengthException e) {
					e.wrongShowName();
				} 
			}
		}
		
		input.close();
	}

}
