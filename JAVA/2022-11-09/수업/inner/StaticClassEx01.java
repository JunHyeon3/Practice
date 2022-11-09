/*
 * [static inner class]
 * - 멤버 class 이기 때문에 static 키워드를 붙일 수 있다.
 * - 외부에서 Outer class 객체 생성 없이, Inner class 에 접근 가능
 * - Outer class의 static method에서 static inner class 사용 가능
 * - static class type이 static 영역에 저장된다.
 *   -> static class 내부의 멤버가 모두 static이 되는 것이 아니다.
 */
package inner;

class OuterFour {
	// static inner class
	static class Inner {
		// instance field
		int num = 5;
		
		// static field
		static int user = 10;
		
		// constructor
		public Inner() {
			System.out.println("Inner class 생성자 실행됨!!");
		}
		
		// instance method
		public void show() {
			System.out.println("<< instance method 실행 >>");
			System.out.println("instance field : num >> " + this.num);
			System.out.println("static field : user >> " + user);
		}
		
		// static method
		public static void showStatic() {
			System.out.println("<< static method 실행 >>");
			// Error! static method는 static member만 사용 가능
//			System.out.println("instance field : num >> " + this.num);
			System.out.println("static field : user >> " + user);
		}
	}
}

public class StaticClassEx01 {

	public static void main(String[] args) {
		System.out.println("[객체 생성 전]");
		// static member는 class명으로 접근할 수 있다.
		OuterFour.Inner.user = 500;
		OuterFour.Inner.showStatic();
		
		
		System.out.println("\n[객체 생성 후]");
		// Inner class가 static class 이므로, OuterFour class 객체를 먼저 생성할 필요가 없다.
		OuterFour.Inner in = new OuterFour.Inner();
		
		in.show();
	}

}
