public class OperatorEx01 {

	public static void main(String[] args) {
		
		// 변수 선언과 동시에 초기화
		// int num1 = 5;
		// int num2 = 3;
		
		// 타입이 동일할 경우 변수를 , 로 연결하여 선언
		int num1 = 5, num2 = 3;
		
		// Error! 타입이 같은 경우에만 연결 가능
		// int ex, float fo; 
		
		// [산술 연산자]
		// num1과 num2이 덧셈이 아닌 단순 연결되어 출력된다.
		// why? 컴퓨터는 왼쪽에서 부터 순차적으로 진행하기 때문에
		// 문자열이 나오고 + 뒤에 num1이 입력되면 자료형이 정수 → 문자열로 자동 형변환 된다.
		// 그렇기 때문에 num1 과 num2가 문자열로 인식 되어 문자열로 연결되게 된다.
		System.out.println("덧셈 : " + num1 + num2);
		
		// num1 + num2를 괄호로 묶어 컴퓨터가 먼저 처리하도록 하고, 
		// num1과 num2가 모두 int형이기 때문에 + 가 산술 연산자로 동작한다.
		System.out.println("덧셈 : " + (num1 + num2));
		
		System.out.println("뺄셈 : " + (num1 - num2));

		// 연산자 우선 순위 때문에 * 는 괄호로 묶지 않아도 + 보다 먼저 처리된다.
		// 하지만 보기 좋도록 괄호를 넣어주는 것이 좋다.
		System.out.println("곱셈 : " + num1 * num2);

		// 몫
		System.out.println("몫 : " + (num1 / num2));

		// 나머지
		System.out.println("나머지 : " + (num1 % num2));
		
		
		// [복합 대입 연산자]
		//num1 = num1 + num2;
		num1 += num2;
		
		System.out.println("num1 : " + num1);
		System.out.println("num2 : " + num2);
		
		// 결국 num1에는 8, num2에는 3이 저장된다.
	}

}