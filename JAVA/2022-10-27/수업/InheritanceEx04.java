/*
 * final : 금지
 * - class		: 상속 금지
 * - method 	: 오버라이딩 금지
 * - variable	: 값 변경 금지
 */

// final class ParentFour : 이 class는 자식 class를 둘 수 없음
class ParentFour {
	String address;
	
	public ParentFour() { }
	
	public ParentFour(String address) {
		this.address = address;
	}
	
	// final public void clean() : 이 메서드는 오버라이딩 할 수 없음
	public void clean() {
		System.out.println("부모 >> 집 청소를 합니다.");
	}
	
	public void showInfo() {
		System.out.println("집 주소 : " + this.address);
	}
}

class ChildFour extends ParentFour {
	public ChildFour(String address) {
		super(address);
	}
	
	// 어노테이션 
	// 1. 쓰임이 맞는지 컴파일러가 문법 검사
	// 2. 시각적 정보를 제공
	@Override
	public void clean() {
		System.out.println("자식 >> 내 방만 청소합니다.");
	}
}

public class InheritanceEx04 {

	public static void main(String[] args) {
		ChildFour c = new ChildFour("서울 구로구");
		c.showInfo();
		c.clean();
	}

}
