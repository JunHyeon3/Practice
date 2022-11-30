/*
 * lamda expression(람다식) -> SAM(Single Abstract Method: functional interface, 함수형 인터페이스)
 * -> method reference expression(메서드 참조 표현식) - 이중 콜론 연산자 :: 사용 -> stream(스트림)
 * 
 * [method reference expression]
 * 이중 콜론 연산자 ::
 * 문법
 * 1) 인스턴스명::메서드명
 * 2) 인스턴스명::new		-> constructor
 * 3) 클래스명::메서드명	-> static method
 * 
 * [stream]
 * 생성 -> 가공 -> 결과
 * 
 * [특징]
 * - 원본의 데이터를 변경하지 않는다. (복사본 사용)
 * - 한번 사용이 끝나면 재사용이 불가능한 일회용이다.
 * - 내부 반복자를 사용하여 내부 반복으로 작업을 처리한다.
 */
package streamex;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;

public class Ex01 {

	public static void main(String[] args) {
		
		// 1-1. 1차원 배열 생성 ===========================================
		String[] arr = {"하나", "둘", "셋", "넷"};
		
		// 1-2. 정렬 : 오름차순
		Arrays.sort(arr);
		
		// 1-3. 1차원 배열 출력
		System.out.println("<< [1차원 배열 출력] : 오름차순 정렬 >>");
		for(String str: arr)
			System.out.println(str);
		// ================================================================
		
		// 2-1. 1차원 배열 -> List 변환 ===================================
		List<String> list = Arrays.asList(arr);
		
		// 2-2. 정렬 : 내림차순
		list.sort(Comparator.reverseOrder());
		
		// 2-3. List 출력
		System.out.println("\n<< [List 출력] : 내림차순 정렬 >>");
		for(String str: list)
			System.out.println(str);
		// ================================================================

		// 3-1. 1차원 배열 -> stream 생성 =================================
		Stream<String> strStream = Arrays.stream(arr);
		
		// 3-2. 정렬 
//		Stream<String> sortedStream = strStream.sorted();
		
		// 3-3. 출력
		System.out.println("\n<< [stream 출력] : 오름차순 정렬 >>");
		// Consumer interface를 람다식으로 구현
//		sortedStream.forEach(str -> System.out.println(str));
		// 람다식을 메서드 참조를 사용하여 구현
//		sortedStream.forEach(System.out::println);		
		
		// 3-4. 3-2와 3-3을 하나로 합치기
		strStream.sorted().forEach(System.out::println);		

		// [문제] - 내림차순으로 정렬 후 출력
		System.out.println("\n<< [stream 출력] : 내림차순 정렬 >>");
		// stream이 어차피 일회용이기 때문에 생성도 합쳐서 쓸 수 있다.
		list.stream().sorted(Comparator.reverseOrder()).forEach(System.out::println);
		// ================================================================
	}

}
