package generic;

// [제너릭 인터페이스]
interface Space<T> {
	void youKnow(T item);
}

class Star<T> implements Space<T> {
	@Override
	public void youKnow(T item) {
		System.out.println(item + "은 항성이지~");
	}
}

class Sun {
	@Override
	public String toString() {
		return "태양";
	}
}

public class Ex06 {

	public static void main(String[] args) {
		Star<Sun> star = new Star<Sun>();
		star.youKnow(new Sun());
	}

}
