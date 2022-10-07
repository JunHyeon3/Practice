import java.util.Scanner;

/*
 * [문제]
 * 사용자에게 금액을 입력받아 해당되는 단위의 개수 출력
 *
 * [출력 형태]
 * 금액 입력 : 24760
 * ◈화폐단위◈
 * 10000원 : 2개
 *  5000원 : 0개
 *  1000원 : 4개
 *   500원 : 1개
 *   100원 : 2개
 *    50원 : 1개
 *    10원 : 1개
 */

public class P4 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		
		System.out.print("금액 입력 : ");
		int price = input.nextInt();
		
		int[] unit = {10000, 5000, 1000, 500, 100, 50, 10};
		
		int count = 0;
		
		for(int i=0; i<unit.length; i++) {
			count = price / unit[i];
			price %= unit[i];
			
			switch(unit[i]) {
			case 5000: case 1000:
				System.out.print(" ");
				break;
			case 500: case 100:
				System.out.print("  ");
				break;
			case 50: case 10:
				System.out.print("   ");
				break;
			}
			
			System.out.printf("%d원 : %d개\n", unit[i], count);
			
			input.close();
		}
	}

}
