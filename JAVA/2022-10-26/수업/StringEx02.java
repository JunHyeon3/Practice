
public class StringEx02 {

	public static void main(String[] args) {
		// [자료형]
		// int 		: 기본 자료형 (primitive type)
		// Integer	: 참조 자료형 (reference type)
		int[] arr = new int[] {2, 4};
		
		int one = 10;
		// auto unboxing : 참조형을 기본형으로 자동으로 형 변환
		int two = new Integer(10);
		// unboxing
		int three = (int)new Integer(10);
		
		Integer four = new Integer(10);
		// auto boxing : 기본형이 자료형으로 자동으로 형 변환
		Integer five = 10;
		// boxing
		Integer six = (Integer)10;
		
		// four와 five는 참조 변수라 다르다
		if (five == four)
			System.out.println("같다");
		else
			System.out.println("다르다");
	}

}
