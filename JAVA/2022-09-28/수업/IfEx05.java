
public class IfEx05 {

	public static void main(String[] args) {
		
		// [1 ~ 5 사이의 랜덤 값 생성]
		// Math class의 random() 메소드는, 0 ~ 1사이의 랜덤한 실수(double형)를 생성한다.
		// Math.random()에 5를 곱하면, 0 ~ 5 사이의 랜덤한 실수를 생성한다.
		// 생성된 랜덤 실수를 int형으로 강제 형 변환 하면 0 ~ 4사이의 정수로 만든다.
		// 마지막으로  + 1을 해주면 1 ~ 5사이의 랜덤 수가 출력된다.
		int randomValue = (int)(Math.random()*5) + 1;

		//System.out.println("랜덤 값 : " + randomValue);
		
		if (randomValue == 1) {
			System.out.println("1번이 나왔습니다.");
		}
		else if (randomValue == 2) {
			System.out.println("2번이 나왔습니다.");
		}
		else if (randomValue == 3) {
			System.out.println("3번이 나왔습니다.");
		}
		else if (randomValue == 4) {
			System.out.println("4번이 나왔습니다.");
		}
		else {
			System.out.println("5번이 나왔습니다.");
		}
		
		System.out.println(randomValue + "번이 나왔습니다.");
	}

}
