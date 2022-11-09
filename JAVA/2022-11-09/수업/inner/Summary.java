/*
 * [내부 클래스] inner class
 * - class 내부에 정의된 class이다.
 * 
 * - 내부 클래스는 단독으로 클래스 파일이 생성되지 않고, OuterClass$InnerClass 형태로 클래스 파일이 생성됨
 * 
 * - 멤버 class라고 부른다.
 *   cf) class내 member : field, method, class 
 *   
 * - 원래 class에는 public과 default만 가능하지만, inner 클래스에는 private를 사용할 수 있다.   
 * 
 * - 외부 클래스와 내부 클래스가 서로 긴밀한 관계일 때 정의한다.
 * 
 * - 장점
 * 	  - 내부 클래스가 외부 클래스의 멤버에 접근이 가능하다.
 * 	  - 관련 있는 클래스를 논릭적으로 표현함으로써, 코드의 캡슐화를 증가시킨다.
 *    - 외부에서 내부 클래스에 접근할 수 없으므로, 코드의 복잡성을 줄일 수 있다.
 *    
 * - inner class 종류
 *    - instance inner class (비정적 내부 클래스)
 *    		: non-static inner class라고도 부름
 *    		: static method 내에서 사용할 수 없음
 *    
 *    - static inner class (정적 내부 클래스)
 *    		: static method 내에서 사용할 목적으로 사용됨
 *    
 *    - local inner class
 *    		: method 또는 constructor 내 정의된 클래스
 *    		: 해당 영역 내에서만 사용 가능한 클래스
 *    
 *    - anonymous inner class (익명 클래스 (일회용 클래스))
 *    		: 이름이 없는 클래스
 *    		: 클래스 정의와 동시에 객체 생성하므로, 하나의 객체만 생성 가능 -> 일회용 클래스
 *    		: 이름이 없기 때문에 생성자를 정의할 수 없음 (생성자 명 = 클래스 명 이어야 하기 때문에)
 *    		: 오버라이딩(재정의)을 하기 위한 목적으로 사용됨
 */

package inner;

class OuterClass {
	// field
	private int one;
	public int two;
	
	// member class
	class InnerClass {
		
	}
}

public class Summary {

}
