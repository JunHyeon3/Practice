/*
 * [생성자의 특징]
 * 생성자 내에서 다른 메서드를 호출 할 수 있다.
 * 생성자 내에서 다른 생성자를 호출 할 수 있다.
 * 		다른 생성자 호출은 반드시 가장 첫 라인에 있어야 한다.
 * 		생성자 호출시 생성자 명을 사용하지 않고, this()를 사용한다.
 * 
 * [this 형태]
 * this.멤버	: 참조변수
 * this()		: 생성자
 */

class Student {
	// 멤버 변수
	int age;
	String name;
	
	// 생성자
	public Student() {
		this(0, "미입력");
//		this.age = 0;
//		this.name = "미입력";
//		this.showInfo();
	}
	public Student(String name) {
		this(0, name);
//		this.age = 0;
//		this.name = name;
//		this.showInfo();
	}
	public Student(int age, String name) {
		this.age = age;
		this.name = name;
		this.showInfo();
	}
	
	// 멤버 메서드
	public void showInfo() {
		// this가 없어도 되지만, 멤버 변수를 가리키기 때문에 넣어주는 것이 좋음
		System.out.printf("이름은 %s이고, 나이는 %d살입니다.\n", this.name, this.age);
	}
}

public class ConstructorEx02 {

	public static void main(String[] args) {
		// 출력 : 이름은 미입력이고, 나이는 0살입니다.
		Student noName = new Student();
//		noName.showInfo();
		
		// 출력 : 이름은 홍길동이고, 나이는 29살입니다.
		Student hong = new Student(29, "홍길동");
//		hong.showInfo();
		
		// 출력 : 이름은 박보검이고, 나이는 0살입니다.
		Student park = new Student("박보검");
//		park.showInfo();
	}

}
