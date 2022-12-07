package himedia.seventhspring.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import himedia.seventhspring.domain.Item;

@SpringBootTest
class ItemRepositoryTest {

	@Autowired ItemRepository itemRepository;
	
	@AfterEach
	public void afterEach() {
		itemRepository.clearStore();
	}
	
	@Test
	public void save() {
		// given
		Item item = new Item("포도", 2500, 100);
		
		// when
		Item savedItem = itemRepository.save(item);
		
		// then
		assertThat(savedItem).isEqualTo(item);
	}
	
	@Test
	public void findById() {
		// given
		Item item = new Item("귤", 2500, 100);
		itemRepository.save(item);
		
		// when
		Item findItem = itemRepository.findById(item.getId()).get();
		
		// then
		assertThat(findItem).isEqualTo(item);
	}
	
	@Test
	public void findByName() {
		// given
		Item item = new Item("자몽", 2500, 100);
		itemRepository.save(item);
		
		// when
		Item findItem = itemRepository.findByItemName(item.getItemName()).get();
		
		// then
		assertThat(findItem).isEqualTo(item);
	}
	
	@Test
	public void findAll() {
		// given
		Item item1 = new Item("수박", 2500, 100);
		itemRepository.save(item1);
		
		Item item2 = new Item("사과", 2500, 100);
		itemRepository.save(item2);
		
		// when
		List<Item> itemList = itemRepository.findAll();
		
		// then
		assertThat(itemList.size()).isEqualTo(2);
	}
	
	@Test
	public void update() {
		// given
		Item item1 = new Item("파인애플", 2500, 100);
		itemRepository.save(item1);
		
		// when
		Item item2 = new Item("망고", 2500, 100);
		itemRepository.update(item1.getId(), item2);
		
		// then
		assertThat(item1.getItemName()).isEqualTo(item2.getItemName());
		assertThat(item1.getPrice()).isEqualTo(item2.getPrice());
		assertThat(item1.getQuantity()).isEqualTo(item2.getQuantity());
	}
	
	@Test
	public void clear() {
		// given
		Item item = new Item("딸기", 2500, 100);
		itemRepository.save(item);
		
		// when
		itemRepository.clearStore();
		List<Item> itemList = itemRepository.findAll();
		
		// then
		assertThat(itemList.size()).isEqualTo(0);
	}

}
