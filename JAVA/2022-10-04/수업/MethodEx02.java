
public class MethodEx02 {

	// 메서드 정의
	// 형태 : 매개변수 있고, 리턴값 없음
	// 기능 : 정수 1개를 받은 후, 1증가된 값 출력
	public static void increment(int num) { // 전달받은 인수를 초기값으로 매개변수 num을 선언
		num++;
		System.out.println("1증가된 값 >> " + num);
	}
	
	public static void main(String[] args) {
		// 5는 인수로, 메서드에 전달하는 값이다.
		increment(5);
	}

}
