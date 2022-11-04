/*
 * - 제너릭 파라미터는 Object 메서드만 호출 가능하다. 따라서 강제 형 변환이 필요하다. 
 * 	 하지만 강제 형 변환에 따른 실행할 때 Exception 발생 가능성이 존재하기 때문에
 * 	 이는 자료형에 안전하지 않은 코드이다. 
 * 	 즉, 제너릭의 장점이 사라짐
 * - 그래서 자바는 제너릭 매개변수 자료형에 제한을 두는 문법을 제공한다.
 * 	 : 자료형에 안전한 구조
 * 	 : 제너릭 매개변수의 type을 제한하기 위해 extends를 사용한다.
 * 	 : class 와 interface를 구분하지 않고, extends 키워드만 사용한다.
 */

package generic;

interface Available {
	void selfIntroduction();
}

class Tree {
	String sort;
	int age;
	
	public Tree() { }
	public Tree(String sort, int age) {
		this.sort = sort;
		this.age = age;
	}

	public void info() {
		System.out.printf("INFO : 종류 - %s, 나이 - %d\n", this.sort, this.age);
	}
}

class Maple extends Tree implements Available{
	public Maple(String sort, int age) {
		super(sort, age);
	}
	
	@Override
	public void selfIntroduction() {
		System.out.println("나는 단풍나무이다.");
	}
}

class Pine extends Tree implements Available{
	public Pine(String sort, int age) {
		super(sort, age);
	}
	
	@Override
	public void selfIntroduction() {
		System.out.println("나는 소나무이다.");
	}
}

public class Ex03 {
	// [자료형에 안전하지 않은 코드]
	// 어떤 type이든 다 받아들이기 때문에, 실행시 예외가 발생할 수 있다.
	// 어떤 type이 올지 모르기 때문에 t는 Object 멤버만 인식한다.
	// 강제 형 변환을 해줘야 다른 메서드를 인식한다.
//	public static <T> void callSelfIntroduction(T t) {
//		((Available)t).selfIntroduction();
//	}
//	public static <T> void callInfo(T t) {
//		((Tree)t).info();
//	}
	
	// [받아들이는 type을 제한]
	// interface이든 class이든 extends를 사용한다.
	// Available을 포함한 자식들의 type만 받아들인다.
	public static <T extends Available> void callSelfIntroduction(T t) {
		t.selfIntroduction();
	}
	public static <T extends Tree> void callInfo(T t) {
		t.info();
	}
	
	public static void main(String[] args) {
		Maple maple = new Maple("고로쇠나무", 25);
		Pine pine = new Pine("금강소나무", 33);
		
		callSelfIntroduction(maple);
		callInfo(maple);
		
		callSelfIntroduction(pine);
		callInfo(pine);
		
		// Available의 자식이 아니기 때문에 에러가 발생한다.
//		String name = "hi";
//		callSelfIntroduction(name);
	}

}
