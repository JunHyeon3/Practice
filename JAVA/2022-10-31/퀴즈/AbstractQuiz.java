package abstractexample;

abstract class Animal {
	String name;
	
	public Animal() {
		this("미입력");
	}
	public Animal(String name) {
		this.name = name;
	}
	
	public abstract void play();
}

class Cat extends Animal {
	public Cat(String name) {
		super(name);
	}
	
	@Override
	public void play() {
		System.out.println(super.name + "는 낚싯대 놀이 중입니다.");
	}
}

class Dog extends Animal {
	public Dog(String name) {
		super(name);
	}
	
	@Override
	public void play() {
		System.out.println(super.name + "는 터그 놀이 중입니다.");
	}	
}

public class AbstractQuiz {

	public static void main(String[] args) {
		Dog roy = new Dog("미미");
		Cat bear = new Cat("베어");
		
		// 출력 : 로이는 터그 놀이 중입니다.
		animalPlay(roy);
		// 출력 : 베어는 낚싯대 놀이 중입니다.
		animalPlay(bear);
	}

	public static void animalPlay(Animal animal) {
		animal.play();
	}
}
