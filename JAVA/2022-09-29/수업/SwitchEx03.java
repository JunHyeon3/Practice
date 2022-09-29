
public class SwitchEx03 {

	public static void main(String[] args) {

		String fruit = "사과";

		// switch문의 값에는 정수만 나와야 하는데 문자열? why?
		// class의 뒤에 나오는 변수에는 문자열이 저장되는것이 아니라, 메모리에 저장된 주소(정수)가 저장된다.
		// 그렇기 때문에 fruit라는 변수에는 "사과"가 저장된 메모리의 주소가 저장되어 있는 것이다!!
		switch (fruit) {
		// "사과"라는 문자열을 비교하는것이 아니라 주소를 비교하는 것이다.
		case "사과":
			System.out.println("사과는 오른쪽 창고에 있습니다.");
			break;
		case "배":
			System.out.println("배는 왼쪽 창고에 있습니다.");
			break;
		default:
			System.out.println("나머지 과일은 위쪽에 있습니다.");
		}
	}

}
