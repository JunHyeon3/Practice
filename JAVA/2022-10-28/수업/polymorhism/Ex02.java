package polymorhism;

public class Ex02 {

	public static void main(String[] args) {
		
		Parent p = new Parent();
		Son s = new Son();
		Daughter d = new Daughter();
		
		// up casting
		Parent p2 = new Son();
		
		// [형변환 가능 여부]
		// A instanceof B : A가 B로의 형 변환 가능 여부를 true/false로 나타냄
		// 문법 : 참조변수 or 객체 instanceof 클래스
		System.out.println("<< Parent type과 비교 >>");
		System.out.println(p instanceof Parent);
		// s와 d는 상속 받은 class로 생성된 객체 이므로, s와 d를 찾아가면 Parent class도 있다.
		System.out.println(s instanceof Parent);
		System.out.println(d instanceof Parent);
		// p2는 다형성으로 생성된 객체 이므로, p2를 찾아가면 Son 객체가 있고 그 안에 Parent class가 있다.
		System.out.println(p2 instanceof Parent);
		
		System.out.println("<< Son type과 비교 >>");
		System.out.println(p instanceof Son);
		System.out.println(s instanceof Son);
		System.out.println(p2 instanceof Son);
//		System.out.println(d instanceof Son); : Daughter와 Son은 형제 관계 이므로 Error
		
		// 다형성으로 구현된 객체 배열
		Parent[] mother = {new Son(), new Daughter()};
		// mother[] -> Son과 Daughter의 주소를 가리킴 -> 하지만 Son과 Daughter의는 멤버에 접근 불가능
//		mother[0].study();
//		mother[1].play();
		// 오버라이딩된 메서드가 아닌 메서드를 사용하고자 할 때, 강제 형변환을 해준다.
		((Son)mother[0]).study();
		((Daughter)mother[1]).play();
		
		// 위의 코드를 향상된 for문으로 구현
		for(Parent m: mother) {
			if(m instanceof Son)
				((Son)m).study();
			else if(m instanceof Daughter)
				((Daughter)m).play();
		}
		
	}

}
