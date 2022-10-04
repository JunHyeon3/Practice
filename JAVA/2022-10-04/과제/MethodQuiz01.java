/*
 * [문제]
 * 인수로 양의 정수 2개를 받아, 두 정수 사이의 누적합 계산 후 출력
 * 메서드명 : add, 매개변수 : 2개, 리턴값 : 없음
 * 
 */

public class MethodQuiz01 {
	
	public static void add(int num1, int num2) {
		int sum = 0;
		
		// num1이 num2보다 크면 서로 순서 변경
		if (num1 > num2) {
			int tmp = num1;
			num1 = num2;
			num2 = tmp;
		}
		
		// num1부터 num2까지 반복하여 두 수 사이의 누적합 계산
		for (int i=num1; i<=num2; i++) {
			sum += i;
		}
		
		// 계산된 누적합 출력
		System.out.println(num1 + "부터 " + num2 + "까지의 누적 합 : " + sum);
	}
	
	public static void main(String[] args) {
		add(1, 10);
		add(5, 10);
		add(10, 1);
	}

}
