package polymorhism;

class Fruit {
	@Override
	public String toString() {
		return "과일";
	}
}

class Person {
	@Override
	public String toString() {
		return "저는 사람입니다.";
	}
}

public class Ex03 {
	
	// 모든 class의 최상위 부모는 Object이기 때문에 다형성을 사용하여 
	// Fruit class와 Person class에서 오버라이딩된 toString() 메서드를 사용 할 수 있다.
	public static void printInfo(Object obj) {
		System.out.println(obj);
	}
	
	public static void main(String[] args) {
		Fruit f = new Fruit();
		Person p = new Person();
		
		printInfo(f);
		printInfo(p);
	}

}
