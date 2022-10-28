class User {
	private String name;
	
	public User(String name) {
		this.name = name;
	}
	
	public void print() {
		Printer printer = Printer.getPrinter();
		printer.print(this.name + " print using " + printer.toString() + ".");
	}
}

/*=================================================================
 * [Printer class] 정의
 * - 객체는 오로지 하나만 생성되도록 하시오(싱글톤)
 * - 하나의 객체가 !안정적!으로 생성되도록 getPrinter()에 구현하시오
 * 	 (null일 경우에만 객체를 생성)
 * - print() 메서드는 객체의 주소를 출력
 *=================================================================*/
class Printer {
	// 멤버 변수 : static 변수
	private static Printer printer;
	
	// 기본 생성자 : private 생성자
	private Printer() { }
	
	// 멤버 메서드 : static 메서드
	public static Printer getPrinter() {
		if(printer != null)
			return printer;
		else {
			return printer = new Printer();
		}
	}
	// 멤버 메서드 : instance 메서드
	public void print(String address) {
		System.out.println(address);
	}
}

public class SingletonQuiz {

	public static void main(String[] args) {
		User[] user = new User[5];
		
		for(int i=0; i<user.length; i++) {
			user[i] = new User((i + 1) + "-user");
			user[i].print();
		}
	}

}
