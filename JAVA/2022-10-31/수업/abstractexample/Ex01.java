/*
 * [추상 클래스] abstract class 
 * - 추상 클래스 내에 추상 메서드가 있을 수도 있고, 없을 수도 있다.
 * - 추상 클래스는 객체 생성을 할 수 없다.
 * - 다형성 또는 상속으로 사용한다.
 * 
 * [추상 메서드] abstract method
 * - body를 명시하지 않는다. -> 중괄호({}) 대신 세미콜론(;)을 입력한다.
 * - 추상 메서드는 미완성된 메서드 이다.
 * - 추상 메서드는 반드시 추상 클래스안에 있어야 한다.
 * - 추상 메서드는 static으로 사용할 수 없다.
 * - 추상 메서드가 있는 추상 클래스를 상속 받은 자식 클래스는
 * 	 반드시 추상 메서드를 오버라이딩 해야 한다. (강제성!!)
 */

package abstractexample;

abstract class Parent {
	// 멤버 변수 : instace fied
	int numOne;
	// 멤버 변수 : static fied
	static int numTwo;
	
	// 추상 메서드 (미완성된 메서드)
	public  void methodOne() {;}
	// 추상 메서드는 static으로 사용할 수 없다.
//	public abstract static void methodFour();
	
	// 멤버 메서드 : instance method
	public void methodTwo() {
		System.out.println("instance 메서드 : methodTwo()");
	}
	
	// 멤버 메서드 : static method
	public static void methodThree() {
		System.out.println("static 메서드 : methodThree()");
	}
}

class Child extends Parent {
	@Override
	public void methodOne() {
		System.out.println("오버라이딩된 추상 메서드 : methodOne()");
	}
}

public class Ex01 {

	public static void main(String[] args) {
		
		// 1. 자식 클래스로 객체 생성
		Child c = new Child();
		c.methodOne();
		
		// 2. 추상 클래스로 객체 생성을 할 수 없음
//		Parent p = new Parent(); 
		
		// 3. 다형성
		Parent p = new Child();
		p.methodOne();
		p.methodTwo();
		Parent.methodThree();
	}

}
