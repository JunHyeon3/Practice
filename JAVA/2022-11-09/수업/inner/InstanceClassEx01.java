package inner;

class Outer {
	class Inner {
		// instance field
		int num;
		
		// constructor
		public Inner(int num) {
			this.num = num;
			System.out.println("Inner class의 생성자 실행!");
		}
		
		// instance method
		void showNum() {
			System.out.println("Inner class의 instance field : num >> " + this.num);
		}
	}
}

public class InstanceClassEx01 {

	public static void main(String[] args) {
		
		// 1-1. Outer 객체 생성
		Outer outer = new Outer();
		
		// 1-2. Inner 객체 생성 - 반드시 Outer의 객체가 먼저 생성되어 있어야 함
		// 외부클래스.내부클래스 참조변수 = 외부클래스참조변수.new 내부클래스();
		Outer.Inner inner = outer.new Inner(10);
		
		inner.showNum();
		
		// 2. Outer, Inner 객체 동시 생성
		Outer.Inner innerTwo = new Outer().new Inner(30);
		
		innerTwo.showNum();
	}

}
