/*
 * [메서드 참조 표현식]
 * - method reference expression
 * - 이중 콜론 연산자 ::
 * - 함수형 인터페이스를 람다식이 아닌 일반 메서드를 참조시켜 선언하는 방법
 * - 즉, 컴파일러가 람다의 타입을 추론할 수 있도록 정보를 제공하는 역할
 * - 람다식을 좀 더 축약해서 사용할 수 있지만, 람다식에서만 사용하지는 않음
 * 
 * << 함수형 인터페이스 >>
 * - interface는 반드시 abstract method 1개 
 * 	 (Single Abstract Method : SAM)
 * 	 @FunctionalInterface 어노테이션으로 보장
 * 
 * - 선언부가 완전히 같아야 함
 *   즉, 매개변수 정보와 리턴 타입은 동일하고, 기능만 다르다.
 *   
 * - 리턴 타입과 파라미터 타입이 동일한 "기존에 구현된" 메서드를 
 *   빈 껍데기에 참조만 하면 더 간편하게 사용
 *   
 * - 참조 : 가리키는 역할
 *   참조만 하기에, 메서드명만 사용하고 ()는 제외
 *   
 * - 참조 가능한 메서드 : instance method, static method, constructor
 * 
 * - [문법]
 *   1) 인스턴스::메서드명	
 * 	 2) 인스턴스::new 		- constructor
 * 	 3) 클래스명::메서드명 	- static method일 경우
 */

package method.reference.expression;

@FunctionalInterface
interface Fruit {
	// abstract method
	String selfIntroduction(String n1, String n2);
	
	// 꼭 interface의 abstract method를 class로 구현해야 하는가? No!
	// inheritance, anonymous class, lambda expression, method reference expression
}


// inheritance
class Banana implements Fruit {
	@Override
	public String selfIntroduction(String n1, String n2) {
		return "[상속] " + n1.concat(n2);
	}
}

// method reference expression
// - Add class는 Fruit interface와 관련이 없음
// - 하지만 Add class의 staticAdd()와 instanceAdd() method의선언부가 
//	 Fruit interface의 abstract method와 같다!
class Add {
	// constructor
	public Add() {
		System.out.println("Add 클래스 생성자 실행됨");
	}	
	
	// static method
	static String staticAdd(String n1, String n2) {
		return n1 + "-" + n2;
	}
	
	// instance method
	String instanceAdd(String n1, String n2) {
		return n1.concat(", ").concat(n2);
	}
}

public class Ex01 {

	public static void main(String[] args) {
		
		// 1. inheritance ========================================================
		Banana banana = new Banana();
		System.out.println(banana.selfIntroduction("나는 ", "바나나"));
		
		// 2. anonymous class ====================================================
		Fruit anonymous = new Fruit() {
			@Override
			public String selfIntroduction(String n1, String n2) {
				return "[익명 클래스] " + n1 + n2;
			}
		};
		System.out.println(anonymous.selfIntroduction("만나서 ", "반가워!"));
		
		// 3. lambda expression ==================================================
		Fruit lambda = (n1, n2) -> "[람다식] " + n1.concat(n2);
		System.out.println(lambda.selfIntroduction("날씨가 ", "추워졌어~"));
		
		// 4. method reference expression ========================================
		Add add = new Add();
		
		// instance method : 참조변수(add)로 접근
		Fruit one = add::instanceAdd;
		System.out.println("[메서드 참조 : instance method] " + one.selfIntroduction("ONE", "TWO"));
		
		// static method : 클래스 명(Add)으로 접근
		Fruit two = Add::staticAdd;
		System.out.println("[메서드 참조 : static method] " + two.selfIntroduction("첫번째", "두번째"));
		
		// [문제] constructor 참조하기
		// Add class의 생성자 : 매개변수 없고, 리턴값 없음
		// 따라서 Runnable 함수형 인터페스 사용
		// Runnable의 run() 메서드 : 매개변수 없고, 리턴값 없음
		Runnable constructor = Add::new;
		constructor.run();
	}

}
