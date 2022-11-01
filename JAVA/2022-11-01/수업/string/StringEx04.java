package string;

public class StringEx04 {

	public static void main(String[] args) {
		// 빈 문자열
		String one = "";
		// 문자열 없음
		String two = null;
		
		// ""와 null은 다르다.
		// "" 	: 길이가 0인 문자열이 있다는 뜻
		// null : 문자열이 아무것도 없다는 뜻 (참조하는 객체가 없음)
		
		System.out.println("one >> " + one);
		System.out.println("two >> " + two);
		
		// [빈 문자열 확인1] : length() - 문자열의 길이를 리턴
		System.out.println("빈 문자열 one의 길이 >> " + one.length());
		System.out.println("cf) 문자열 hello의 길이 >> " + "hello".length());
		// Error! NullPointerException
//		System.out.println("문자열이 없는 two의 길이 >> " + two.length());
		
		// [빈 문자열 확인2] : isEmpthy() - 문자열의 길이가 0인 경우 true 리턴
		System.out.println("one.isEmpty()>> " + one.isEmpty());
		// 공백도 하나의 문자열로 취급되므로, false를 출력
		System.out.println("공백.isEmpty()>> " + " ".isEmpty());
		// cf) isBlank() : JAVA 11 이후 추가 - 빈 문자열이나 공백만으로 이뤄진 경우 true 리턴
		System.out.println("one.isBlank()>> " + one.isBlank());
		System.out.println("공백.isBlank()>> " + "  ".isBlank());
		// Error! NullPointerException
//		System.out.println("two.isEmpty()>> " + two.isEmpty());
		
		// [빈 문자열 확인3] : equals() - 문자열이 일치하는 경우 true 리턴
		System.out.println("one.equals()>> " + one.equals(""));
		// Error! NullPointerException
//		System.out.println("two.equals()>> " + two.equals(""));
		
		
	}

}
