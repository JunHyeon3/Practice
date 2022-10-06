
public class ArrayEx02CleanCode {

	public static void main(String[] args) {
		
		// 1. 2차원 배열 생성과 동시에 초기화
		// int[][] arr2 = new int[][] {{2, 4, 6}, {8, 10, 12}};
		int[][] arr2 = {{2, 4, 6}, {8, 10, 12}};
		
		// 2. 배열 요소의 값 출력
		// 2-1. 일반 for문
		System.out.println("\n<< 일반 for문 >> ");
		for(int i=0; i<arr2.length; i++) {
			for(int j=0; j<arr2[i].length; j++) {
				System.out.print(arr2[i][j] + " ");
			}
			System.out.println();
		}
		
		// 2-2. 향상된 for문
		System.out.println("\n<< 향상된 for문 >> ");
		for(int[] i: arr2) {
			for(int j: i) {
				System.out.print(j + " ");
			}
			System.out.println();
		}
	}

}