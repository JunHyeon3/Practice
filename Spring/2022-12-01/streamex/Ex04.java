package streamex;

import java.util.Arrays;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Map;
import java.util.OptionalDouble;
import java.util.OptionalInt;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Ex04 {
	
	public static void main(String[] args) {
		
		// [최종 연산] max, min, average =======================================
		// - 리턴형은 모두 Optional타입 이다.
		// - Stream이 비어있을 경우, Optional Empty를 리턴한다.
		
		OptionalInt min = IntStream.of(1, 3, 5, 7, 9).min();
		System.out.println("최솟값 : " + min);
		
		OptionalInt max = IntStream.of().max();
		System.out.println("최댓값 : " + max);
		
		OptionalDouble average = IntStream.of().average();
		System.out.println("평균값 : " + average);
		// =====================================================================
		
		// [문제] 평균값을 변수에 저장하지 않고 바로 출력하기
		IntStream.of(1, 3, 5, 7, 9).average().ifPresent(System.out::println);
		
		// [문제] min()의 결과를 int형 변수에 저장하기
//		int minValue = IntStream.of(1, 3, 5, 7, 9).min().getAsInt();
		int minValue = IntStream.of(1, 3, 5, 7, 9).min().orElse(-1);
		System.out.println("최솟값 : " + minValue);
		
		// [최종 연산] =========================================================
		// sum, count
		// - 리턴형은 sum()은 int, count()는 long이다.
		// - Stream이 비어있을 경우, sum()과 count() 모두 0을 리턴한다.
		
		 int sum = IntStream.of(1, 3, 5, 7, 9).sum();
		 System.out.println("합 >> " + sum);
		 
		 Long count = IntStream.of(1, 3, 5, 7, 9).count();
		 System.out.println("개수 >> " + count);
		 
		 int sumEmpty = IntStream.of().sum();
		 System.out.println("빈 스트림의 합 >> " + sumEmpty);
		 
		 Long countEmpty = IntStream.of().count();
		 System.out.println("빈 스트림의 개수 >> " + countEmpty);
		 // =====================================================================
		 
		 // [최종 연산] Match ===================================================
		 // - anyMatch	: 하나의 요소라도 조건에 충족되면 true
		 // - allMatch	: 모든 요소가 조건에 충족되면 true
		 // - noneMatch	: 모든 요소가 조건에 충족되지 않는다면 true
		 // - T타입인 매개변수 1개와 boolean을 반환하는 Predicate<T>를 사용한다.
		 
		 List<String> names = Arrays.asList("홍길동", "박보검", "이미자");
		 
		 // anyMatch()
		 // 요소들 중 "이미자"인 요소 하나라도 "미"를 포함하고 있기 때문에 true
		 boolean anyMatch = names.stream().anyMatch(name -> name.contains("미"));
		 System.out.println("anyMatch >> " + anyMatch);
		 
		 // anyMatch()
		 // 요소들 중 "이미자"인 요소 하나만 "미"를 포함하고 있기 때문에 false
		 boolean allMatch = names.stream().allMatch(name -> name.contains("미"));
		 System.out.println("allMatch >> " + allMatch);
		 
		 // noneMatch()
		 // 요소들 중 "이미자"인 요소 하나가 "미"를 포함하고 있기 때문에 false
		 boolean noneMatch = names.stream().noneMatch(name -> name.contains("미"));
		 System.out.println("noneMatch >> " + noneMatch);
		 // =====================================================================
		 
		 // [최종 연산] collect ===================================================
		 // - collect() 메서드는 Stream의 데이터를 변형 등의 처리를하고 원하는 자료형으로 변환해준다.
		 // - collect() 메서드는 매개변수로 Collectors class를 필요로한다.
		 // - Collectors가 미리 작성된 기본적인 기능들을 제공해준다. 
		 
		 List<Student> student = Arrays.asList(new Student("하루", 25), new Student("마루", 22), new Student("노루", 25));
		 
		 // 1. toList : 작업 결과를 List 반환
		 List<String> nameList = student.stream()
				 // 여기서 t의 타입이 Student인 것을 추정할 수 있다.
				 //.map(t -> t.getName())
				 // 따라서, static 메서드가 아니지만 참조 변수를 생략하고 클래스명을 사용하여 메서드 참조를 할 수 있다.
				 .map(Student::getName)
				 .collect(Collectors.toList());
		 
		 System.out.println("<< List type : 이름 출력 >>");
		 nameList.forEach(System.out::println);
		 
		 // 2. joining : 작업 결과를 문자열로 이어줌
		 // 2-1. joining() 
		 //		: 결과를 공백 없이 이어줌
		 String strOne = student.stream().map(Student::getName).collect(Collectors.joining());
		 
		 System.out.println("<< 문자열 이어줌 1) 이름 사이에 공백없이 출력 >>");
		 System.out.println("strOne >> " + strOne);
		 
		 // 2-2. joining("구분자") 
		 //		: 결과 사이에 입력한 구분자 추가하여 이어줌
		 String strTwo = student.stream().map(Student::getName).collect(Collectors.joining(" - "));
		 
		 System.out.println("<< 문자열 이어줌 2) 이름 사이에 구분자 추가하여 출력 >>");
		 System.out.println("strTwo >> " + strTwo);
		 
		 // 2-3. joining("구분자", "시작문자", "끝문자") 
		 // 	: 결과 사이에는 구분자, 처음에는 시작문자, 마지막에는 끝 문자를 추가하여 이어줌
		 String strThree = student.stream().map(Student::getName).collect(Collectors.joining("-", "[", "]"));
		 
		 System.out.println("<< 문자열 이어줌 3) 이름 사이에 구분자와 시작과 끝에 문자 추가하여 출력 >>");
		 System.out.println("strThree >> " + strThree);
		 
		 // 3. averagingInt : 작업 결과 평균
		 double averageAge = student.stream().collect(Collectors.averagingInt(Student::getAge));
		 System.out.println("평균 나이 >> " + averageAge);
		 
		 // 4. summingInt : 작업 결과 합
		 Integer sumAge = student.stream().collect(Collectors.summingInt(Student::getAge));
		 
		 System.out.println("나이 합 >> " + sumAge);
		 
		 // 5. summarizingInt : 요약, 모든 통계 값
		 IntSummaryStatistics summary = student.stream().collect(Collectors.summarizingInt(Student::getAge));
		 
		 System.out.println("summary >> " + summary);
		 System.out.println("개수 >> " + summary.getCount());
		 System.out.println("총합 >> " + summary.getSum());
		 System.out.println("최소 >> " + summary.getMin());
		 System.out.println("최대 >> " + summary.getMax());
		 System.out.println("평균 >> " + summary.getAverage());
		 
		 // 6. groupingBy : 그룹화
		 Map<Integer, List<Student>> group = student.stream().collect(Collectors.groupingBy(Student::getAge));
		 
		 System.out.println("group >> " + group);
		 System.out.println("key 추출 >> " + group.keySet());
		 System.out.println("value 추출 >> " + group.values());
		 // =======================================================================
		 
		 // [과제] group을 가지고 이름만 추출
//		 System.out.println("[22살 그룹]");
//		 group.get(22).forEach(t -> System.out.println(t.getName()));
//		 System.out.println("[25살 그룹]");
//		 group.get(25).forEach(t -> System.out.println(t.getName()));
		 
//		 for(int i: group.keySet()) {
//			 System.out.printf("[%d살 그룹]\n", i);
//			 group.get(i).forEach(t -> System.out.println(t.getName()));
//		 }
		 
		 group.keySet().forEach(i -> {
			 System.out.printf("[%d살 그룹]\n", i);
			 group.get(i).forEach(s -> System.out.println(s.getName())); 
		 });
		 
	}
	
}
