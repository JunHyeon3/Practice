package enumexample;

enum Number {
	ONE(1), TWO(2), THREE(3), FOUR(4);
	
	private int number;
	
	private Number(int i) {
		this.number = i;
	}
	
	public int getNumber() {
		return this.number;
	}
}

public class Ex03 {

	public static void main(String[] args) {

		Number currentNumber = Number.ONE;
			
		switch (currentNumber) {
			case ONE:
				System.out.println("1이다.");
				break;
			case TWO:
				System.out.println("2이다.");
				break;
			case THREE:
				System.out.println("3이다.");
				break;
			case FOUR:
				System.out.println("4이다.");
				break;
		}
		
		// [문제] 기본으로 설정된 정수 값 출력
		System.out.println("기본 서수 출력");
		for(Number num: Number.values())
			System.out.println(num.ordinal());
		
		// 별도로 지정한 정수 값 출력
		System.out.println("\n설정된 정수 출력");
		for(Number num: Number.values())
			System.out.println(num.getNumber());
	}

}
