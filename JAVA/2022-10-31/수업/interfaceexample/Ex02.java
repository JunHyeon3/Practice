package interfaceexample;

// interface의 모든 변수는 기본적으로 public static final이다.
interface Var {
	int num1 = 100;
	static int num2 = 200;
	final int num3 = 300;
	public static final int num4 = 400;
}

public class Ex02 {

	public static void main(String[] args) {
		
		// Error! interface로는 객체 생성을 할 수 없다.
//		Var v = new Var();
		
		// Error! interface의 변수는 기본적으로 final로 생성된다. 
//		Var.num2 = 2;
		
		// interface의 변수는 static이 아니여도 static 처럼 사용할 수 있다.
		System.out.println(Var.num1);
		System.out.println(Var.num2);
		System.out.println(Var.num3);
		System.out.println(Var.num4);
	}

}
