
public class ArrayEx01CleanCode {

	public static void main(String[] args) {

		// 1. 배열 생성과 동시에 초기값 설정
		// 배열의 길이는 쓰지 않는다.
		// 자료형[] 배열명 = new 자료형[] {값1, 값2, ...};
		// int[] math = new int[] { 60, 70, 90, 100, 20 };
		
		// 객체 생성을 생략할 수도 있다.
		// 자료형[] 배열명 = {값1, 값2, ...};
		int[] math = { 60, 70, 90, 100, 20 };
		
		// 2. 배열 요소의 값 확인
		// 2-1. 일반 for문
		System.out.println("<< 일반 for문 >>");
		for(int i=0; i<math.length; i++) {
			System.out.printf("math[%d] = %d\n", i, math[i]);
		}
		
		// 2-2. 향상된 for문
		System.out.println("\n<< 향상된 for문 >>");
		for(int i : math) {
			System.out.println(i);
		}
	}

}
