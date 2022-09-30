/*
 * [문제]
 * 중첩 for문을 사용하여 다음과 같은 형태가 출력되도록 하시오
 * [출력]
 * 100
 * 010
 * 001
 */

public class NestedLoopQuiz03 {

	public static void main(String[] args) {
		
		for (int i=0; i<3; i++) {
			for (int j=0; j<3; j++) {
				if (i == j)
					System.out.print(1);
				else
					System.out.print(0);
			}
			
			System.out.println();
		}
	}

}
