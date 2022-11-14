package method.reference.expression;

import java.util.function.Consumer;

public class Ex02 {

	public static void main(String[] args) {

		// println() 메서드 : 매개변수가 1개, 반환 값 없음
		System.out.println("println() 메서드로 출력하기");

		// Consumer : 매개변수 1개, 반환 값 없음
		Consumer<String> consumer = System.out::println;
		consumer.accept("Consumer로 참조하여 출력하기");
	}

}
