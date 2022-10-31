package interfaceexample;

// interface의 모든 메서드는 기본적으로 public abstract이다.
interface Method {
	void one();
	public abstract void two();
	
	// default를 명시해주면, interface내에서 기본 메서드로 만들 수 있다.
	default void defaultMethod() {
		System.out.println("interface 내 default 멤버 메서드");
	}
	
	// static을 명시해주면, static 메서드로 만들 수 있다.
	public static void staticMethod() {
		System.out.println("interface 내 static 멤버 메서드");
	}
}

// interface의 모든 메서드는 추상 메서드 이므로 오버라이딩 해주어야 한다.
class Sub implements Method {
	@Override
	public void one() {
		System.out.println("Sub class : 오버라이딩된 메서드 one()");
	}
	@Override
	public void two() {
		System.out.println("Sub class : 오버라이딩된 메서드 two()");
	}
}

public class Ex03 {

	public static void main(String[] args) {
		// interface는 객체 생성 불가능
//		Method m = new Method();
		
		// 다형성
		Method m = new Sub();
		
		m.one();
		m.two();
		m.defaultMethod();
		// Error! interface에서는 참조변수.static메서드명으로 접근이 불가능
//		m.staticMethod();
		// interface 내의 static 메서드는 반드시 interface 명으로 접근해야 한다.
		Method.staticMethod();
	}

}
