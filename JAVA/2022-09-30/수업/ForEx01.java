/*
 * [반복문] for 문
 * 
 * for (초기값; 조건식; 증감식) {
 * 		명령문;
 * }
 * 
 */

public class ForEx01 {

	public static void main(String[] args) {

		// [while 문]
		int idx = 1; 		// 초기값
		
		while (idx < 3) {	// 조건식
			System.out.println("while문의 idx >> " + idx);
			
			idx++;			// 증감식
		}

		System.out.println();
		
		// [for 문]
		for(idx=1; idx<3; idx++) {
			System.out.println("for문의 idx >> " + idx);
		}
		
	}
}
