
public class StringEx01 {

	public static void main(String[] args) {
		// s1과 s2에는 "안녕"이라는 연속된 문자열 상수의 시작 주소가 저장됨
		String s1 = "안녕";
		String s2 = "안녕";
		
		if (s1 == s2)
			System.out.println("같다.");
		else
			System.out.println("다르다.");
		
		// s3와 s4에는 각 객체의 주소가 저장되고, "안녕"은 멤버 변수에 저장됨
		String s3 = new String("안녕");
		String s4 = new String("안녕");
		
		if (s3 == s4)
			System.out.println("같다.");
		else
			System.out.println("다르다.");
		// equals() : 멤버 변수의 값을 비교해주는 메서드
		if (s3.equals(s4))
			System.out.println("같다.");
		else
			System.out.println("다르다.");
		
	}

}
