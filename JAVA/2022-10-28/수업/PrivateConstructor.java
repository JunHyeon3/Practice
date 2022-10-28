/*
 * [private constructor]
 * 생성자의 접근권한이 private일 경우,
 * 상속이 제한되고 객체 생성 또한 제한된다.
 * 
 * [final class]
 * class에 final 예약어를 사용할 경우, 상속만 제한된다.
 */

class Fruit {
	
//	private Fruit() { }
	
}

class Banana extends Fruit {
	
}

public class PrivateConstructor {
	public static void main(String[] args) {
		Fruit fruit = new Fruit();
	}
}
