
// Person 클래스 정의
class Person {
	// 멤버 변수
	int age;
	String name;
	String address;

	// 멤버 메서드

	// setter, getter
	// 멤버 변수의 값 설정 : set
	// 멤버 변수의 값 리턴 : get
	void setAge(int a) {
		age = a;
	}

	void setName(String s) {
		name = s;
	}

	String getName() {
		return name;
	}
	
	void showAge() {
		// 지역 변수 
		// 이 지역변수는 showAge() 메서드가 호출될 때, stack에 생성된다.
		//int age = 100;
		 
		// 메서드 내에 지역변수가 있으면 지역변수를 사용
		// 지역변수가 없으면 멤버변수를 사용
		System.out.println("나이 >> " + age);
	}
	
	void showInfo() {
		System.out.println("this >> " + this);
	}
}

public class InstanceEx02 {

	public static void main(String[] args) {

		// 1. 참조 변수 선언
		// 자료형 	변수명;
		// 클래스명 참조변수;
		// 참조변수는 메모리의 stack에 생성됨
		Person p1;
		
		// 2. 객체 생성
		// new 클래스명(); 
		// heap 영역에 class 멤버를 할당하세요!
		p1 = new Person();
		
		// 3. 멤버 접근
		// 3-1. 멤버 변수에 값 설정 
		
		// 참조 변수를 통한 멤버 변수 값 설정(외부접근) → 객체지향에서 권장하지 않음!
		//p1.age = 25;
		//p1.name = "홍길동";
		
		// 메서드를 통한 멤버 변수 값 설정하는 방법을 사용
		p1.setAge(35);
		p1.setName("홍길동");
		
		// 3-2. 멤버 메서드 호출
		p1.showAge();
		System.out.println("이름 >> " + p1.getName());
		
		// 4. 참조 변수 p1과 this
		// 출력은 둘다 Person@69222c14로 동일
		// 출력의 Person은 자료형(클래스 명), 69222c14은 16진수로 나타낸 주소를 의미
		// 즉, this의 주소는 p1의 주소와 일치한다. 
		p1.showInfo();
		System.out.println("p1 >> " + p1);
	}

}
