/*
 *  [메서드 오버로딩] method overloading
 *  같은 이름의 메서드를 여러개 정의하는 것
 *  단, 매개변수의 정보(개수, 타입)가 달라야 하고 변수명은 동일해야 함
 */

public class MethodEx05 {

	// 메서드 정의
	// 기능 : 정수 2개를 받은 후, 덧셈한 결과를 출력
	public static void sum(int n1, int n2) {
		int result = n1 + n2;
		
		System.out.println("덧셈 결과 >> " + result);
	}
	
	// 메서드 오버로딩
	// 기능 : 실수 2개를 받은 후, 덧셈한 결과를 출력
	public static void sum(double n1, double n2) {
		double result = n1 + n2;
		
		System.out.println("덧셈 결과 >> " + result);
	}

//  메서드 오버로딩이 맞다!
//	why? 매개변수의 정보(개수)가 다르기 때문에
//	public static void sum(int n1) { }
	
// 	메서드 오버로딩이 아니다!
//	why? 매개변수의 정보(개수와 타입)이 동일하기 때문에
//	public static void sum(int num1, int num2) { }

// 	메서드 오버로딩이 아니다!
//	why? 반환형은 메서드 오버로딩의				 비교조건이 아니다!							
//	public static int sum(int n1, int n2) { return n1 + n2; }

	public static void main(String[] args) {
		sum(3, 5);	
		
		sum(2.1, 4.5);
	}

}


				