package second;

import first.AccessEx01;

public class AccessEx04 extends AccessEx01 {

	void show() { 
//		System.out.println(one);
//		System.out.println(two);
		// AccessEx04가 AccessEx01에 상속 되었기 때문에, protected인 three를 사용 가능
		System.out.println(three);
		System.out.println(four);
	}
	
}
