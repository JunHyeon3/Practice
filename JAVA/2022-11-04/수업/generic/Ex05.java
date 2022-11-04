package generic;

class Parent<T> {
	T item;
	
	public Parent() { }	
	public Parent(T t) {
		this.item = t;
	}	
}

// 제너릭 클래스인 부모를 상속하면, 자식에도 제너릭 타입을 명시해줘야 함
class Child<T> extends Parent<T> {
	// 제너릭 메서드는 원래 반환형 앞에 제너릭 타입을 명시하지만
	// 제너릭 클래스와 동일한 제너릭 타입을 사용할거면 명시하지 않음
	public void showType(T t) {
		System.out.println("Type >> " + t);
	}
}

public class Ex05 {

	public static void main(String[] args) {
		Child<String> c = new Child<String>();
		// 둘다 동일함
//		c.showType("hello");
		c.showType(new String("hello"));
	}

}
