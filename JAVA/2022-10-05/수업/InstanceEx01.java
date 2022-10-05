/*
 * [클래스] class
 * 클래스는 "자료형" 이다!
 * 사용자 정의 자료형 : 사용자가 만들어서 사용하는 자료형
 * 참조형(reference type) 
 * cf) 기본 자료형(primitive type) : int, float, double, ...
 * 
 * 클래스명은 대문자로 시작
 * 숫자로 시작하면 안됨
 * 클래스 내의 멤버 : 변수, 메서드
 * 
 *     			 선언되는 위치			메모리 할당 시기		메모리 해제 시기			메모리 영역		초기값(default)
 *   지역 변수 : {} 영역 내에서 선언	해당 영역이 실행될 때	해당 영역이 종료될 때		Stack			쓰레기값
 *   멤버 변수 : 클래스 내에서 선언		객체가 생성이 될 때		객체가 소멸이 될 때			Heap		  	0, null
 *   
 * 
 * 학생의 나이, 이름은 변수
 * 학생이 공부한다는 메서드
 */

// class 정의
class Student {
	// 멤버 변수
	int age;
	String name;
	
	// 멤버 메서드
	void study() {
		System.out.println("공부를 열심히 해요!");
	}
}

public class InstanceEx01 {

	public static void main(String[] args) {
		// 변수 선언
		// 자료형 변수명;
		int num;
		num = 1;
		
		// 변수 선언
		// 클래스명 변수명;
		// 클래스명 뒤에 오는 변수는 참조변수
		// hong이라는 변수에는 주소가 저장되고, 그 정수는 int형이므로 4byte
		Student hong; 
		
		// 객체 생성 
		// new 클래스명()
		// new는 heap영역에 할당하는 연산자 
		hong = new Student(); 
		
		// 변수 선언과 객체 생성
		// 클래스명 변수명 = new 클래스명();
		// Student hong = new Student();
		
		// 자바는 멤버변수가 초기화 되어 있지않으면, 
		// 자동으로 int는 0, String은 null로 초기화한다.
		// .은 주소에 접근하는 연산자
		System.out.println("멤버변수 age의 초기 값 >> " + hong.age); 
		System.out.println("멤버변수 name의 초기 값 >> " + hong.name);

		// 멤버 변수에 값을 입력
		hong.age = 26;
		System.out.println("멤버변수 age의 값 >> " + hong.age);

		// 멤버 메서드 study()를 호출
		hong.study();
	}

}
