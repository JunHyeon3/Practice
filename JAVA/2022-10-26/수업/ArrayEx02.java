
public class ArrayEx02 {

	public static void main(String[] args) {
		
		// 객체 배열 : 객체 배열의 각 배열의 값에는, 생성되는 객체의 주소가 저장됨
		
		// [첫 번째]
//		String[] strArr = new String[3];
//		strArr[0] = new String("Java");
//		strArr[1] = new String("HTML");
//		strArr[2] = new String("CSS");
		
		// [두 번째]
//		String[] strArr = new String[] {new String("Java"), new String("HTM"), new String("CSS")};
		
		// [세 번째]
//		String[] strArr = {new String("Java"), new String("HTM"), new String("CSS")};
		
		// [네 번째] ※String 일 경우에만 가능※
		String[] strArr = {"Java", "HTM", "CSS"};

		// 일반 for문
//		for (int i=0; i<strArr.length; i++)
//			System.out.println(strArr[i]);
		
		// 향상된 for문
		for (String i:strArr)
			System.out.println(i);
			
	}

}
