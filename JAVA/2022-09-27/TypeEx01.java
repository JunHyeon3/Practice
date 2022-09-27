
public class TypeEx01 {

	public static void main(String[] args) {
		// 정수 자료형
		byte by = 5;
		System.out.println("by : " + by);
		
		by = 127;
		System.out.println("by : " + by);
		
		// char 타입은 문자를 아스키코드로 변환하여 저장한다.
		// ‘A’라는 문자는 10진수로 65이므로, ‘A’로 저장하거나 65로 저장해도 
		// 결과는 동일하게 ‘A’라는 문자를 출력한다. 
		char ch = 'A';
		System.out.println("ch1 : " + ch);
		ch = 65;
		System.out.println("ch2 : " + ch);

		short sh = 97;
		System.out.println("sh : " + sh);
		
		// 10000000000이 상수의 기본 자료형인 int의 범위를 벗어나기 때문에 오류가 발생한다.
		// 상수 뒤에 접미사 L을 적어주어 상수의 기본 자료형을 long으로 변경해주어야 한다.
		long lo = 10000000000L;			 	;
		//long lo = 10000000000; (X)
		System.out.println("lo : " + lo);
		
		// 실수 자료형
		// 실수의 기본 자료형이 double이므로 2.34라는 실수는 메모리에 8byte 크기로 할당된다, 
		// 이때 8byte크기에 저장된 실수를 4byte로 할당된 float 자료형에 넣을 수 없다. 
		// 실수 뒤에 접미사 F를 적어 실수의 기본 자료형을 float로 변경해주어야 한다.
		float fo = 2.34F;
		//float fo = 2.34; (X)
		System.out.println("fo : " + fo);
		
		double db = 3.14;
		System.out.println("db : " + db);
	}

}
