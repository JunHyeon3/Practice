class ParentTwo {
	String lastName;
	
//	public ParentTwo() {
//		System.out.println("부모의 생성자 실행");
//	}
	
	public ParentTwo() {
		
	}
	
	public ParentTwo(String lastName) {
		this.lastName = lastName;
	}
}

class ChildTwo extends ParentTwo {
	// 객체 생성시 자식 생성자를 먼저 찾아온다.
	// 하지만, 자동으로 super()를 추가하여 부모의 생성자를 먼저 호출하게 된다.
//	public ChildTwo() {
//		System.out.println("자식의 생성자 실행");
//	}
	
	// 매개 변수가 없는 기본 생성자를 추가할 때, 자동으로 super() 가 추가 되므로
	// 부모 class에도 기본 생성자를 추가해 주어야 한다.
	public ChildTwo() {
		
	}

    // 부모에 직접 접근하여, lastName에 값 설정
//	public ChildTwo(String lastName) {
//		// super : 부모의 멤버 변수에 접근할 때, this대신 사용하는 참조변수 
//		super.lastName = lastName;
//	}
	
	// 부모의 생성자를 통해서, 멤버 변수 lastName에 값 설정
	public ChildTwo(String lastName) {
		// super() : 부모의 생성자를 호출할 때, this() 대신 사용하는 메서드
		super(lastName);
	}
	
	public void showInfo() {
		System.out.printf("저는 %s씨 입니다.\n", this.lastName);
	}
}

public class InheritanceEx02 {

	public static void main(String[] args) {

		ChildTwo childTwo = new ChildTwo("홍");
		childTwo.showInfo();
		
		ChildTwo childTwo2 = new ChildTwo();
		childTwo2.showInfo();
		
	}

}
