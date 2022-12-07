package himedia.seventhspring.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import himedia.seventhspring.domain.Item;
import lombok.RequiredArgsConstructor;

//@Repository
@Transactional
@RequiredArgsConstructor
public class JpaItemRepository implements RepositoryInterface{
	
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
	public Optional<Item> findByItemName(String itemName) {
		return em.createQuery("select i from Item i where i.itemName = :itemName", Item.class)
				.setParameter("itemName", itemName).getResultList().stream().findAny();
	}

	@Override
	public List<Item> findAll() {
		return em.createQuery("select i from Item i", Item.class).getResultList();
	}

	// excuteUpdate() : 작성한 쿼리문을 수행시켜 주는 메서드이다. Int 타입 값을 반환한다.
	@Override
	public void update(Long itemId, Item updateItem) {
		em.createQuery("update Item i set itemName = :itemName, price = :price, quantity = :quantity where id = :id")
				.setParameter("itemName", updateItem.getItemName()).setParameter("price", updateItem.getPrice())
				.setParameter("quantity", updateItem.getQuantity()).setParameter("id", itemId).executeUpdate();
	}

	@Override
	public void clearStore() {
		em.createQuery("delete Item i").executeUpdate();
	}
	
}
