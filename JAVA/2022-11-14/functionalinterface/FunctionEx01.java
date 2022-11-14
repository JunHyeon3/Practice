package functionalinterface;

import java.util.function.Function;

public class FunctionEx01 {

	public static void main(String[] args) {
		// Function<T, R> ================================================================
		// T는 매개변수의 type, R은 반환형의 type
		// apply(T t) 메서드 : 매개변수 1개, 반환값 있음
		// lambda : (parameter) -> expression
		// ===============================================================================
		
		// [람다식 1] 정수 1개 받아서, 문자열 리턴
		Function<Integer, String> functionOne = (num) -> "매개 변수 값은 " + num + "입니다."; 
		System.out.println("apply() 메서드 : 문자열 >> " + functionOne.apply(2));
		
		// [람다식 2] 정수 1개 받아서, 정수를 리턴
		Function<Integer, Integer> power = (num) -> num * num; 
		System.out.println("apply() 메서드 : 제곱 >> " + power.apply(2));
		
		Function<Integer, Integer> increment = (num) -> num + 1; 
		System.out.println("apply() 메서드 : 1증가 >> " + increment.apply(2));
		
		// [andThen() 메서드] ============================================================
		// 기준이 되는 apply() 먼저 실행 후, andThen() 매개변수의 apply() 실행
		// ===============================================================================
		
		// 7을 제곱 후, 1 증가
		System.out.println(power.andThen(increment).apply(7));

		// 7을 1 증가 후, 제곱
		System.out.println(increment.andThen(power).apply(7));
		
		// [compose() 메서드] ============================================================
		// andThen과 반대로 매개변수의 apply() 먼저 실행 후, 기준이 되는 apply() 실행
		// ===============================================================================
		
		// 7을 1 증가 후, 제곱 : 7을 제곱하기 전에 1증가 (먼저 하겠다.)
		System.out.println(power.compose(increment).apply(7));
		
		// 7을 제곱 후, 1 증가 : 1증가 하기 전에 7을 제곱 (먼저 하겠다.)
		System.out.println(increment.compose(power).apply(7));
		
		// [identity() 메서드] ===========================================================
		// ===============================================================================
		Function<Integer, Integer> identityOne = Function.identity();
		Function<Integer, Integer> identityTwo = Function.identity();
		Function<Integer, Integer> identityThree = Function.identity();
		
		System.out.println(identityOne);
		System.out.println(identityTwo);
		System.out.println(identityThree);
		
		Function<Integer, Integer> lambdaOne = t -> t;
		Function<Integer, Integer> lambdaTwo = t -> t;
		Function<Integer, Integer> lambdaThree = t -> t;
		
		System.out.println(lambdaOne);
		System.out.println(lambdaTwo);
		System.out.println(lambdaThree);
	}

}
