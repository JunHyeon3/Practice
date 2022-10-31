/*
 * [interface]
 * - 추상 class 보다 엄격해진(upgrade된) 자료형이다.
 * - 객체 생성을 할 수 없다. -> 즉, 상속과 다형성으로 사용한다.
 * - interface 와 interface 간의 상속은 extends를 사용한다.
 * - class와 interface 간의 상속은 implements를 사용한다.
 * - class의 부모가 interface (o), interface의 부모가 class (x)
 * 
 * - member field
 * 		: public static final로 고정된다.
 * 		: 기본이 final이므로 변수명을 대문자로 작성한다.
 * 
 * - member method
 * 		: public abstract로 고정된다.
 * 		: 기본이 추상 메서드 이다.
 * 
 */

package interfaceexample;

interface A { }
interface B { }
interface C extends A { }
interface D extends A, B { } 			// interface는 다중 상속이 가능

class E { }
class F { }
class G extends E { }
//class H extends E, F { } 				// Error! class는 다중 상속이 불가능
//class I extends A { } 				// Error! type이 다르기 때문에 extends 사용 불가능
class J implements A { } 				// type이 다를 때 상속은 implements 사용

class K extends E implements A, B { } 
//class L implements A extends E { }	// Error! 반드시 같은 type이 먼저와야 함 

//interface M implements E				// interface는 절대로 class를 부모로 둘 수 없음

public class Ex01 {

	public static void main(String[] args) {
	}

}
