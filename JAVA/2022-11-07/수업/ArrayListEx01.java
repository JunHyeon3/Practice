package list;

import java.util.ArrayList;
import java.util.Iterator;

public class ArrayListEx01 {
	public static void main(String[] args) {
		// [컬렉션 클래스 ArrayList<E>]
		
		// [리스트 생성]
		ArrayList<String> arrayList = new ArrayList<String>(); 
		
		// [저장된 요소 확인]
		System.out.println("비어있나요? " + arrayList.isEmpty());
		
		// [요소 추가]
		// 기본설정은 길이가 10이지만, 이후에 요소가 추가될 때마다 내부적으로 기존의 배열을 복사하여, 
		// 길이가 증가된 새로운 배열을 생성하므로 비효율적이다.
		arrayList.add("하나");
		arrayList.add("둘");
		arrayList.add("셋");
		arrayList.add("하나"); 
		
		// [저장된 요소 확인]
		System.out.println("비어있나요? " + arrayList.isEmpty());
		
		// [특정 위치에 저장된 요소 출력]
		System.out.println("인덱스 0에 저장된 요소 >> " + arrayList.get(0));
		
		// [저장된 요소 개수]
		System.out.println("저장된 요소 개수 >> " + arrayList.size());
		
		// [객체 포함 여부 확인]
		System.out.println("둘이 있나요? " + arrayList.contains("둘"));
		System.out.println("넷이 있나요? " + arrayList.contains("넷"));
		
		// [저장된 요소 전부 출력 방법1] - get() 메서드 사용
		System.out.println("\n<< 전체 요소 출력 1 >> ");
		for(int i=0; i<arrayList.size(); i++)
			System.out.println(arrayList.get(i));
		
		// [저장된 요소 전부 출력 방법2] - toArray() 메서드 사용
		// 어떤 타입의 배열일지 모르므로 자료형은 Object
		System.out.println("\n<< 전체 요소 출력 2 >> ");
		for(Object arr: arrayList.toArray())
			System.out.println(arr);
		
		// [저장된 요소 전부 출력 방법3] 
		System.out.println("\n<< 전체 요소 출력 3 >> ");
		for(String arr: arrayList)
			System.out.println(arr);
		
		// [저장된 요소 전부 출력 방법4] - iterator() 메서드 사용
		// iterator() 메서드의 반환값을 가지고 다형성으로 객체를 생성
		// hasNext()는 index와 size를 비교하여 true/false를 반환
		// next()는 현재 index 값을 반환하고 index를 1증가 시킴
		System.out.println("\n<< 전체 요소 출력 4 >> ");
		Iterator<String> iter = arrayList.iterator();
		while(iter.hasNext())
			System.out.println(iter.next());
		
		// [특정 요소 변경]
		System.out.println("\n<< 셋을 여섯으로 변경 >>");
		arrayList.set(2, "여섯");
		 
		// iterator()는 일회용이므로 다시 만들어야 사용할 수 있음
		iter = arrayList.iterator();
		while(iter.hasNext())
			System.out.println(iter.next());
		
		// [특정 요소 삭제]
		System.out.println("\n<< 요소 둘 삭제 >>");
		arrayList.remove("둘");
		
		System.out.println("요소 삭제 후 요소 개수 >> " + arrayList.size());

		for(Object arr: arrayList.toArray())
			System.out.println(arr);
	}
}
