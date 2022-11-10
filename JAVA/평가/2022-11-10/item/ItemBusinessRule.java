package item;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class ItemBusinessRule {
	private static final Map<Long, Item> STORE = new HashMap<Long, Item>();
	private static Long sequence = 1l;
	
	private Item findById(Long itemId) {
		if(STORE.containsKey(itemId))
			return STORE.get(itemId);
		else 
			return null;
	}
	
	public void save() {
		System.out.print("상품명, 가격, 수량을 순서대로 입력하세요... ");
		String itemName = ItemView.INPUT.next();
		Integer price = ItemView.INPUT.nextInt();
		int quantity = ItemView.INPUT.nextInt();
		
		Item item = new Item(itemName, price, quantity);
		item.setId(sequence);
		STORE.put(sequence++, item);
		
		System.out.println("상품 정보가 저장되었습니다.\n");
	}
	
	public void find() {
		System.out.print("조회를 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.printf("아이디가 %d인 상품이 없습니다.\n\n", itemId);
		}
		else {
			findItem.showInfo();
			System.out.println("상품 조회가 완료되었습니다.\n");
		}
	}
	
	public void update() {
		System.out.print("수정하기 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.printf("아이디가 %d인 상품이 없습니다.\n\n", itemId);
		}
		else {
			System.out.print("가격, 수량을 입력하세요...");
			Integer price = ItemView.INPUT.nextInt();
			int quantity = ItemView.INPUT.nextInt();
			findItem.setPrice(price);
			findItem.setQuantity(quantity);
			STORE.replace(itemId, findItem);
			System.out.println("상품 수정이 완료되었습니다.\n");
		}
	}
	
	public void delete() {
		System.out.print("삭제를 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.println("해당 상품이 없어서 삭제는 진행하지 않습니다.\n");
		}
		else {
			STORE.remove(itemId);
			System.out.println(itemId + "번 상품이 삭제되었습니다.");
			System.out.println("상품 삭제가 완료되었습니다.\n");
		}
	}
	
	public void findAll() {
		if(STORE.isEmpty()) {
			System.out.println("저장된 상품 정보가 없습니다.\n");
		}
		else {
			Iterator<Entry<Long, Item>> iter = STORE.entrySet().iterator();
			while(iter.hasNext()) 
				iter.next().getValue().showInfo();
			System.out.println();
		}
	}
	
	public void clearStore() {
		STORE.clear();
		sequence = 1l;
		System.out.println("상품의 모든 정보가 삭제되었습니다.\n");
	}
}
