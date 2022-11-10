package item;

public class Item {
	private Long id;
	private String itemName;
	private Integer price;
	private int quantity;
	
	public Item(String itemName, Integer price, int quantity) {
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void showInfo() {
		System.out.printf("%d\t %s\t %d\t %d\n",id, itemName, price, quantity);
	}
	
}
