public class IfEx01 {

	public static void main(String[] args) {
		
		int num = 5;

		// [조건 1개]
		if (num >= 5) {
			System.out.println("num : " + num);
		}

		System.out.println("실행 완료!");
	}

}

/*
 * [조건문]
 * <<조건 1개>>
 * if (조건식) {
 * 		조건이 true일 때, 실행할 명령어
 * }
 * 
 * <<조건 2개>>
 * if (조건식) {
 * 		조건이 true일 때
 * }
 * else {
 * 		조건이 false일 때
 * }
 * 
 * <<조건 3개>>
 * if (조건식1) {
 * 		조건1이 true일 때
 * }
 * else if (조건식2) {
 * 		조건2가 true일 때
 * }
 * else {
 * 		위 조건 2개를 만족하지 않는 나머지 일 때
 * }
 */
