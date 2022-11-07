package set;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetEx01 {

	public static void main(String[] args) {
		
		/*
		 * [컬렉션 클래스 HashSet] : 일반적으로 저장/검색 속도가 빠르다.
		 * - 요소를 추가하기 전에 저장된 요소 값과 비교
		 * - 요소를 hashCode()를 사용하여 해쉬 값으로 변환
		 * 		-> equals()로 동일한 해쉬 값이 있는지 비교
		 * - 그래서 hashCode()와 equals() 메서드를 상황에 맞춰 오버라이딩 해야함
		 * - cf) String 클래스에서는 이미 오버라이딩 되어 있음
		 */
		
		HashSet<String> hashSet = new HashSet<String>();
		
		// [저장된 요소 존재 여부]
		System.out.println("비어 있나요? " + hashSet.isEmpty());
		
		// [요소 추가]
		hashSet.add("하나");
		hashSet.add("둘");
		hashSet.add("셋");
		hashSet.add("하나");
		
		// [특정 위치에 저장된 요소 출력]
		// Error! 순서가 없으므로 인덱스를 사용하지 않음
//		System.out.println("인덱스 0 >> " + hashSet.get(0));
		
		// [저장된 요소 개수]
		System.out.println("저장된 요소 개수 >> " + hashSet.size());
		
		// [객체 포함(존재) 여부)
		System.out.println("둘 있나요? " + hashSet.contains("둘"));
		System.out.println("넷 있나요? " + hashSet.contains("넷"));
		
		// [저장된 요소 전부 출력 방법1] - toArray() 메서드 사용
		System.out.println("\n<< 전체 요소 출력 1 >> ");
		for(Object arr: hashSet.toArray())
			System.out.println(arr);
		
		// [저장된 요소 전부 출력 방법2] - String 자료형 사용
		System.out.println("\n<< 전체 요소 출력 2 >> ");
		for(String arr: hashSet)
			System.out.println(arr);
		
		// [저장된 요소 전부 출력 방법3] - iterator() 메서드 사용
		System.out.println("\n<< 전체 요소 출력 3 >> ");
		Iterator<String> iter = hashSet.iterator();
		while(iter.hasNext())
			System.out.println(iter.next());
		
		// [요소 추가]
		System.out.println("\n둘 요소 추가 >> " + hashSet.add("둘"));
		System.out.println("요소 추가 후 길이 >> " + hashSet.size());
		
		// [요소의 해쉬 값 보기] - hashCode() 메서드 사용
		System.out.println("\n<< 요소의 해쉬값 >>");
		
		iter = hashSet.iterator();
		String iterValue = "";
		
		while(iter.hasNext()) {
			iterValue = iter.next();
			System.out.println(iterValue + "의 해쉬 값 >> " + iterValue.hashCode());
		}
//		for(String arr: hashSet)
//			System.out.println(arr + "의 해쉬 값 >> " +arr.hashCode());
	}

}
