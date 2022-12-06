package himedia.seventhspring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import himedia.seventhspring.domain.Item;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class JdbcItemRepository {

	private final JdbcTemplate jdbcTemplate;

	private RowMapper<Item> rowMapper() {
		return (rs, rowNum) -> {
			Item item = new Item(rs.getString("itemName"), rs.getInt("price"), rs.getInt("quantity"));
			item.setId(rs.getLong("id"));
			return item;
		};
	}
	
	public Item save(Item item) {
		SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		
		jdbcInsert.withTableName("item").usingGeneratedKeyColumns("id");
		
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("itemName", item.getItemName());
		parameter.put("price", item.getPrice());
		parameter.put("quantity", item.getQuantity());
		
		Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameter));
		
		item.setId(key.longValue());
		
		return item;
	}
	
	public Item findById(Long id) {
		List<Item> result = jdbcTemplate.query("select * from item where id=?", rowMapper(), id);
		return result.stream().findAny().get();
	}
	
	public Optional<Item> findByName(String itemName) {
		List<Item> result = jdbcTemplate.query("select * from item where itemName=?", rowMapper(), itemName);
		return result.stream().findAny();
	}
	
	public List<Item> findAll() {
		return jdbcTemplate.query("select * from item", rowMapper());
	}
	
	public void update(Long itemId, Item updateItem) {
		jdbcTemplate.update("update item set itemName=?, price=?, quantity=? where id=?", 
				updateItem.getItemName(), updateItem.getPrice(), updateItem.getQuantity(), itemId);
	}
	
}
