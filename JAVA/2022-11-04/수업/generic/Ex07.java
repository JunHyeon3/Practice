package generic;

class Cool<T> {
	T count;
	// Error! 제너릭은 배열을 생성할 수 없음
//	T[] arr = new T[10];
	
	public Cool() { }
	public Cool(T count) {
		this.count = count;
	}
}

public class Ex07 {

	public static void main(String[] args) {
		Object ob = new Object();
		Object ob2 = new String();
		
		Cool<Object> cool = new Cool<Object>();
		// Error! 제너릭 타입은 일치해야한다. 상속 관계는 상관이 없음
//		Cool<Object> cool2 = new Cool<String>();
	}

}
