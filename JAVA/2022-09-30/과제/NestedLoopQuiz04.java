/*
 * [문제]
 * 짝수 단과 홀수 단을 0과 1로 입력 받아서 출력
 * [입력]
 * 짝수 단은 0, 홀수 단은 1을 입력 : 
 * [출력]
 * 짝수 단은 0, 홀수 단은 1을 입력 : 0
 * 2 * 1 = 2
 * 2 * 2 = 2
 *   ~~~
 * 2 * 9 = 18
 * 
 * 4 * 1 = 3
 * 4 * 2 = 8
 *   ~~~
 * 4 * 9 = 36
 * 
 *   ~~~
 */
import java.util.Scanner;

public class NestedLoopQuiz04 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		System.out.print("짝수 단은 0, 홀수 단은 1을 입력 : ");
		int evenOrOdd = input.nextInt();
		int startValue = 0;
		
		if (evenOrOdd == 0)
			startValue = 2;
		else
			startValue = 3;
		
		for (int i=startValue; i<10; i+=2) {
			for (int j=1; j<10; j++) {
					System.out.println(i + " * " + j + " = " + (i * j));
			}
			
			System.out.println();
		}
		
		input.close();
	}

}
