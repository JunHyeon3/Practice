package polymorphism;

class Product {
	// 멤버 변수
	int price;
	int bonusPoint;
	
	// 생성자
	Product(int price) {
		this.price = price;
		bonusPoint = price / 10;
	}
}

class Tv extends Product {
	// 생성자
	public Tv() {
		super(100);
	}
	
	// 멤버 메서드
	public String toString() {
		return "Tv";
	}
}

class Computer extends Product {
	// 생성자
	Computer() {
		super(200);
	}
	
	// 멤버 메서드
	public String toString() {
		return "Computer";
	}
}

class Buyer {
	// 멤버 변수
	int money = 1000;
	int bonusPoint = 0;
	int spendMoney = 0;
	int idx = 0;
//	int tvCount = 0;
//	int comCount = 0;
	String[] buyList = new String[10];
	
	// 멤버 메서드
	void buy(Product p) {
		if(this.money < p.price) {
			System.out.println("잔액이 부족하여 물건을 살 수 없습니다.");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		System.out.println(p + "을/를 구입하셨습니다.");
		spendMoney += p.price;
		buyList[idx++] = p.toString();
	}
	// 구매한 가전 제품 정보를 출력하는 메서드
//	void summary() {
//		String str = "";
//		System.out.println("구입하신 물품의 총 금액은 " + this.spendMoney + "만원 입니다.");
//		for(String bl: this.buyList) {
//			if(bl != null)
//				str += (bl + ", ");
//		}
//		System.out.print("구입하신 제품은 " + str + "입니다.");
//	}
	
	void summary() {
		int tvCount = 0;
		int comCount = 0;
		System.out.println("구입하신 물품의 총 금액은 " + this.spendMoney + "만원 입니다.");
		for(String bl: this.buyList) {
			if(bl == null) 
				break;
			
			if(bl.equals("Tv")) 
				tvCount++;
			else if(bl.equals("Computer"))
				comCount++;
		}
		System.out.printf("구입하신 제품은 Tv %d개, Computer %d개 입니다.", tvCount, comCount);
	}
}

public class Ex04Refactoring {

	public static void main(String[] args) {
		
		Buyer b = new Buyer();
		
		System.out.println("<< 물건 구매 >>");
		// 일회용으로 객체를 사용할 때 사용하는 방법
		b.buy(new Tv());
		b.buy(new Computer());
		b.buy(new Computer());
		b.buy(new Computer());
		b.buy(new Tv());
		b.buy(new Tv());
		
		System.out.println("\n<< 물건 구매 후 >>");
		System.out.println("현재 남은 돈은 " + b.money + "만원 입니다.");
		System.out.println("현재 보너스 포인트는 " + b.bonusPoint + "점 입니다.");

		System.out.println("\n<< 물건 구매 목록 >>");
		b.summary();
	}

}
