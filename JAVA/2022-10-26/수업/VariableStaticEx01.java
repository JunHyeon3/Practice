class Baseball {
	// 멤버 변수 : 인스턴스(객체) 변수
//	int count = 10;
	
	// 멤버 변수 : static(클래스) 변수
	static int count = 10;
	
	// 멤버 메서드 : 인스턴스(객체) 메서드
	void increment() {
		// 지역 변수 -> 객체 변수 -> static 변수 순으로 찾아감
		count++;
	}
	void decrement() {
		count--;
	}
	void baseballInfo() {
		System.out.println("현재 개수 : " + count);
	}
}
public class VariableStaticEx01 {

	public static void main(String[] args) {
		
		Baseball b1 = new Baseball();
		b1.increment();
		b1.baseballInfo();
		
		Baseball b2 = new Baseball();
		b2.increment();
		b2.baseballInfo();

		// static 변수일 경우, 객체를 생성하지 않아도 사용할 수 있다.
		// class명.static변수명
		System.out.println("static 멤버 변수 >> " + Baseball.count);
		// 참조변수명.static변수명으로 접근할수도 있지만 좋지 않은 방법이다.
		System.out.println("static 멤버 변수 >> " + b1.count);
	}

}
