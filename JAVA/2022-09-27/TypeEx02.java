
public class TypeEx02 {

	public static void main(String[] args) {
		boolean bool = true;
		System.out.println("bool : " + bool);
		
		/*
		 * 강제형변환 (명시적 형변환) : 변수명 앞에 (자료형)을 붙여 임의로 형변환 
		 * 자동형변환 (묵시적 형변환) : 작은 -> 큰, 정수 -> 실수
		 */
		
		int n1 = 10;
		int n2 = 3;
		double n3 = 3.0;
		System.out.println("n1 / n2 = " + n1 / n2);
		System.out.println("n1 / n2 = " + n1 / (double)n2);
		System.out.println("n1 / n3 = " + n1 / n3);
	}
	
}
