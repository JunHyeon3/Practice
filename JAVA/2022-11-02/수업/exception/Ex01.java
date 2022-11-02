package exception;

import java.util.Scanner;

// [직접 예외를 생성하는 방법]
// Exception 클래스를 상속 받으면 Check는 예외 클래스가 된다.
class Check extends Exception {
	int num;
	
	public Check(int num) {
		super("Error! 음수가 입력됨!!");
		this.num = num;
	}
}

public class Ex01 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
	
		System.out.print("정수를 입력하세요 : ");
		int userValue = input.nextInt();
		
		// 예외가 발생하기 전에 close()해주는 것이 좋음
		input.close();
		
		if(userValue < 0) {
			// throws : 예외를 전가함, throw : 예외를 발생시킴
			try {
				throw new Check(userValue);
			} catch (Check e) {
//				System.out.println(e);
				System.out.println(e.getMessage());
//				e.printStackTrace();
			}
		}
		else {
			System.out.println("입력된 값 : " + userValue);
		}
		
	}
}

