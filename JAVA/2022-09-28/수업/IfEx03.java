
public class IfEx03 {

	public static void main(String[] args) {

		int num = 200;
		
		// [조건 3개]
		if (num < 0) {
			System.out.println("0 미만");
		} 
		else if (num < 100) {
			System.out.println("0 이상 100 미만");
		}
		else {
			System.out.println("100 이상");
		}
		

		System.out.println("실행완료!");
	}

}
