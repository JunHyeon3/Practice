package himedia.seventhspring.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import himedia.seventhspring.domain.Item;

//@Repository
public class ItemRepository implements RepositoryInterface {

		private static final Map<Long, Item> store = new HashMap<>();
		private static long sequence = 0L;
		
		@Override
		public Item save(Item item) {
			item.setId(++sequence);
			store.put(item.getId(), item);
			return item;
		}
		
		@Override
		public Optional<Item> findById(Long id) {
			return Optional.ofNullable(store.get(id));
		}
		
		// [추가] findByName
		@Override
		public Optional<Item> findByItemName(String itemName) {
			return store.values().stream().filter(t -> t.getItemName().equals(itemName)).findAny();
		}
		
		@Override
		public List<Item> findAll() {
			return new ArrayList<>(store.values());
		}
		
		@Override
		public void update(Long itemId, Item updateItem) {
			Item findItem = findById(itemId).get();
			findItem.setItemName(updateItem.getItemName());
			findItem.setPrice(updateItem.getPrice());
			findItem.setQuantity(updateItem.getQuantity());
			
		}
		
		@Override
		public void clearStore() {
			store.clear();
		}
	
}
