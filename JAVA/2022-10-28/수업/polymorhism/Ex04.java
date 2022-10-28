package polymorhism;

class Product {
	int price;
	int bonusPoint;
	
	Product(int price) {
		this.price = price;
		bonusPoint = price / 10;
	}
}

class Tv extends Product {
	public Tv() {
		super(100);
	}
	
	public String toString() {
		return "Tv";
	}
}

class Computer extends Product {
	Computer() {
		super(200);
	}
	
	public String toString() {
		return "Computer";
	}
}

class Buyer {
	int money = 1000;
	int bonusPoint = 0;
	
	void buy(Product p) {
		if(money < p.price) {
			System.out.println("잔액이 부족하여 물건을 살 수 없습니다.");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		System.out.println(p + "을/를 구입하셨습니다.");
	}
}

public class Ex04 {

	public static void main(String[] args) {
		
		Buyer b = new Buyer();
		
		System.out.println("<< 물건 구매 >>");
		b.buy(new Tv());
		b.buy(new Computer());
		
		System.out.println("\n<< 물건 구매 후 >>");
		System.out.println("현재 남은 돈은 " + b.money + "만원 입니다.");
		System.out.println("현재 보너스 포인트는 " + b.bonusPoint + "점 입니다.");

	}

}
