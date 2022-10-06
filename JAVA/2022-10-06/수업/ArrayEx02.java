
public class ArrayEx02 {

	public static void main(String[] args) {
		
		// 1. 2차원 배열 생성
		// int형의 2행 4열인 배열 arr2생성
		int[][] arr2 = new int[2][3];
		
		// 2. 2차원 배열에 값 설정
		arr2[0][0] = 2;
		arr2[0][1] = 4;
		arr2[0][2] = 6;
		arr2[1][0] = 8;
		arr2[1][1] = 10;
		arr2[1][2] = 12;
		
		// 3. 배열 요소의 값 출력
		
		// cf)
		// arr2 : 참조변수 - 2차원 배열의 행의 시작 주소
		System.out.println("arr2 >> " + arr2);
		// arr2[0] : 참조변수 - 2차원 배열의 첫번째 1차원 배열의 시작 주소
		System.out.println("arr2[0] >> " + arr2[0]);
		// arr2[1] : 참조변수 - 2차원 배열의 두번째 1차원 배열의 시작 주소
		System.out.println("arr2[1] >> " + arr2[1]);
		
		// 3-1. 일반 for문
		System.out.println("\n<< 일반 for문 >> ");
		for(int i=0; i<arr2.length; i++) {
			for(int j=0; j<arr2[i].length; j++) {
				System.out.print(arr2[i][j] + " ");
			}
			System.out.println();
		}
		
		// 3-2. 향상된 for문
		System.out.println("\n<< 향상된 for문 >> ");
		for(int[] i: arr2) {
			for(int j: i) {
				System.out.print(j + " ");
			}
			System.out.println();
		}
	}

}