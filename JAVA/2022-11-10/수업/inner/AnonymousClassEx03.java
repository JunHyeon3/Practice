package inner;

interface Box {
	public void boxing();
}

class Banana {
	// constructor
	public Banana() {
		System.out.println("바나나는 멸종위기입니다.");
	}
	
	// instance method
	public void buy (Box box) {
		box.boxing();
	}
}

public class AnonymousClassEx03 {

	public static void main(String[] args) {
		
		Banana banana = new Banana();
		// buy()의 인수로 Box 인터페이스를 상속 받은 자식의 객체 주소가 와야한다.
		// 하지만, 상속 받는 자식 클래스를 따로 정의하지 않고 익명 클래스를 인수에서 사용한다.
		banana.buy(new Box() {
			@Override
			public void boxing() {
				System.out.println("바나나 포장중~");
			}
		});

	}

}
