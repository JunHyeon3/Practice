package himedia.seventhspring.repository;

import java.util.List;
import java.util.Optional;

import himedia.seventhspring.domain.Item;

public interface RepositoryInterface {
	public Item save(Item item);
	
	public Optional<Item> findById(Long id);
	
	public Optional<Item> findByItemName(String itemName);
	
	public List<Item> findAll();
	
	public void update(Long itemId, Item updateItem);
	
	public void clearStore();
}
