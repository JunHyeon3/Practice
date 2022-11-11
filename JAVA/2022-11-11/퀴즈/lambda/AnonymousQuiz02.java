package lambda;

@FunctionalInterface
interface MaxReturn {
	// [기능] 매개변수 2개 중 큰 값 리턴
	int max(int n1, int n2);
	
	default void method(int n1, int n2) {
		System.out.printf("매개변수 값 n1 : %d, n2 : %d\n", n1, n2);
	}
}

//[문제 1] ===========================================================================
//SubMaxReturn 클래스 정의
//: SubMaxReturn class는 MaxReturn interface를 상속 받는다.
class SubMaxReturn implements MaxReturn {
	@Override
	public int max(int n1, int n2) {
		if(n1 > n2)
			return n1;
		return n2;
	}
}

public class AnonymousQuiz02 {
	public static void main(String[] args) {
		
		// [문제 2] =================================================================================
		// 객체 생성
		MaxReturn maxReturn = new SubMaxReturn();
		int max = maxReturn.max(5, 2);
		System.out.println("큰 값 >> " + max);
		// ==========================================================================================

		// [문제 3-1] 익명 클래스 : 참조 변수에 저장 ================================================
		// 익명 클래스로 구현
//		MaxReturn maxReturn2 = new MaxReturn() {
//			@Override
//			public int max(int n1, int n2) {
//				if(n1 > n2)
//					return n1;
//				return n2;
//			}
//		};
//		System.out.println("[익명 클래스 : 참조변수 이용] 큰 값 >> " + maxReturn2.max(5, 2));
		
		// 람다식으로 구현 
		MaxReturn lambda = (n1, n2) -> n1 > n2 ? n1 : n2;
		System.out.println("[람다식 : 참조변수 이용] 큰 값 >> " + lambda.max(5, 2));
		// ==========================================================================================

		// [문제 3-2] 익명 클래스 : System.out.println() 메소드 내 익명 클래스 구현 =================
		// 익명 클래스로 구현
//		System.out.println("[익명클래스 : 바로 사용] 큰 값 >> " + new MaxReturn() {
//			@Override
//			public int max(int n1, int n2) {
//				if(n1 > n2)
//					return n1;
//				return n2;
//			}
//		}.max(2, 5));
		
		// 람다식으로 구현
		System.out.println("[람다식 : 바로 사용] 큰 값 >> " + ((MaxReturn)(n1, n2) -> n1 > n2 ? n1 : n2).max(2, 5));
		// ==========================================================================================
	}
}