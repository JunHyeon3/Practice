/*
 * [문제]
 * 중첩 while문을 사용하여 구구단 2~9단을 출력하시오
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
 */

public class NestedLoopQuiz02 {

	public static void main(String[] args) {
		
		int multiplicationValue = 2;
		
		while (multiplicationValue < 10) {
			int idx = 1;
			
			while (idx < 10) {
				System.out.println(multiplicationValue + " * " + idx + " = " + (multiplicationValue * idx));
				
				idx++;
			}
			
			multiplicationValue++;
			
			System.out.println();
		}
	}

}
