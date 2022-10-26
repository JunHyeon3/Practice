class Fruit {
	final int count;
	String sort;
	
	// final 변수를 초기화 하기 위해서는 생성자를 사용한다.
	public Fruit(int count) {
		this.count = count;
	}
	
	public int getCount() {
		return count;
	}
//	public void setCount(int count) {
//		this.count = count;
//	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public void showInfo() {
		System.out.printf("%s는 현재 %d개 있습니다.\n", this.sort, this.count);
	}
}

public class VariableFinal {

	public static void main(String[] args) {

		Fruit apple = new Fruit(500);
		apple.setSort("사과");
//		apple.setCount(500);
		apple.showInfo();
		
		Fruit banana = new Fruit(1500);
		banana.setSort("바나나");
//		apple.setCount(1500);
		banana.showInfo();
	}

}
