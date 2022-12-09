package himedia.testexam.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import himedia.testexam.domain.Item;

@SpringBootTest
//@Transactional
class ItemJpaRepositoryTest {
	@Autowired ItemJpaRepository itemJpaRepository;
	
	@Test
	void save() {
		// given 
		Item item = new Item("One", 2000, 100); 
		
		// when
		Item savedItem = itemJpaRepository.save(item);
		
		// then
		assertThat(savedItem).isEqualTo(item);
		assertThat(savedItem.getItemName()).isEqualTo(item.getItemName());
	}

	@Test
	void findById() {
		// given 
		Item item = new Item("Two", 2000, 200); 
		itemJpaRepository.save(item);
		
		// when
		Item findItem = itemJpaRepository.findById(item.getId()).get();
		
		// then
		assertThat(findItem).isNotNull();
		assertThat(findItem.getItemName()).isEqualTo("Two");
	}
	
	@Test
	void findByName() {
		// given 
		Item item = new Item("Three", 3000, 300); 
		itemJpaRepository.save(item);
		
		// when
		Item findItem = itemJpaRepository.findByName("Three").get();
		
		// then
		assertThat(findItem).isNotNull();
		assertThat(findItem.getItemName()).isEqualTo("Three");
	}
	
	@Test
	void findAll() {
		// given 
		List<Item> before = itemJpaRepository.findAll();
		Item item = new Item("Four", 4000, 400); 
		itemJpaRepository.save(item);
		
		// when
		List<Item> after = itemJpaRepository.findAll();
		
		// then
		assertThat(after.size()).isEqualTo(before.size() + 1);
	}
	
	@Test
	void update() {
		// given 
		Item item = new Item("Five", 5000, 500); 
		itemJpaRepository.save(item);
		
		// when
		itemJpaRepository.update(item.getId(), new Item("Update", 6000, 600));
		Item findItem = itemJpaRepository.findById(item.getId()).get();
		
		// then
		assertThat(findItem.getItemName()).isEqualTo("Update");
	}
}
