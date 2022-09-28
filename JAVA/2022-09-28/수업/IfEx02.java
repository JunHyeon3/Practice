public class IfEx02 {
	
	public static void main(String[] args) {
		
		int num = 5;

		// [조건 2개]
		if (num > 5) {
			System.out.println("조건이 true일 때 실행되는 영역");
			System.out.println("num : " + num);
		}
		else {
			System.out.println("조건이 false일 때 실행되는 영역");
		}

		System.out.println("실행 완료!");
	}
}
