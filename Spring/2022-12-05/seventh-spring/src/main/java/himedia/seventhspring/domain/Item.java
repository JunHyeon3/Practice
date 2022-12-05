package himedia.seventhspring.domain;

import lombok.Getter;
import lombok.Setter;

// lombok이 제공하는 @Setter, @Getter를 사용하면 여러개의 setter/getter를 처리해준다.
@Setter @Getter
public class Item {

	private Long id;
	private String itemName;
	private Integer price;
	private Integer quantity;
	
	public Item(String itemName, Integer price, Integer quantity) {
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
	}

//	public Long getId() {
//		return id;
//	}
//	public void setId(Long id) {
//		this.id = id;
//	}
//	public String getItemName() {
//		return itemName;
//	}
//	public void setItemName(String itemName) {
//		this.itemName = itemName;
//	}
//	public Integer getPrice() {
//		return price;
//	}
//	public void setPrice(Integer price) {
//		this.price = price;
//	}
//	public Integer getQuantity() {
//		return quantity;
//	}
//	public void setQuantity(Integer quantity) {
//		this.quantity = quantity;
//	}

}
