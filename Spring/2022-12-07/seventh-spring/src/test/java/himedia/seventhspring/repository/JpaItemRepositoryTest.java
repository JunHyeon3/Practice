package himedia.seventhspring.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import himedia.seventhspring.domain.Item;

@SpringBootTest
@Transactional
class JpaItemRepositoryTest {

	@Autowired JpaItemRepository itemRepository;
	
	@AfterEach
	void clear() {
		itemRepository.clearStore();
	}
	
	@Test
	void save() {
		// given
		Item item = new Item("사과", 100, 200);
		
		// when
		Item savedItem = itemRepository.save(item);
		
		// then
		assertThat(savedItem).isEqualTo(item);
	}
	
	@Test
	void findById() {
		// given
		Item item = new Item("사과", 100, 200);
		itemRepository.save(item);
		
		// when
		Item findItem = itemRepository.findById(item.getId()).get();
		
		// then
		assertThat(findItem.getId()).isEqualTo(item.getId());
	}
	
	@Test
	void findByName() {
		// given
		Item item = new Item("사과", 100, 200);
		itemRepository.save(item);
		
		// when
		Item findItem = itemRepository.findByItemName(item.getItemName()).get();
		
		// then
		assertThat(findItem.getItemName()).isEqualTo("사과");
	}
	
	@Test
	void findAll() {
		// given
		List<Item> before = itemRepository.findAll();
		Item item = new Item("사과", 100, 200);
		itemRepository.save(item);
		
		// when
		List<Item> after = itemRepository.findAll();
		
		// then
		assertThat(after.size()).isEqualTo(before.size() + 1);
	}
	
	@Test
	void update() {
		// given
		Item item = new Item("사과", 100, 200);
		itemRepository.save(item);
		Item updateItem = new Item("포도", 200, 300);
		
		
		
		// when
		itemRepository.update(item.getId(), updateItem);
		
		// then
		assertThat(item.getItemName()).isEqualTo(updateItem.getItemName());
		assertThat(item.getPrice()).isEqualTo(updateItem.getPrice());
		assertThat(item.getQuantity()).isEqualTo(updateItem.getQuantity());
	}
	
	@Test
	void clearStore() {
		// given
		Item item = new Item("사과", 100, 200);
		itemRepository.save(item);
		
		// when
		itemRepository.clearStore();
		List<Item> list = itemRepository.findAll();
		
		// then
		assertThat(list.size()).isEqualTo(0);
	}

}
