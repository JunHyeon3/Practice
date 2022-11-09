package inner;

class OuterThree {
	// instance field
	int one = 100;
	// static field
	static int two = 200;
	
	// constructor
	public OuterThree() {
		this.one = 100;
		// 생성 시기가 다르므로, static field는 생성자로 초기화 하지 않음
//		this.two = 200;
	}
	
	// instance method
	public void show() {
		System.out.println(one);
		System.out.println(two);
		
		// OuterThree 클래스 메서드에서 Inner 클래스 객체 생성 가능
		Inner in = new Inner();
	}
	
	// static method
	public static void showStatic() {
		// Error! static method는 static member만 사용 가능
//		System.out.println(one);
		System.out.println(two);
	
		// Error! static 메서드에서 Inner 클래스 객체 생성 불가능
//		Inner in = new Inner();
	}
	
	// inner class
	class Inner {
		// Inner 클래스에서는 OuterThree 클래스의 모든 멤버 사용 가능
		public void showData() {
			System.out.println(one);
			System.out.println(two);
			show();
			showStatic();
		}
	}
	
	// OuterThree 클래스에서 Inner 클래스 객체 생성 가능
	Inner in = new Inner();
}

public class InstanceClassEx03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
