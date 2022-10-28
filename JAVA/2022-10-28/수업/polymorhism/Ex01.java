/*
 * [다형성]
 * 참조변수의 자료형과 생성하는 객체의 자료형이 다름
 * 부모 type의 참조 변수로 자식 type의 객체에 접근(가리킴)
 * 단, 반대로(자식 type -> 부모 type)는 불가능
 * 부보의 멤버에만 접근 가능하며, 자식의 멤버에는 접근 불가능
 * 단, 오버라이딩 된 메서드는 접근 가능
 * 
 * 부모자료형 참조변수 =  new 자식자료형();
 */

package polymorhism;

class Parent {
	// 1000단위 기호(,)대신 _을 사용
	private int money = 1_000_000;
	
	public void spend(int money) {
		this.money -= money;
		System.out.println("남은 돈은 " + this.money + "원 입니다.");
	}
	
	public void working() {
		System.out.println("부모님 : 일하는 중입니다.");
	}
}

class Son extends Parent {
	public void study() {
		System.out.println("아들 : 공부하는 중입니다.");
	}
	
	@Override
	public void spend(int money) {
		System.out.println("아들 : 학원비 " + money + "원 주세요!");
	}
	
}

class Daughter extends Parent {
	public void play() {
		System.out.println("딸 : 노는 중입니다.");
	}
	
	@Override
	public void spend(int money) {
		System.out.println("딸 : 용돈 " + money + "원 주세요!");
	}
}

public class Ex01 {

	public static void main(String[] args) {

		Son son = new Son();
		son.working();
		son.study();
		son.spend(200_000);
		
		Daughter daughter = new Daughter();
		daughter.spend(10_000);
		
		// 다형성으로 구현
		// p는 오직 자신의 class 멤버만 볼 수 있다. 
		// 하지만, 유일하게 오버라이딩 된 메서드는 사용할 수 있다.
//		Parent p = new Son();
		// 자식 타입 -> 부모 타입으로 up casting (자동 형변환)
		Parent p = son;
		p.working();
		p.spend(900_000);
		
		// 부모 타입 -> 자식 타입으로 down casting (강제 형변환)
		Son s2 = (Son)p;
		
//		Parent p2 = new Daughter();
		Parent p2 = daughter;
		p2.spend(200_000);
		
		// Error
//		Parent p = new Cat(); : 상속 관계가 아님
//		Son s = new Parent(); : 순서가 뒤집힘
		
		// 객체 배열
//		Parent[] parent = new Parent[2];
//		parent[0] = new Son();
//		parent[1] = new Daughter();
		Parent[] parent = {new Son(), new Daughter()};
		
		// 똑같은 메서드를 사용하지만, 자식이 누구인지에 따라 기능이 다름
		parent[0].spend(10);
		parent[1].spend(10);
		
	}

}
