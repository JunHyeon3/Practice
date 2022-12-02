package himedia.examproject.domain;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class ItemForm {
	private	Long id;
	private String itemName;
	private Integer price;
	private Integer quantity;
}
