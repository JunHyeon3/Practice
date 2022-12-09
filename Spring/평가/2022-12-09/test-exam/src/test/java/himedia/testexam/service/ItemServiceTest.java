package himedia.testexam.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import himedia.testexam.domain.Item;

@SpringBootTest
@Transactional
class ItemServiceTest {
	@Autowired ItemService itemService;
	
	@Test
	void saveItem() {
		// given 
		Item item = new Item("Test1", 1000, 100); 
		
		// when
		Item savedItem = itemService.saveItem(item);
		
		// then
		assertThat(savedItem).isEqualTo(item);
		assertThat(savedItem.getItemName()).isEqualTo(item.getItemName());
	}
	
	@Test
	void findByIdItem() {
		// given 
		Item item = new Item("Test2", 2000, 200); 
		itemService.saveItem(item);
		
		// when
		Item findItem = itemService.findByIdItem(item.getId()).get();
		
		// then
		assertThat(findItem).isNotNull();
		assertThat(findItem.getItemName()).isEqualTo("Test2");
	}
	
	@Test
	void findByNameItem() {
		// given 
		Item item = new Item("Test3", 3000, 300); 
		itemService.saveItem(item);
		
		// when
		Item findItem = itemService.findByNameItem("Test3").get();
		
		// then
		assertThat(findItem).isNotNull();
		assertThat(findItem.getItemName()).isEqualTo("Test3");
	}
	
	@Test
	void findAllItems() {
		// given 
		List<Item> before = itemService.findAllItems();
		Item item = new Item("Test4", 4000, 400); 
		itemService.saveItem(item);
		
		// when
		List<Item> after = itemService.findAllItems();
		
		// then
		assertThat(after.size()).isEqualTo(before.size() + 1);
	}
	
	@Test
	void updateItem() {
		// given 
		Item item = new Item("Test5", 5000, 500); 
		itemService.saveItem(item);
		
		// when
		itemService.updateItem(item.getId(), new Item("Update", 6000, 600));
		Item findItem = itemService.findByIdItem(item.getId()).get();
		
		// then
		assertThat(findItem.getItemName()).isEqualTo("Update");
	}
}
