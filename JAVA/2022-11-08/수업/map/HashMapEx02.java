package map;

import java.util.HashMap;
import java.util.Map;

class Person {
	private String name;
	private int age;
	
	// field를 포함한 생성자 생성 단축키 : alt + shift + s -> o
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	// setter/getter 생성 단축키 : alt + shift + s -> r
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

public class HashMapEx02 {

	public static void main(String[] args) {
		Person hong = new Person("홍길동", 25);
		Person park = new Person("박보검", 35);
		
		// [유형 1] - 다형성
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("name", hong.getName());
		
		// [유형 2]
		Map<Integer, Person> store = new HashMap<Integer, Person>();
		store.put(1, hong);
		store.put(2, park);
	}

}
