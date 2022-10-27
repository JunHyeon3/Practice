class Fruit {
	int count;
	
	public Fruit() {
		this(0);
	}
	public Fruit(int count) {
		this.count = count;
	}
	
	public void showCount() {
		System.out.printf("현재 남은 개수는 %d입니다.\n", this.count);
	}
	public void showInfo() {
		System.out.println("과일 정보를 출력하는 메서드입니다.");
	}
}

class Banana extends Fruit {
	public Banana() {
		
	}
	public Banana(int count) {
		super(count);
	}
	
	public void showInfo() {
		System.out.println("------------------------------");
		System.out.println("현재 과일은 바나나입니다.");
		System.out.printf("바나나는 %d개 있습니다.\n\n", super.count);
	}
}

public class InheritanceQuiz01 {

	public static void main(String[] args) {

		Banana bananaOne = new Banana();
		bananaOne.showInfo();
		
		Banana bananaTwo = new Banana(10);
		bananaTwo.showInfo();
		
	}

}
