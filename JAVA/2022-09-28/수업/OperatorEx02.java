public class OperatorEx02 {

	public static void main(String[] args) {
		
		int n1 = 5, n2 = 3;
		
		// [관계 연산자] 결과 : true, false
		System.out.println("크니? " + (n1 > n2));
		System.out.println("다르니? " + (n1 != n2));
		System.out.println("같니? " + (n1 == n2));
		
		// [논리 연산자] 결과 : true, false
		boolean result1 = (n1 == 5 && n2 ==3);
		boolean result2 = (n1 == 5 || n2 ==2);
		
		System.out.println("result1 : " + result1);
		System.out.println("result2 : " + result2);
		
	}

}
