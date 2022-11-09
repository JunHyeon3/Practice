package inner;

interface Yahoo {
	// 다형성으로 Inner class 객체의 주소를 저장해도 자식 메서드를 호출하여 사용할 수 없다.
	// 따라서, showNum() 메서드를 오버라이딩하도록 하여 부모인 Yahoo 인터페이스가 사용할 수 있도록 한다.
	public void showNum();
}

// 내부 클래스는 어차피 외부 클래스에 의존하므로 이름이 같아도 된다.
class OuterTwo {
	// Inner class가 private이므로, 내부에서 getter를 사용해 객체를 생성하여 반환한다.
	public Inner getInner() {
		return new Inner(5);
	}

	// 생성되는 객체의 주소를 다형성으로 사용하기 위해, 별도의 interface를 상속해준다.
	private class Inner implements Yahoo {
		// instance field
		int num;

		// constructor
		public Inner(int num) {
			this.num = num;
			System.out.println("Inner class의 생성자 실행!!");
		}
		
		// instance method
		public void showNum() {
			System.out.println("Inner class의 instance field : num >> " + this.num);
		}
	}
}

public class InstanceClassEx02 {

	public static void main(String[] args) {
		
		OuterTwo outerTwo = new OuterTwo();
		
		// Error! Inner class가 private이므로 외부에서 객체 생성을 할 수 없다.
//		OuterTwo.Inner inner = outerTwo.new Inner(5);
		
		// getter로 생성되어 반환되는 Inner 객체의 주소를 다형성으로 저장한다.
		Yahoo inner = outerTwo.getInner();
		
		inner.showNum();
	}

}
