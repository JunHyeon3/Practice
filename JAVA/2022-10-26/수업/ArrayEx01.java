
public class ArrayEx01 {

	public static void main(String[] args) {
		// 배열 생성과 동시에 초기화
//		int[][] arr = new int[][] {{2, 4, 6}, {8, 10, 12}};
		
		// 배열 생성 시 열의 정보는 생략가능
		int[][] arr = new int[2][];
		arr[0] = new int[] {2, 4, 6};
		arr[1] = new int[] {8, 10};
		
		// 일반 for문 사용하여 출력
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}
	}

}
