// 입력순서
// 1. package -> 2. import -> 3. class

// package : 현재 파일이 속한 경로, 2개의 package는 올 수 없음
package first;

/*
 * [접근 제어자] 접근 권한, 접근 제어 지시자, ...
 * 클래스, 멤버 변수, 메서드, 생성자에 사용
 * 
 * 접근 제어자 종류 : private    <    default    <    protected    <    public
 * 접근 허용 범위 	: 클래스 내	 	  같은 패키지	  상속			    누구나
 * 
 */

public class AccessEx01 {
	// 멤버 변수
	private int one = 1;
	// default는 예약어를 쓰지않음, 안써도 default임
	int two = 2;
	protected int three = 3;
	public int four = 4;
	
	// 멤버 메서드
	void show() {
		System.out.println(one);
		System.out.println(two);
		System.out.println(three);
		System.out.println(four);
	}
	
}
