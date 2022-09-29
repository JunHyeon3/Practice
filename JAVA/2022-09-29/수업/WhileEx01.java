
public class WhileEx01 {

	public static void main(String[] args) {

		/*
		 * [반복문]
		 *
		 * 초기값 설정; // 조건식에서 사용되는 변수
		 *
		 * while (조건식) { // 조건이 true인 동안 반복 -> 조건이 false가 되는 순간 탈출
		 * 		명령어;
		 * 		증감식;
		 * }
		 */

		int num = 1;

//		System.out.println(num);
//		num++;
//		System.out.println(num);
//		num++;
//		System.out.println(num);
//		num++;

		while(num < 4) {
			System.out.println(num);
			num++;
		}

		System.out.println("반복문 실행 후 num : " + num);
		System.out.println("<< 프로그램 종료 >>");
	}
}



