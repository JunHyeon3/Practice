package himedia.seventhspring.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

// lombok이 제공하는 @Setter, @Getter를 사용하면 여러개의 setter/getter를 처리해준다.
@Setter @Getter @Entity
public class Item {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// @Column(name="") : 칼럼 명을 지정해주는 어노테이션이다.
	// Column 어노테이션을 사용하지 않을 경우, itemName을 ITEM_NAME으로 인식한다.
	@Column(name="ITEMNAME")
	private String itemName;
	private Integer price;
	private Integer quantity;
	
	public Item() {	}
	
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
