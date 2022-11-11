package item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class ItemBusinessRule {
	private static final Map<Long, Item> STORE = new HashMap<Long, Item>();
	private static Long sequence = 0l;
	
	private Item findById(Long itemId) {
		// get() 메서드 자체가 key에 해당하는 value가 없으면 null을 반환함
		return STORE.get(itemId);
	}
	
	public void save() {
		System.out.print("상품명, 가격, 수량을 순서대로 입력하세요... ");
		String itemName = ItemView.INPUT.next();
		Integer price = ItemView.INPUT.nextInt();
		int quantity = ItemView.INPUT.nextInt();
		
		Item item = new Item(itemName, price, quantity);
		item.setId(++sequence);
		STORE.put(item.getId(), item);
		
		System.out.println("상품 정보가 저장되었습니다.");
	}
	
	public void find() {
		System.out.print("조회를 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.printf("아이디가 %d인 상품이 없습니다.\n", itemId);
		}
		else {
			findItem.showInfo();
			System.out.println("상품 조회가 완료되었습니다.");
		}
	}
	
	public void update() {
		System.out.print("수정하기 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.printf("아이디가 %d인 상품이 없습니다.\n", itemId);
			// if 코드는 짧고 else의 코드가 길어지면, if에서 return 해주는게 가독성이 좋음
			return;
		}
		System.out.print("가격, 수량을 입력하세요...");
		Integer price = ItemView.INPUT.nextInt();
		int quantity = ItemView.INPUT.nextInt();
		
		findItem.setPrice(price);
		findItem.setQuantity(quantity);
		System.out.println("상품 수정이 완료되었습니다.");
	}
	
	public void delete() {
		System.out.print("삭제를 원하는 아이디를 입력하세요... ");
		Long itemId = ItemView.INPUT.nextLong();
		
		Item findItem = findById(itemId);
		if(findItem == null) {
			System.out.println("해당 상품이 없어서 삭제는 진행하지 않습니다.");
		}
		else {
			STORE.remove(itemId);
			System.out.printf("아이디가 %d인 상품이 삭제되었습니다.\n", itemId);
			System.out.println("상품 삭제가 완료되었습니다.");
		}
	}
	
	public void findAll() {
//		if(STORE.isEmpty()) {
//			System.out.println("저장된 상품 정보가 없습니다.\n");
//		}
//		else {
//			Iterator<Entry<Long, Item>> iter = STORE.entrySet().iterator();
//			while(iter.hasNext()) 
//				iter.next().getValue().showInfo();
//		}
		
		if(STORE.size() == 0) {
			System.out.println("저장된 상품 정보가 없습니다.");
			return;
		}
		ArrayList<Item> item = new ArrayList<Item>(STORE.values());
		Iterator<Item> iter = item.iterator();
		while(iter.hasNext())
			iter.next().showInfo();
	}
	
	public void clearStore() {
		STORE.clear();
		sequence = 0l;
		System.out.println("상품의 모든 정보가 삭제되었습니다.");
	}
}
