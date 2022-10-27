class Parent {
	int money = 1000000;
	
	public void buy(int money) {
		this.money -= money;
		System.out.printf("남은 돈은 %d원 입니다.\n", this.money);
	}
}

// Child class를 정의하면서, extends를 사용하여 Parent class를 부모로 설정
// 자바는 단일 상속만 허용하고, 다중 상속(하나의 자식이 여러 부모를 가짐)을 허용하지 않음
class Child extends Parent {
	public void study() {
		System.out.println("저는 공부 중 입니다.");
	}

	/*
	 * [메서드 오버라이딩]
	 * 자식 class가 부모 class의 멤버 메서드를 재정의하는 것
	 * 반드시 상속 관계에서만 사용 가능
	 * 단, 부모 class의 멤버 메서드의 선언부(반환형, 메서드명, 매개변수 정보)는 같아야 하고, 바디(기능)만 수정
	 * 
	 * [메서드 오버로딩]
	 * 같은 이름의 메서드를 여러 개 정의 하는 것
	 * 단, 매개변수의 정보(자료형, 개수)가 달라야 하며, 반환형과는 관계 없음
	 */
	public void buy(int money) {
		System.out.printf("용돈 %d원 주세요!\n", money);
	}
}

public class InheritanceEx01 {

	public static void main(String[] args) {

		Child child = new Child();
		child.buy(10000);
		child.study();
	}

}
