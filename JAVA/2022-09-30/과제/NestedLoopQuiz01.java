/*
 * [문제]
 * 중첩 for문을 사용하여 구구단 2~9단을 출력하시오
 * [출력]
 * 2 * 1 = 2
 * 2 * 2 = 2
 *   ~~~
 * 2 * 9 = 18
 * 
 * 3 * 1 = 3
 * 3 * 2 = 6
 *   ~~~
 * 3 * 9 = 27
 * 
 *   ~~~
 */

public class NestedLoopQuiz01 {

	public static void main(String[] args) {

		for (int i=2; i<10; i++) {
			for (int j=1; j<10; j++) {
				System.out.println(i + " * " + j + " = " + (i * j));
			}
			
			System.out.println();
		}
	}

}
