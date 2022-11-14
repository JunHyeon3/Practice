package functionalinterface;

import java.util.function.Consumer;

public class ConsumerEX01 {

	public static void main(String[] args) {
		// Consumer<T> ================================================================
		// T는 매개변수의 type
		// accept(T t) 메서드 : 매개변수 1개, 반환값 없음
		// lambda : (parameter) -> expression
		// ============================================================================
		
		Consumer<String> consumer = (str) -> System.out.println(str);
		consumer.accept("오늘도 즐거운 하루");
		
		// [문제] - 입력한 문자열의 공백기준 2번째 문자열만 출력하기
		Consumer<String> consumer2 = (str) -> System.out.println(str.split(" ")[1]);
		consumer2.accept("오늘도 즐거운 하루");
	}
	
	// ex)
	void show(String str) {
		System.out.println(str);
	}

}
