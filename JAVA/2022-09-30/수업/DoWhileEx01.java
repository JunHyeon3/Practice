/*
 * [do~while 문]

 * do {
 * 		명령문
 * } while(조건식);
 * 
 * 조건에 상관없이 반복문을 반드시 처음에 1회 이상 실행시키고자 할 때 사용								
 * 
 */

public class DoWhileEx01 {

	public static void main(String[] args) {
		
		int idx = 10;
		
		// [while 문]
		while (idx < 10) {
			System.out.println("while문 실행");
			System.out.println("idx >>> " + idx);
			idx++;
		}
		
		
		// [do~while 문]
		do {
			System.out.println("do~while문 실행");
			System.out.println("idx >>> " + idx);
			idx++;
		} while (idx < 10);
		
	}
}
