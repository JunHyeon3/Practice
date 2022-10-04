
public class MethodEx03 {

	// 메서드 정의
	// 형태 : 리턴값 있고, 매개변수 있음
	// 기능 : 정수를 2개 받아서, 덧셈한 결과를 리턴
	public static int add(int num1, int num2) {
		int result = num1 + num2;
		
		return result;
	}
	
	public static void main(String[] args) {
		// add() 메서드로 부터 return되는 값을 변수에 저장한 후 출력한다.
		int addResult = add(5, 3);
		System.out.println("add(5, 3) 실행 결과 >>> " + addResult);

		// return되는 값을 따로 저장하지 않고 바로 return값을 출력할 수 있다.
		System.out.println("add(5, 3) 실행 결과 >>> " + add(2, 4));
	}

}
