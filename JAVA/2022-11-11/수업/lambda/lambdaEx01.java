/*
 * [람다표현식] 람다식
 * - 이름이 보여지지 않기 때문에 익명 함수라고도 함
 * - 익명 클래스의 코드를 간결하게 해준다.
 * - 매개변수의 type도 생략이 가능함
 * - -> 는 리턴의 의미이다.
 * - 인터페이스의 추상 메서드가 단 1개이어야 한다.
 * 
 * 문법 : (parameter1, parameter2) -> {
 * 		  		code;
 * 				return 값;
 * 		  }
 * 
 * 		  (parameter) -> expression
 * 		  
 * 
 * 활용 : 참조 변수에 저장하여 사용
 * 		: return할 값으로 사용
 * 		: 인수로 사용
 */
package lambda;

interface Happy {
	int sum(int x, int y);
}

public class lambdaEx01 {

	public static void main(String[] args) {

		// 익명 클래스
		Happy h = new Happy() {
			@Override
			public int sum(int x, int y) {
				return x + y;
			}
		};
		System.out.println("익명 클래스로 sum() >>" + h.sum(2, 5));
		
		// 람다식
		Happy h2 = (int x, int y) -> x + y;
		System.out.println("람다식으로 sum() >> " + h2.sum(2, 5));
		
	}

}
