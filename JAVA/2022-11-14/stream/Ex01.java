/*
 * [Stream] 스트림
 * - JDK 1.8 (Java 8)부터 지원 
 * - 람다식과 함께 컬렉션에 저장된 데이터 처리를 간결하게 표현
 * - 내부 반복자를 사용하기 때문에 병렬처리가 쉬움 
 * 
 * [특징]
 * - 복사본을 사용 : 원본의 데이터를 변경하지 않음
 * - 일회용 : 한번 사용이 끝나면 재사용이 불가능함
 * 			: 닫힌 Stream을 다시 사용하면, Exception이 발생함
 * - 내부 반복자를 통해서 처리함
 * 
 * [사용 단계]
 * Stream 객체 생성 -> 중간 연산(가공) -> 최종 연산(결과)
 */

package stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class Ex01 {

	public static void main(String[] args) {
		
		List<String> list = Arrays.asList("하나", "둘", "셋");
		
		// 1. Stream 객체 생성
		Stream<String> listStream = list.stream();
		
		// 2. 중간 연산
		listStream.forEach(System.out::println);
		
		

	}

}
