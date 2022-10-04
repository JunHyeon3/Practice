
public class MethodEx07 {

	public static void main(String[] args) {
		
		System.out.println("리팩토링 연습");
		
		increment();
	}

	// 메서드 추출기능을 사용할 때 
	// 변수의 초기 값이 있으면 num이 매개변수로 들어가지 않는다.
	// alt + shift + r을 누르면 동일한 변수명을 한번에 변경 가능
	public static void increment() {
		int number = 10;
		number++;
		System.out.println(number);
	}

}
