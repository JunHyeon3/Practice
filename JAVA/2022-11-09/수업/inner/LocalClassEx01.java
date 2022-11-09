/*
 * [local inner class]
 * - method 내에서 정의된 클래스
 * - 접근권한(public, private등), static을 사용할 수 없다.
 *   -> why? 메서드가 호출 되어야만 사용이 되므로 접근권한이 필요 없다. 
 */
package inner;

class OuterSix {
	public void show() {
		// local class 정의 ================================================
		class Inner {
			// instance field
			int num = 10;
			
			// static field : local class에서 static field는 의미가 없음
			static int user = 500;
			
			// constructor
			public Inner() {
				System.out.println("<< 지역 클래스 생성자 실행됨 >>");
			}
			
			// instance method
			public void printNum() {
				System.out.println("instance field : num >> " + this.num);
			}
		}
		// =================================================================

		// [show() 메서드 내에서 객체 생성]=================================
		Inner in = new Inner();
		
		in.printNum();
		
		Inner.user = 500;
		System.out.println("static field : user >> " + Inner.user);
		// =================================================================
	}
}

public class LocalClassEx01 {
	public static void main(String[] args) {
		OuterSix outer = new OuterSix();
		
		outer.show();
	}    
}
