package list;

import java.util.Arrays;

public class ArrayEx01 {

	public static void main(String[] args) {

		// [길이가 3인 배열 생성]
		String[] str = new String[3];
		
		str[0] = "one";
		str[1] = "two";
		str[2] = "three";
		// 실행시 Error!
//		str[3] = "four";
		
		for(String s: str)
			System.out.println(s);
		
		// [길이가 4인 배열 생성] 
		// Arrays는 배열과 관련된 다양한 기능을 제공함
		// copyOf(기존 배열 주소, 늘릴 배열 길이) : 기존의 배열을 복사해서 길이를 늘림
		String[] copy = Arrays.copyOf(str, 4);
		
		copy[3] = "four";
		
		for(String s: copy)
			System.out.println(s);
	}

}
