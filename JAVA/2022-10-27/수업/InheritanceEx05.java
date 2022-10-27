// 모든 class는 Object라는 class의 자식 class이다.
class Cat1 {
	
	// Object class에 있는 toString()메서드를 오버라이딩
	@Override
	public String toString() {
		return "Cat class입니다.";
	}
}

public class InheritanceEx05 {

	public static void main(String[] args) {
		Cat1 cat = new Cat1();
		
		// 기본적으로 Obcect class에 있는 toString()메서드를 붙여서 실행한다.
		System.out.println(cat);
		// toString()메서드는 getClass().getName() + '@' + Integer.toHexString(hashCode()) 값을 리턴한다.
		System.out.println(cat.toString());
		
		System.out.println(cat.getClass());
		System.out.println(cat.getClass().getName());
	}

}
