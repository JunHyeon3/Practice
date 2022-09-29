
public class SwitchEx01 {

	public static void main(String[] args) {

		int n = 3;

		// 스위치 문에서 값은 항상 정수가 나와야 한다.
		switch (n) {
		// case 뒤의 값에는 변수가 올 수 없고, 상수만 올 수 있다.
		// : 은 레이블(라벨) 역할을 한다.
		case 1:
			System.out.println("JAVA");
			// break; 는 흐름을 중단하기위해 사용하며, 선택적으로 사용한다.
			break;
		case 2:
			System.out.println("HTML");
			break;
		case 3:
			System.out.println("CSS");
			break;
		default:
			System.out.println("재밌는 자바!");
		}

	}
}
/*
 * [switch 문]
 * switch(값) {
 * 		case 값1:
 * 			명령문;
 * 			명령문;
 * 			break;
 * 		case 값2:
 * 			명령문;
 * 			명령문;
 * 		default:
 * 			명령문;
 * 			명령문;
 * }
 *
 */
