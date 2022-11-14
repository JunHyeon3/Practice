package method.reference.expression;

import java.util.function.Function;

interface Greeting {
	// abstract method
	int say(String str);
}

public class Quiz01 {

	public static void main(String[] args) {
		
		// [문제1] 익명 클래스 =========================================================
		Greeting anonymous = new Greeting() {
			@Override
			public int say(String str) {
				return str.length();
			}
		};
		System.out.print("[1. 익명 클래스] 문자열 길이 >> ");
		System.out.println(anonymous.say("안녕하세요"));
		
		// [문제2] 람다식 : 참조 변수 저장 =============================================
		Greeting lambda = str -> str.length();
		System.out.print("[2. 람다식] 문자열 길이 >> ");
		System.out.println(lambda.say("저의 이름은"));

		// [문제3] 제네릭 함수형 인터페이스 : 람다식 ===================================
		Function<String, Integer> functionOne = str -> str.length();
		System.out.print("[3. 제네릭 함수형 인터페이스 : 람다식] 문자열 길이 >> ");
		System.out.println(functionOne.apply("홍길동"));
		
		// [문제4] 제네릭 함수형 인터페이스 : 메서드 참조 ==============================
		// String class는 객체생성을 하지 않아도 메서드 참조를 할 수 있다.
		Function<String, Integer> functionTwo = String::length;
		System.out.print("[4. 제네릭 함수형 인터페이스 : 메서드 참조] 문자열 길이 >> ");
		System.out.println(functionTwo.apply("입니다."));
	}

}
