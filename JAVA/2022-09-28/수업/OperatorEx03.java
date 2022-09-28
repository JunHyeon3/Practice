public class OperatorEx03 {

	public static void main(String[] args) {

		// [1 증가/감소 연산자]
		int num = 5;
		
		// num = num + 1;		// 1 증가식
		// num += 1				// 복합 대입 연산자
		// num++;				// 1증가 연산자

		// int result = ++num; 	// 선증가 연산자
		/* 
		 * 선증가 연산자의 동작을 풀어보기
		 * num = num + 1;
		 * int result = num;
		 */
		
		int result = num++; 	// 후증가 연산자
		/*
		 * 후증가 연산자의 동작을 풀어보기
		 * int result = num;
		 * num = num + 1;
		 */
		
		System.out.println("num : " + num);
		System.out.println("result : " + result);
	}

}
