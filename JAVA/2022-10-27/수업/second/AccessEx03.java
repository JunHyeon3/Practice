package second;

// 다른 package에 있는 class에 접근하기 위해 import를 사용
import first.AccessEx01;

public class AccessEx03 {
	// 멤버 변수
	AccessEx01 ac = new AccessEx01();
	
	// 멤버 메서드
	void show() {
//		System.out.println(ac.one);
		// Error! why?
		// default는 같은 package에서만 접근이 허용됨
//		System.out.println(ac.two);
		// Error! why?
		// protected는 package가 달라도 되지만, 상속된 경우에만 접근이 허용됨
//		System.out.println(ac.three);
		System.out.println(ac.four);
	}

}
