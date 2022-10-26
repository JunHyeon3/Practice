/*
 * static (클래스) 변수
 * class가 메모리에 로드 될 때, static 영역에 할당됨
 * 객체 생성과 상관없이 접근(사용) 가능
 * 객체 생성 없이 멤버 변수를 사용하고자 할 때 사용
 * static 변수는 해당 클래스로 생성된 객체들끼리 공유한다.
 * 문법 : 클래스명.변수명
 * 
 * static (클래스) 메서드
 * class가 메모리에 로드 될 때, static 영역에 할당됨
 * 객체 생성과 상관없이 접근(사용) 가능
 * 객체 생성 없이 멤버 메서드를 호출 하고자 할 때 사용
 * static 메서드 내에서는 static 멤버(변수,메서드)만 사용 가능
 * 문법 : 클래스명.메서드명
 */

class Dog {
	// 멤버 변수
	// static(클래스) 변수
	static int count;
	// instance(객체) 변수
	String name;
	
	// 멤버 메서드
	// static(클래스) 메서드 : static 변수만 사용 가능
	static void increment() {
		Dog.count++;
	}
	// instance(객체) 메서드 : static 변수와 instance 변수 모두 사용 가능
	void showInfo() {
		System.out.println("강아지 이름 : " + this.name);
	}
}
public class VariableStaticEx02 {

	public static void main(String[] args) {

		System.out.println("현재 강아지 개수 >> " + Dog.count);
		
		Dog.increment();
		
		System.out.println("현재 강아지 개수 >> " + Dog.count);
	}

}
