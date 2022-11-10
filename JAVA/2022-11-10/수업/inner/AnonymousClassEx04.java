package inner;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class AnonymousClassEx04 {

	public static void main(String[] args) {
		
		// ArrayList 생성
		ArrayList<String> hangul = new ArrayList<String>();
		hangul.add("돌");
		hangul.add("나비");
		hangul.add("하늘");
		hangul.add("바람");
		System.out.println("정렬 전 : " + hangul);
		
		System.out.println("\n<< Collections.sort() 정렬 >>");
		// [오름차순 정렬 1] - Collections.sort(); : index 자체가 변경됨
		Collections.sort(hangul);
		System.out.println("오름차순 정렬 후 : " + hangul);
		
		// cf) 내림차순 정렬 - Collections.sort(리스트, Collections.reverseOrder());
		Collections.sort(hangul, Collections.reverseOrder());
		System.out.println("내림차순 정렬 후 : " + hangul);
		
		
		System.out.println("\n<< List.sort() 정렬 >>");
		// [오름차순 정렬 2] - 리스트.sort(Compartor.naturalOrder());
		hangul.sort(Comparator.naturalOrder());
		System.out.println("오름차순 정렬 후 : " + hangul);
		
		// cf) 내림차순 정렬 - 리스트.sort(Comparator.reverseOrder());
		hangul.sort(Comparator.reverseOrder());
		System.out.println("내림차순 정렬 후 : " + hangul);
		
		System.out.println("\n<< Comparator 인터페이스 사용자 정의 >>");
		// [오름차순 정렬 3]
		// Comparator<String> 인터페이스를 구현 클래스 없이 객체 생성 -> 익명 클래스
		// 첫 번째 파라미터 > 두 번째 파라미터 : 차가 양수 -> 기준이 크다. 순서 교체
		// 첫 번째 파라미터 < 두 번째 파라미터 : 차가 음수 -> 기준이 작다. 순서 유지
		// 첫 번째 파라미터 == 두 번째 파라미터 :차가 0 -> 서로 같다. 순서 유지
		Comparator<String> comparator = new Comparator<String>() {
			@Override
			public int compare(String s1, String s2) {
				// 오름차순
				return s1.compareTo(s2);
				// 내림차순
//				return s2.compareTo(s1);
			}
		};
		hangul.sort(comparator);
		System.out.println("오름차순 정렬 후 : " + hangul);
		
		// cf) compareTo() method - 문자의 아스키코드 값의 차이를 반환
		System.out.println("A와 B 비교 : " + "A".compareTo("B"));
		System.out.println("B와 A 비교 : " + "B".compareTo("A"));
		System.out.println("A와 a 비교 : " + "A".compareTo("a"));
		// 내용이 비슷하면 길이 차이를 반환
		System.out.println("Hello와 Hell 비교 : " + "Hello".compareTo("Hell"));
		// 달라지는 시점의 문자의 아스키코드 값의 차이를 반환
		System.out.println("Hello와 Hi 비교 : " + "Hello".compareTo("Hi"));
	}
	
}
