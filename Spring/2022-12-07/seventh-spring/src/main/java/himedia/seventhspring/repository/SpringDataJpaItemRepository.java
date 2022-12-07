package himedia.seventhspring.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import himedia.seventhspring.domain.Item;

@Repository
@Transactional
public interface SpringDataJpaItemRepository extends JpaRepository<Item, Long>, RepositoryInterface {
	
	@Override
	default void update(Long itemId, Item updateItem) {
		Item findItem = findById(itemId).get();
		findItem.setItemName(updateItem.getItemName());
		findItem.setPrice(updateItem.getPrice());
		findItem.setQuantity(updateItem.getQuantity());
	}
	
	@Override
	default void clearStore() {
		deleteAll();
	}
	
}
