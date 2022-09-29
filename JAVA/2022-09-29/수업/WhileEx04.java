
public class WhileEx04 {

	public static void main(String[] args) {

		/*
		 * [continue]
		 * 반복문 내에서 조건과 함께 사용
		 * 의미 : 특정 라인(continue 아래 코드)을 실행에서 제외하고 싶을때 사용한다.
		 */

		int idx = 0;

		while (idx < 10) {
			idx++;

			if(idx % 2 == 1)
				continue;

			System.out.println("idx >> " + idx);
		}

	}

}