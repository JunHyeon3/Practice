package himedia.seventhspring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import himedia.seventhspring.domain.Item;
import lombok.RequiredArgsConstructor;

//@Repository
@RequiredArgsConstructor
public class JdbcItemRepository implements RepositoryInterface {

	private final JdbcTemplate jdbcTemplate;

	private RowMapper<Item> rowMapper() {
		return (rs, rowNum) -> {
			Item item = new Item(rs.getString("itemName"), rs.getInt("price"), rs.getInt("quantity"));
			item.setId(rs.getLong("id"));
			return item;
		};
	}
	
	@Override
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
	
	@Override
	public Optional<Item> findById(Long id) {
		return jdbcTemplate.query("select * from item where id=?", rowMapper(), id).stream().findAny();
	}
	
	@Override
	public Optional<Item> findByItemName(String itemName) {
		List<Item> result = jdbcTemplate.query("select * from item where itemName=?", rowMapper(), itemName);
		return result.stream().findAny();
	}
	
	@Override
	public List<Item> findAll() {
		return jdbcTemplate.query("select * from item", rowMapper());
	}
	
	@Override
	public void update(Long itemId, Item updateItem) {
		jdbcTemplate.update("update item set itemName=?, price=?, quantity=? where id=?", 
				updateItem.getItemName(), updateItem.getPrice(), updateItem.getQuantity(), itemId);
	}

	@Override
	public void clearStore() {
		jdbcTemplate.update("delete from item");
	}
	
}
