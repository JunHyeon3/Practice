package string;

public class StringEx01 {

	public static void main(String[] args) {
		String[] str = {"one", "two", "three", "four"};
		String concat = "";
		
		// for문 안에서 반복하여 배열의 값을 print해도 상관은 없지만, 
		// 보다 효율적인 방법으로 연속된 문자열을 출력할 수 있다.
		
		// 일반 for문
//		for(int i=0; i<str.length; i++) {
//			System.out.print(str[i] + ", ");
//			
//			concat += (str[i] + ", ");
//		}
		
		// 향상된 for문
		for(String s: str)
			concat += (s + ", ");
		
		System.out.print("\nconcat >> " + concat);
	}

}
