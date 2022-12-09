package himedia.testexam.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import himedia.testexam.domain.Item;
import lombok.RequiredArgsConstructor;

@Repository
@Transactional
@RequiredArgsConstructor
public class ItemJpaRepository implements ItemRepository{
	private final EntityManager em;

	@Override
	public Item save(Item item) {
		em.persist(item);
		return item;
	}

	@Override
	public Optional<Item> findById(Long id) {
		return Optional.ofNullable(em.find(Item.class, id));
	}

	@Override
	public Optional<Item> findByName(String name) {
		return em.createQuery("select i from Item i where i.itemName=:name", Item.class)
				.setParameter("name", name)
				.getResultStream()
				.findAny();
	}

	@Override
	public List<Item> findAll() {
		return em.createQuery("select i from Item i", Item.class)
				.getResultList();
	}

	@Override
	public void update(Long itemId, Item updateItem) {
		String query = "update Item i set itemName=:itemName, price=:price, quantity=:quantity where id = :id";
		em.createQuery(query)
			.setParameter("itemName", updateItem.getItemName())
			.setParameter("price", updateItem.getPrice())
			.setParameter("quantity", updateItem.getQuantity())
			.setParameter("id", itemId)
			.executeUpdate();
	}
}
