/*
 * [열거형] enum
 * - 열거형 상수
 * - 멤버 변수는 모두 대문자로 사용
 * - 관련 있는 상수들을 하나의 이름으로 관리
 * - 첫 번째 멤버부터 0부터 1씩 증가하는 상수를 부여 받음
 */
package enumexample;

// [class로 enum 처럼 구현하기]
class Season {
	// [멤버 변수]
	private String name;
	// 내부에서 객체 생성
	static final Season SPRING = new Season("SPRING");
	static final Season SUMMER = new Season("SUMMER");
	static final Season FALL = new Season("FALL");
	static final Season WINTER = new Season("WINTER");
	
	// [생성자]
	// private 생성자 -> 외부에서 객체 생성 불가능
	private Season(String name) {
		this.name = name;
	}
	
	// [멤버 메서드]
	@Override
	public String toString() {
		return this.name;
	}	
}

public class Ex01 {
	public static void main(String[] args) {
		
		System.out.println(Season.SPRING);
		System.out.println(Season.SUMMER);
		System.out.println(Season.FALL);
		System.out.println(Season.WINTER);
		
	}
}
