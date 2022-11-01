package string;

public class StringEx03 {
	// static 영역에서 static이 아닌 멤버 변수를 사용할 수 없음
	// 멤버 변수는 초기화를 하지 않아도, 자동으로 null로 초기화 됨
	static String con;
	
	public static void main(String[] args) {
		String[] str = {"one", "two", "three", "four"};
		// 초기화를 하지 않으면 쓰레기 값이 있으므로, 출력을 할 수 없음
//		String con;
		
		System.out.println(con + str + str[0]);
	}

}
