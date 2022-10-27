package first;

public class AccessEx02 {
	// 멤버 변수
	AccessEx01 ac = new AccessEx01();
	
	// 멤버 메서드
	void show() {
		// Error! why?
		// AccessEx01에서 one의 접근 권한을 private으로 설정하여, 다른 클래스에서는 사용할 수 없다.
//		System.out.println(ac.one);
		System.out.println(ac.two);
		System.out.println(ac.three);
		System.out.println(ac.four);
	}

}
