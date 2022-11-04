package generic;

public class Ex08 {
	// [제너릭 메서드] : 제네릭 파라미터 type이 배열
	// 배열 생성(new T[10])이 안되는 거임
	public static <T> void showArray(T[] t) {
		for(T type: t)
			System.out.println(type);
	}
	
	public static void main(String[] args) {
		String[] str = {"hi", "hello"};
		showArray(str);
		
		Object[] fruit = {new Apple(), new Banana()};
		showArray(fruit);
	}

}
