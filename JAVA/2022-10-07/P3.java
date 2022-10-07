/*
 * [문제]
 * 1~9사이의 중복되지 않는 숫자로 이루어진 3자리 숫자를 만드시오.
 * 
 * [출력 형태]
 * 793
 */

public class P3 {

	public static void main(String[] args) {

		int[] arr = new int[3];
		
		// 방법1
//		arr[0] = (int)(Math.random() * 9) + 1;
//		
//		do {
//			arr[1] = (int)(Math.random() * 9) + 1;
//		} while(arr[1] == arr[0]);
//		
//		do {
//			arr[2] = (int)(Math.random() * 9) + 1;
//		} while(arr[2] == arr[0] || arr[2] == arr[1]);
		
		// 방법2
		arr[0] = (int)(Math.random() * 9) + 1;
		do {
			for(int i=1; i<arr.length; i++) {
				arr[i] = (int)(Math.random() * 9) + 1;
			}
		} while(arr[1] == arr[0] || arr[1] == arr[2] || arr[2] 	== arr[0]);
		
		for(int i: arr) {
			System.out.print(i);
		}
	}

}
