package streamex;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Quiz03 {

	public static void main(String[] args) {

		List<String> language = Arrays.asList("Pythod", "C", "Java", "Java Script");
		
		// [문제]
		// stream을 사용하여 문자열 길이를 기준으로 정렬
		// 최종 결과물은 리스트가 되도록 하고 출력은 별도로 하시오.
		
		// 1. Stream 생성하고, pipeline 코드 작성
		List<String> group = language.stream().sorted(Comparator.comparingInt(String::length)).collect(Collectors.toList());
		
		// 2. 출력
		group.forEach(System.out::println);
	}

}
