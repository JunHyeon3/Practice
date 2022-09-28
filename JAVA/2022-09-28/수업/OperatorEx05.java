public class OperatorEx05 {

	public static void main(String[] args) {

		// [삼항 연산자] 조건 연산자
		int num = 5;
		
		// [형태 1]
		String result = (num > 4) ? "크다" : "작거나 같다";
		System.out.println("result : " + result);

		// [형태 2]
		// Error! why? 삼항 연산자의 왼쪽에는 반드시 결과를 저장할 변수가 있어야 한다.
		// (num > 4) ? System.out.println("크다"); : System.out.println("작거나 같다");
	}

}
