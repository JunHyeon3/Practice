package inner;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
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
	public int getAge() {
		return age;
	}

	public void showInfo() {
		System.out.printf("이름 : %s, 나이 : %d\n", name, age);
	}
}

public class AnonymousClassEx05 {

	public static void main(String[] args) {
		
		HashSet<Person> hashSet = new HashSet<Person>();
		
		hashSet.add(new Person("홍길동", 25));
		hashSet.add(new Person("박보검", 35));
		hashSet.add(new Person("이미자", 21));
		
		// [문제] 이름 순서로 정렬
		// [문제 1-1] Comparator 인터페이스 구현
		Comparator<Person> comparator = new Comparator<Person>() {
			@Override
			public int compare(Person p1, Person p2) {
				return p1.getName().compareTo(p2.getName());
			}
		};
		
		// [문제 1-2] ArrayList 변환
		ArrayList<Person> arrayList = new ArrayList<Person>(hashSet);
		
		System.out.println("<< 정렬 전 >>");
		Iterator<Person> iter = arrayList.iterator();
		while(iter.hasNext())
			iter.next().showInfo();
		
		// [문제 1-3] 오름차순 정렬
		arrayList.sort(comparator);
		
		System.out.println("\n<< 오름차순 정렬 후 >>");
		iter = arrayList.iterator();
		while(iter.hasNext())
			iter.next().showInfo();
		
		
	}

}
