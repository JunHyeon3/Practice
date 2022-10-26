class Person {
	// 멤버 변수 : 인스턴스 변수(객체 변수)
	int age;
	String name;
	
	// 생성자
	public Person(int age, String name) {
		this.age = age;
		this.name = name;
	}
	
	// 멤버 메서드 : 인스턴스 메서드(객체 메서드)
	void setAge(int age) {
		this.age = age;
	}
	void showInfo() {
		System.out.println("나이 : " + this.age);
		System.out.println("이름 : " + this.name + "\n");
	}
}

public class ArrayEx03 {

	public static void main(String[] args) {

		/*
		 * 객체를 따로 3개 만들지 않고 객체 배열을 사용하는 이유는?? 
		 * 객체를 따로 만들게 되면, 3개 다른 참조 변수명을 지정해야 한다.
		 * 하지만 객체 배열을 사용할 경우, 하나의 참조 변수 명으로 
		 * 여러개의 객체를 관리할 수 있기때문에 객체 배열을 사용한다.
		 */

		Person[] smart = new Person[3];
		smart[0] = new Person(20, "홍길동");
		smart[1] = new Person(29, "박보검");
		smart[2] = new Person(24, "김한결");
		
		// 일반 for문
//		for(int i=0; i<smart.length; i++)
//			smart[i].showInfo();
		
		// 홍길동의 나이를 20 -> 30으로 변경
		smart[0].setAge(30);
		
		// 향상된 for문
		for(Person i: smart)
			i.showInfo();
		
	}

}
