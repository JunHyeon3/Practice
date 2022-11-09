package set;

import java.util.HashSet;
import java.util.Iterator;

class Person {
	String name;
	int age;
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	// [setter/getter 추가]
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
	
	// 오버라이딩 추가 - hashCode()
	@Override
	public int hashCode() {
		return (this.name + this.age).hashCode();
	}
	
	// 오버라이딩 추가 - equals()
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Person) {
			Person p = (Person)obj;
			return name.equals(p.getName()) && (age == (p.getAge()));
		}
		else {
			return false;
		}
	}
}

public class HashSetQuiz {
	public static void main(String[] args) {
		Person hong = new Person("홍길동", 25);
		Person park = new Person("박보검", 35);
		
		HashSet<Person> hashSet = new HashSet<Person>();
		
		hashSet.add(hong);
		hashSet.add(park);
		hashSet.add(new Person("이미자", 52));
		
		// [전체 요소 출력]
		System.out.println("<< 전체 요소 출력 >> ");
		System.out.println("== iterator() 사용 ==");
		Iterator<Person> iter = hashSet.iterator(); 
		while(iter.hasNext())
			System.out.println(iter.next().getName());
		
		// [새 요소 추가 : 이미자]
		hashSet.add(new Person("이미자", 52));
		
		// [새 요소 추가 후 전체 요소 출력]
		System.out.println("\n<< 전체 요소 출력 >>");
		System.out.println("== toArray() 사용 ==");
		for(Object p: hashSet.toArray()) {
//			System.out.println(p.hashCode());
			System.out.println(((Person)p).getName());
//			System.out.println();
		}
	}
}
