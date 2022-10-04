import java.util.Scanner;

public class MethodEx06 {

	public static void main(String[] args) {
		
		// 원하는 영역을 드래그 하여, 메소드 추출의 단축키인 alt + shift + m을 누르면
		// 선택한 영역의 기능을 하는 메서드를 생성하고 동일한 기능을 하는 다른 부분도 메서드로 대체된다.
		int num = 5;
		num++;
		System.out.println(num);
		
		Scanner input = new Scanner(System.in);
		System.out.print("정수 1개 입력 >> ");
		
		int userValue = input.nextInt();
		userValue++;
		System.out.println(userValue);
		
		int var = 10;
		var++;
		System.out.println(var);
		
		input.close();
	}

}
