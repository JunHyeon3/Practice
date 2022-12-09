package himedia.testexam.repository;

import java.util.List;
import java.util.Optional;

import himedia.testexam.domain.Item;

public interface ItemRepository {
	Item save(Item item);
	Optional<Item> findById(Long id);
	Optional<Item> findByName(String name);
	List<Item> findAll();
	void update(Long itemId, Item updateItem);
}
