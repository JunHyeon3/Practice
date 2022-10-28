/*
 * [오버라이딩 시 주의사항]
 * 부모 메서드의 접근권한 <= 오버라이딩된 메서드의 접근권한
 * ex) 	부모가 public  - 자식이 public  (o)
 * 		부모가 default - 자식이 public  (o)
 * 		부모가 public  - 자식이 default (x)
 * 
 */
class Parent {
	void clean() {
		System.out.println("부모 >> 집 청소를 합니다.");
	}
}

class Child extends Parent {
	@Override
	void clean() {
		System.out.println("자식 >> 내 방을 청소 합니다.");
	}
}

public class Overriding {

	public static void main(String[] args) {

		Child child = new Child();
		child.clean();

	}

}
