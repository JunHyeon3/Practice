class Animal {
	int leg;
	String name;
	
	public Animal() { }
	public Animal(int leg, String name) {
		this.leg = leg;
		this.name = name;
	}
}

class Cat extends Animal {
	// 생성자
	public Cat() { }
	public Cat(int leg, String name) {
		super(leg, name);
	}
	
	// toString() 오버라이딩
	public String toString() {
		return super.name + "는 고양이입니다.";
	}
}

class Dog extends Animal {
	// 생성자
	public Dog() { }
	public Dog(int leg, String name) {
		super(leg, name);
	}
	
	// toString() 오버라이딩
	public String toString() {
		return super.name + "는 강아지입니다.";
	}
}

public class InheritanceQuiz02 {

	public static void main(String[] args) {
		Cat mimi = new Cat(5, "미미");
		Dog hoya = new Dog(3, "호야");
		
		System.out.println(mimi);
		System.out.println(hoya);
		
	}

}
