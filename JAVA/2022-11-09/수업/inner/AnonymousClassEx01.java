/*
 * [익명 클래스]
 * - 익명 클래스는 선언과 동작에 따라 3가지 유형으로 나뉨
 * 	1) 클래스 확장
 * 	2) 인터페이스구현
 * 	3) 인수
 */
package inner;

class Super {
	// constructor
	public Super() {
		System.out.println("Super class 생성자 실행됨");
	}
	
	// instance method
	public void print() {
		System.out.println("Super class의 print 메서드 실행됨");
	}
	
}

class Sub extends Super {
	// constructor
	public Sub() {
		System.out.println("Sub class 생성자 실행됨");
	}
	
	// instance method
	public void show() {
		System.out.println("Sub class의 show 메서드 실행됨");
	}
}
public class AnonymousClassEx01 {

	public static void main(String[] args) {
		// 다형성
//		Super s = new Sub();

		// 익명 클래스 =================================================
		Super anonymous = new Super() {
			// constructor를 정의할 수 없음 -> why? class명이 없음
			
			// instance method 
			// 익명 클래스 내부에서만 사용 가능, 외부에서 절대 사용 불가능!
			public void say() {
				System.out.println("익명 클래스 내 instance 메서드!");
			}
			
			@Override
			public void print() {
				System.out.println("익명 클래스 내에서 재정의된 print 메서드!");
			}
			
			@Override
			public String toString() {
				return "나는 익명 클래스!";
			}
		};
		// =============================================================
		
		// Error! say 메서드는 익명 클래스 내부에서만 사용 가능함
//		anonymous.say();
		
		System.out.println(anonymous);
		anonymous.print();
		
	}

}