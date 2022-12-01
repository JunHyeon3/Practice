/*
 * [중간 연산, 최종 연산]
 * -Stream은 중간 연산(중간 처리)과 최종 연산(최종 처리)를 할 수 있다.
 * - 중간 연산 : 필터, 변환, 정렬, 중복 제거 등
 * 	   	       : 중간 연산의 리턴 type이 stream이기 때문에 연달아 연산할 수 있다.
 * 
 * - 최종 연산 : 합, 평균, 최대, 최소, 개수, 반복 등
 * 			   : 최종 연산은 리턴 type이 stream이 아니기 때문에 중간 연산사이에 최종 연산이 올 수 없다.
 * 
 * [Reduction 리덕션]
 * - 대량의 데이터를 가공해서 축소하는 것
 * - 합, 평균, 개수 등 집계하는 것
 * - 중간 연산과 최종 연산이 있음
 * - stream은 중간 연산과 최종 연산을 파이프라인으로 해결
 * - 파이프라인(pipeline) 이란? 스트림을 파이프처럼 이어 놓은 것
 * - 중간 연산의 리턴형이 stream
 */
package streamex;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.IntStream;

public class Ex03 {

	public static void main(String[] args) {
		
		String[] arr = {"하루", "하늘", "타조", "나루"};
		List<String> list = Arrays.asList(arr);

		// [중간 연산] filter ==========================================================
		// filter를 사용하여 "루"가 포함된 문자열 추출하기
		// filter()는 T타입인 매개변수가 1개이고 boolean을 반환하는 Predicate<T>를 사용한다.
		
		System.out.println("<< \"루\"가 포함된 문자열 추출>>");
		list.stream().filter(t -> t.contains("루")).forEach(System.out::println);;
		// =============================================================================
		
		// [중간 연산] map =============================================================
		// map을 사용하여 요소들을 변환
		// map()은 T타입인 매개변수가 1개이고 R타입을 반환하는 Function<T, R>를 사용한다.
		
		System.out.println("<< 요소에 \"야~\" 추가 >>");
		list.stream().map(t -> t.concat("야~")).forEach(System.out::println);;
		// =============================================================================
		
		// [중간 연산] peek ============================================================
		// peek을 사용하여 요소에 변화없이 특정 연산 수행
		// 중간 연산중 출력을 하고 싶을 때 사용한다.
		// peek()은 T타입인 매개변수가 1개이고 반환형이 없는 Consumer<T>를 사용한다.
		
		System.out.println("<< 요소에 변화 없이 특정 연산 수행 >>");
		int sum = IntStream.of(1, 3, 5, 7, 9).peek(System.out::println).sum();
		System.out.println("합 >> " + sum);
		// =============================================================================
		
		// [중간 연산] distinct ========================================================
		// distinct를 사용하여 중복 제거
		
		System.out.println("<< 중복 제거 >>");
		IntStream.of(1, 3, 1, 3, 5).distinct().forEach(System.out::println);
		// =============================================================================
		
		// [중간 연산] mapTo타입() =====================================================
		// 일반적인 Stream 객체 -> 원시 객체
		// mapToObj()는 int형인 매개변수가 1개이고, R타입을 반환하는 IntFunction<R>을 사용한다.
		
		System.out.println("<< MapToObject >>");
		IntStream.range(1, 5).mapToObj(value -> "숫자 : " + value).forEach(System.out::println);
		
		// 원시 객체 -> 일반적인 Stream 객체 
		// =============================================================================
		
		// [중간 연산] sorted ==========================================================
		// sorted를 사용하여 요소들을 정렬 (기본이 오름차순)
		
		System.out.println("<< 오름차순 정렬 >>");
		list.stream().sorted().forEach(System.out::println);;
		
		System.out.println("<< 내림차순 정렬 >>");
//		list.stream().sorted(Collections.reverseOrder()).forEach(System.out::println);;
		list.stream().sorted(Comparator.reverseOrder()).forEach(System.out::println);;
		// =============================================================================
		
	}

}
