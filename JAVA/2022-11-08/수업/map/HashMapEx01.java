/*
 * key는 value를 찾기 위한 고유한 id 역할을 한다.
 * 
 */
package map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

public class HashMapEx01 {

	public static void main(String[] args) {

		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		
		// [요소 추가]
		hashMap.put("하나", 1);
		hashMap.put("둘", 2);
		hashMap.put("셋", 3);
		hashMap.put("하나", 1);
		hashMap.put("일", 1);
		
		// [요소 개수 출력]
		// key가 같은 값은 중복을 허용하지 않음
		// value가 같은 값은 중복이 허용됨
		System.out.println("요소 개수 >> " + hashMap.size());
		
		// [출력] - 저장된 key들의 집합 출력
		System.out.println("\n<< 저장된 모든 요소의 key 출력 >>");
		System.out.println(hashMap.keySet());
		
		// [출력] - 특정 key의 value 출력
		System.out.println("\nkey가 '하나'인 요소의 value >> " + hashMap.get("하나"));
		System.out.println("key가 '셋'인 요소의 value >> " + hashMap.get("셋"));
		System.out.println("key가 '넷'인 요소의 value >> " + hashMap.get("넷"));
		
		// [출력] - 모든 key와 value 출력
		System.out.println("\n<< 저장된 모든 요소의 키 출력 >>");
		// key의 자료형을 사용
		for(String obj: hashMap.keySet())
			System.out.printf("key : %S, value : %d\n", obj, hashMap.get(obj));
		
		// [요소 추가] - key는 동일하고 value가 다른 요소를 추가하면, 기존의 value가 덮어써진다.
		hashMap.put("둘", 222);
		// [출력] - entrySet() 메서드를 사용하여 모든 key와 value 출력
		System.out.println("\n<< key : 둘, value : 222 요소 추가 후 >>");
		System.out.println("<< entrySet()으로 모든 key, value 출력 >>");
		for(Entry<String, Integer> entry: hashMap.entrySet()) 
			System.out.printf("key : %S, value : %d\n", entry.getKey(), entry.getValue());
		
		// [수정] - key로 접근하여 값 수정
		hashMap.replace("하나", 100);
		// [출력] - iterator() 메서드를 사용하여 출력
		System.out.println("\n<< 수정 후, 모든 key, value 출력 >>");
		// entrySet()을 이용한 iterator() 사용법
		Iterator<Entry<String, Integer>> iter = hashMap.entrySet().iterator();
		while(iter.hasNext()) {
			Entry<String, Integer> entry = iter.next();
			System.out.printf("key : %S, value : %d\n", entry.getKey(), entry.getValue());
		}
		System.out.println();
		// keySet()을 이용한 iterator() 사용법
		Iterator<String> keys = hashMap.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			System.out.printf("key : %S, value : %d\n", key, hashMap.get(key));
		}
		
		// [삭제] - key로 접근하여 특정 요소 삭제
		hashMap.remove("하나");
		System.out.println("\n<< 키가 '하나'인 요소 값 삭제 후 >>");
		for(String key: hashMap.keySet())
			System.out.printf("key : %S, value : %d\n", key, hashMap.get(key));
	}

}
