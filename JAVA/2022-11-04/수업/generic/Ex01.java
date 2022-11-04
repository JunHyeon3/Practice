/*
 * [제너릭(Generic)]
 * - data type을 일반화 함
 * - type이 사용자에 의해서 지정(결정)됨
 * - 컴파일할 때, type 검사를 함
 * - class, method, interface 에서 사용 가능
 * - 제너릭 클래스, 제너릭 메서드, 제너릭 인터페이스 
 * - public <제너릭타입> void 메서드명(제너릭타입 매개변수명) { ... }
 * 
 * - 제너릭 타입(Generic Type)
 *   =======================
 *     	타입	|	설명
 *   -----------------------
 *   	<T>		|	Type
 *   	<E>		|	Element
 *   	<K>		|	Key
 *   	<V>		|	Value
 *   	<N>		|	Number
 *   =======================
 */

package generic;

class Apple {
	@Override
	public String toString() {
		return "사과는 맛있다.";
	}
}

class Banana {
	@Override
	public String toString() {
		return "바나나는 멸종 위기이다.";
	}
}

class InstanceType {
	int count;
	
	// [제너릭 메서드]
	// 반환형 왼쪽
	// <>와 ()안의 T가 인수와 일치하는 type으로 자동으로 변환됨
	public <T> void showInstanceType(T t) {
		System.out.println("Type >> " + t);
	}
}

public class Ex01 {

	public static void main(String[] args) {

		Apple apple = new Apple();
		Banana banana = new Banana();
		
		InstanceType instanceType = new InstanceType();
		// 인수가 apple이면 t에 Apple 객체의 주소, banana이면 t에 Banana 객체의 주소가 저장됨
		// 명확하게 하기 위해서 제너릭 타입을 명시해주는 것이 좋음
		instanceType.<Apple>showInstanceType(apple);
		instanceType.<Banana>showInstanceType(banana);
	}

}
