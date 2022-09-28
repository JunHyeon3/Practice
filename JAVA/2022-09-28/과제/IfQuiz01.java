public class IfQuiz01 {

	public static void main(String[] args) {
		
		int num1 = 11, num2 = 5;
		
		// if문을 사용하여 큰 값, 작은 값을 출력하시오
		// 결과
		// 큰 값 : 11, 작은 값 :5
		
		if (num1 > num2) {
			System.out.println("큰 값 : " + num1 + ", " + "작은 값 : " + num2);
		}
		else {
			System.out.println("큰 값 : " + num2 + ", " + "작은 값 : " + num1);
		}
	}

}
