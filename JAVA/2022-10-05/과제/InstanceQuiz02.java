/*
 * [문제]
 * Customer 클래스 작성하기
 * 
 * [출력 형태]
 * ID : 1, NAME : 홍길동
 * ID : 2, NAME : 박보검
 */

class Customer {
	int id;
	String name;
	
	void setId(int i) {
		id = i;
	}
	
	void setName(String n) {
		name = n;
	}
	
	void showInfo() {
		System.out.printf("ID : %d, NAME : %s \n", id, name);
	}
	
}

public class InstanceQuiz02 {

	public static void main(String[] args) {
		Customer hong = new Customer();
		hong.setId(1);
		hong.setName("홍길동");
		hong.showInfo();
		
		Customer park = new Customer();
		park.setId(2);
		park.setName("박보검");
		park.showInfo();
	}

}
