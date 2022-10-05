// main method에서 만든 객체를 newYear()에 적용시키기

public class InstanceEx04 {

	// Method 정의
	// 매개변수 Student(클래스명) student(변수명) : 변수명은 클래스명과 동일하게 작성
	public static void newYear(Student student) {	
		// student.age++ : 후증가
		System.out.println("나이 >> " + student.age++);	
		System.out.println("이름 >> " + student.name);
		
	}
	
	public static void main(String[] args) {

		System.out.println("main method 실행 시작");
		
		// hong 객체 생성 & 외부 접근으로 값 입력
		Student hong = new Student();
		hong.age = 25;
		hong.name = "홍길동";
		
		// park 객체 생성 & 외부 접근으로 값 입력
		Student park = new Student();
		park.age = 30;
		park.name = "박보검";
		
		// 호출
		newYear(hong);
		// output : 26 -> hong.age++
		System.out.println("홍길동의 내년 나이 >> " + hong.age);
		
		// Age is 0, Name is null 출력 -> 초기값으로 출력
		newYear(new Student());
		
		newYear(park);
		System.out.println("박보검의 내년 나이 >> " + park.age);
	}

}
