
public class ArrayEx04 {

	public static void main(String[] args) {

		/*
		 * 상단 초록색 런 버튼 옆의 run configurations 클릭 -> Arguments 탭에 값 입력
		 */
		System.out.println("입력된 배열의 길이 >>> " + args.length);
		
		for(int i=0; i<args.length; i++) {
			System.out.println(args[i]);
		}
	}

}
