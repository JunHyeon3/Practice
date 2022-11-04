package generic;

// [제너릭 클래스]
// 제너릭 파라미터는 클래스명 우측에 작성
class Test<T> {
	private T element;
	
	public void setElement(T element) {
		this.element = element;
	}
	public T getElement() {
		return this.element;
	}
}

public class Ex02 {
	public static void main(String[] args) {
		// 제너릭 클래스는 사용할 때 type(참조형)을 명시해줘야 한다.
		// int는 기본형이므로 쓸 수 없고, 참조형인 Integer를 사용해야한다.
		Test<Integer> test = new Test<Integer>();
		test.setElement(10);
		System.out.println("저장된 값 >> " + test.getElement()); 

		Test<String> strTest = new Test<String>();
		strTest.setElement("hi");
		System.out.println("저장된 값 >> " + strTest.getElement()); 
	}
}
