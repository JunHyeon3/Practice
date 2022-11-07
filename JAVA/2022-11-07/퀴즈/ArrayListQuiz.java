/*
 * 1. 저장된 이름 전체 출력
 * 2. 저장된 전체 요소 개수
 * 3. 인덱스 1의 이름
 * 4. 35세 박보검 포함 여부
 * 	  박보검 있나요? >> 
 * 5. 52세 이미자 포함 여부
 * 	  이미자 확인 되나요? >> 
 * 6. 홍길동 이름을 화이팅으로 변경
 */
package list;

import java.util.ArrayList;
import java.util.Iterator;

class Person {
	String name;
	int age;
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}

public class ArrayListQuiz {
	public static void main(String[] args) {
		Person hong = new Person("홍길동", 25);
		Person park = new Person("박보검", 35);
		
		// ArrayList 생성
		ArrayList<Person> array = new ArrayList<Person>();
		
		// 요소 추가
		array.add(hong);
		array.add(park);
		array.add(new Person("이미자", 52));
		
		System.out.println("<< 저장된 이름 전체 출력 >>");
		for(Person p:array)
			System.out.println(p.getName());
		
		System.out.println("\n<< 저장된 전체 요소 개수 >>");
		System.out.println(array.size());
		
		System.out.println("\n<< 인덱스 1의 이름 >>");
		System.out.println(array.get(1).getName());
		
		System.out.println("\n<< 35세 박보검 포함 여부 >>");
		System.out.print("박보검 있나요? >> " + array.contains(park));
		
		System.out.println("\n\n<< 52세 이미자 포함 여부 >>");
		System.out.print("이미자 확인 되나요? >> " + array.contains(new Person("이미자", 52)));
		
		System.out.println("\n\n<< 홍길동 이름을 화이팅으로 변경 >>");
//		hong.setName("화이팅");
		array.set(0, new Person("화이팅", 25));
		Iterator<Person> iter = array.iterator(); 
		while(iter.hasNext())
			System.out.println(iter.next().getName());
		
		
		
	}
}
