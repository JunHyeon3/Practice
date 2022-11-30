package streamex;

import java.util.Arrays;
import java.util.stream.Stream;

public class Ex02 {

	public static void main(String[] args) {

		// 1-1. 1차원 배열 생성
		String[] arr = {"하나", "둘", "셋", "넷"};
		
		// 1-2. stream 생성
		Stream<String> arrStream = Arrays.stream(arr);
		
		// 1-3. stream 오름차순 정렬 후 출력
		System.out.println("<< stream 오름차순 정렬 후 출력 >>");
		arrStream.sorted().forEach(System.out::println);
		
		// 1-4 배열 arr 출력
		// stream은 복사본을 사용하기 때문에, 원본인 arr에 영향을 주지 않는다.
		System.out.println("<< 배열 arr 출력 >>");
		for(String str: arr)
			System.out.println(str);
	}

}
