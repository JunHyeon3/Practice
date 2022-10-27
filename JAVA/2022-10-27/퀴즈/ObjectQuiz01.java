class Caculator {
	int num1;
	int num2;
	
	public Caculator(int num1, int num2) {
		this.num1 = num1;
		this.num2 = num2;
	}
	
	public void add() { 
		System.out.println("덧셈 결과 >> " + (this.num1 + this.num2));
	}
	public void sub() { 
		System.out.println("뺄셈 결과 >> " + (this.num1 - this.num2));
	}
	public void mul() { 
		System.out.println("곱셈 결과 >> " + (this.num1 * this.num2));
	}
	public void div() { 
		if(this.num2 != 0)
			System.out.println("나눗셈 결과 >> " + (this.num1 / this.num2));
		else 
			System.out.println("분모가 0으로 계산 불능입니다.");
	}
}
public class ObjectQuiz01 {

	public static void main(String[] args) {

		System.out.println("-- 첫번째 계산 --");
		Caculator firstCalculator = new Caculator(5, 2);
		firstCalculator.add();
		firstCalculator.sub();
		firstCalculator.mul();
		firstCalculator.div();
		
		System.out.println("\n-- 두번째 계산 --");
		Caculator secondCalculator = new Caculator(7, 0);
		secondCalculator.add();
		secondCalculator.div();
	}

}
