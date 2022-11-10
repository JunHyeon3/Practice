// [인터페이스 구현]
package inner;

interface Space {
	// 추상 메서드
	void youKnow();
}

class SubSpace implements Space {
	@Override
	public void youKnow() {
		System.out.println("우주에 대해 아는 것이 있나요?");
	}
}

public class AnonymousClassEx02 {

	public static void main(String[] args) {
		
		// SubSpace 객체 생성
		Space spaceOne = new SubSpace();
		spaceOne.youKnow();
		
		// 익명 클래스로 메서드 오버라이딩
		Space spaceTwo = new Space() {
			@Override
			public void youKnow() {
				System.out.println("익명 클래스에서 오버라이딩 됨!");
			}
		};
		spaceTwo.youKnow();
	}

}
