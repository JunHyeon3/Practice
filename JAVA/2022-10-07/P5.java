/*
 * [문제]
 * 길이가 10인 1차원 배열을 생성한 후, 랜덤값(정수)을 저장하시오.
 * 그리고 저장된 정수의 빈도수를 출력하시오
 * 
 * [출력 형태]
 * 3949781054
 * 0의 개수 : 1
 * 1의 개수 : 1
 * 2의 개수 : 0
 * 3의 개수 : 1
 * 4의 개수 : 2
 * 5의 개수 : 1
 * 6의 개수 : 0
 * 7의 개수 : 1
 * 8의 개수 : 1
 * 9의 개수 : 2
 */

public class P5 {

	public static void main(String[] args) {
		
		int[] arr = new int[10];
		int count = 0;
		
		for(int i=0; i<arr.length; i++) {
			arr[i] = (int)(Math.random() * 9) + 1;
			System.out.print(arr[i]);
		}
		
		System.out.println();

		for(int i=0; i<10; i++) {
			count = 0;
			
			for(int j: arr) {
				if (i == j)
					count++;
			}
			
			System.out.printf("%d의 개수 : %d\n", i, count);
		}
	}

}
