package enumexample;

enum SeasonTwo {
	// [멤버 변수] : 기본이 static final 변수 -> 상수화 
	// 외부에서 값 변경 불가능 -> 타입 변견에 안전하다!
	// enum 멤버 변수는 switch문에서 사용 가능
	// 세미콜론(;)을 생략할 수 있음
	SPRING, SUMMER, FALL, WINTER
	
	// [생성자] : 기본이 private 생성자 -> 객체 생성 불가능
//	private SeasonTwo() { }	
}

public class Ex02 {

	public static void main(String[] args) {
		// 1. Error! 객체 생성 불가능 : enum 생성자의 접근 권한이 자동으로 private으로 설정됨
//		SeasonTwo s = new SeasonTwo();
		
		// 2. 출력
		System.out.println("SeasonTwo.SPRING >> " + SeasonTwo.SPRING);
		System.out.println("SeasonTwo.SUMMER >> " + SeasonTwo.SUMMER);
		System.out.println("SeasonTwo.FALL >> " + SeasonTwo.FALL);
		System.out.println("SeasonTwo.WINTER >> " + SeasonTwo.WINTER);
		
		// 3. 열거형 멤버 변수
		// 오버라이딩된 toString() 메서드가 기본적으로 포함되어 있음
		SeasonTwo spring = SeasonTwo.SPRING;
		System.out.println("spring >> " + spring);
		
		SeasonTwo spring2 = SeasonTwo.SPRING;
		
		if(spring == spring2)
			System.out.println("spring과 spring2는 같다.");
		else
			System.out.println("spring과 spring2는 같다.");
		
		// 4. 열거형의 클래스명
		System.out.println(SeasonTwo.SPRING.getDeclaringClass());
		
		// 5. 열거형의 상수명 확인
		System.out.println(SeasonTwo.SPRING.name());
		
		// 6. 열거형 상수를 배열 형태로 리턴
		System.out.println(SeasonTwo.values());
		
		for(SeasonTwo st: SeasonTwo.values())
			System.out.println(st);
			
		// 7. 열거형 상수(부여 받는 정수) 값 확인
		for(SeasonTwo st: SeasonTwo.values())
			System.out.println(st.ordinal());
		
		// 8. switch문
		SeasonTwo currentSeason = SeasonTwo.FALL;
		
		switch(currentSeason) {
			case SPRING: 
				System.out.println("봄에는 취업을 하자");
				break;
			case SUMMER: 
				System.out.println("여름에는 휴가를 가자");
				break;
			case FALL: 
				System.out.println("가을에는 독서를 하자");
				break;
			case WINTER: 
				System.out.println("겨울에는 이직 하자");
				break;
		}
	}

}
