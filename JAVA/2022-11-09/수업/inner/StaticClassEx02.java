package inner;

class OuterFive {
	// instance method
	public void instanceMethod() {
		InnerInstance ii = new InnerInstance();
		InnerStatic is = new InnerStatic();
	}
	
	// static method
	public static void staticMethod() {
		// Error! static method에서 static이 아닌 InnerInstance class 사용 불가
//		InnerInstance ii = new InnerInstance();
		InnerStatic is = new InnerStatic();
	}
	
	// instance inner class
	class InnerInstance { }
	
	// static inner class
	static class InnerStatic { }
}

public class StaticClassEx02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
