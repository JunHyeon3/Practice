package generic;

class Thing {
	String id;
	String name;
	
	public Thing() { }
	public Thing(String id, String name) {
		this.id = id;
		this.name = name;
	}
}

class Tv extends Thing {
	@Override
	public String toString() {
		return "나는 새로운 TV이다!";
	}
}

class Pen extends Thing {
	@Override
	public String toString() {
		return "나는 평생 사용 가능한 Pen이다!";
	}
}

class Box<T> {
	T item;
	
	public void store(T item) {
		this.item = item;
	}
	public T out() {
		return this.item;
	}
}

public class Ex04 {
	// 제너릭 메서드
	// 이미 Box가 제너릭 클래스 이기 때문에 T extends Thing은 문법 에러
	// Thing 포함 밑에 있는 모든 클래스 제한은 ? extends Thing을 사용한다.
	public static void openBox(Box<? extends Thing> box) {
		System.out.println(box.toString());
		// 다형성
		Thing thing = box.out();
//		System.out.println(thing.toString());
	}
	
	public static void main(String[] args) {
		Box<Tv> one = new Box<Tv>();
		one.store(new Tv());
		openBox(one);
		
		Box<Pen> two = new Box<Pen>();
		two.store(new Pen());
		openBox(two);
		
		// Box class에는 타입 제약이 없기 때문에 String 사용이 가능함
		Box<String> three = new Box<String>();
		three.store(new String("hello"));
		// 하지만 openBox() 메서드의 매개변수에는 제약이 있으므로 사용할 수 없다.
//		openBox(two);
	}

}
