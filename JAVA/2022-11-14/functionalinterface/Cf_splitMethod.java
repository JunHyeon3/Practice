package functionalinterface;

import java.util.Arrays;

public class Cf_splitMethod {

	public static void main(String[] args) {
		// cf) 문자열.split()
		String[] arr = "문자열 나누기 연습 중".split(" ");
		System.out.println(arr);
		System.out.println(arr[1]);
		System.out.println(Arrays.toString(arr));
		
		// 문자열을 공백 기준으로 2개로 나누기
		String[] arr2 = "문자열 나누기 연습 중".split(" ", 2);
		System.out.println(Arrays.toString(arr2));
		
		// 문자열을 공백 기준으로 10개로 나누기
		// 최대로 나눌 수 있는 만큼만 나눔
		String[] arr3 = "문자열 나누기 연습 중".split(" ", 10);
		System.out.println(Arrays.toString(arr3));
	}

}
