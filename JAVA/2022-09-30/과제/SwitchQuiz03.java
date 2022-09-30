/*
 * [문제]
 * 컴퓨터와 가위,바위, 보를 하자
 * 사용자에게 가위, 바위, 보에 해당하는 정수를 입력받고, 컴퓨터는 랜덤 값으로 설정
 * [출력]
 * 가위(1), 바위(2), 보(3) 중 하나를 입력 >>> 3
 * 당신은 3입니다.
 * 컴은 1입니다.
 * 당신이 졌습니다.
 */

import java.util.Scanner;

public class SwitchQuiz03 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		System.out.print("가위(1), 바위(2), 보(3) 중 하나를 입력 >>> ");
		int userChoice = input.nextInt();
		int comChoice = (int)(Math.random()*3) + 1; 
		int loseDrawWin = 0;

		System.out.println("당신은 " + userChoice + "입니다.");
		System.out.println("컴은 " + comChoice + "입니다.");
		
//------방법 1------//
//		switch (userChoice) {
//		case 1:
//			if (comChoice == 2) 
//				loseDrawWin = -1;
//			else if (comChoice == 3) 
//				loseDrawWin = 1;
//			break;
//		case 2:
//			if (comChoice == 3) 
//				loseDrawWin = -1;
//			else if (comChoice == 1) 
//				loseDrawWin = 1;
//			break;
//		case 3:
//			if (comChoice == 1) 
//				loseDrawWin = -1;
//			else if (comChoice == 2) 
//				loseDrawWin = 1;				
//			break;
//		}
//
//		if(loseDrawWin == -1) 
//			System.out.println("당신이 졌습니다.");
//		else if(loseDrawWin == 1) 
//			System.out.println("당신이 이겼습니다.");
//		else 
//			System.out.println("비겼습니다.");
//------------------//														
		
//------방법 2------//
		if (userChoice - comChoice == -1 || userChoice  - comChoice == 2)
			loseDrawWin = -1;
		else if (userChoice - comChoice == 1 || userChoice  - comChoice == -2)
			loseDrawWin = 1;
		
		switch (loseDrawWin) {
		case -1:
			System.out.println("당신이 졌습니다.");
			break;
		case 0:
			System.out.println("비겼습니다.");
			break;
		case 1:
			System.out.println("당신이 이겼습니다.");
			break;
		}
//------------------//														

		input.close();
	}

}
