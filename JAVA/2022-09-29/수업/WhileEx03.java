
public class WhileEx03 {

	public static void main(String[] args) {

		/*
		 * [무한 루프문]
		 * 반복문의 종료 조건을 당장 정하기 어려울 때 사용
		 * 반드시, 반복문 안에 break를 명시해야 한다.
		 * 문법 : while (true) { ~ }
		 *
		 * [break]
		 * 반복문 내에서 조건문과 함께 사용됨
		 * 의미 : 반복문을 탈출
		 */

		int idx = 1;

		while(true) {
			System.out.println("idx >> " + idx);

			if (idx == 3)
				break;

			idx++;
		}

		System.out.println("<< 반복문 실행 종료 >>");
	}

}


