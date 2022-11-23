package himedia.fourthspring.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import himedia.fourthspring.domain.Member;

//@Repository
public class JdbcTemplateMemberRepository implements MemberRepository {

	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcTemplateMemberRepository(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private RowMapper<Member> rowMapper() {
		return (rs, rowNum) -> {
			Member member = new Member();
			member.setId(rs.getLong("id"));
			member.setName(rs.getString("name"));
			return member;
		};
	}
	
	@Override
	public Member save(Member member) {
		System.out.println("[save method] 시작");
		SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		
		jdbcInsert.withTableName("member").usingGeneratedKeyColumns("id");
		
		Map<String, String> parameter = new HashMap<>();
		parameter.put("name", member.getName());
		
		Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameter));
		System.out.println("[save method] DB에 저장 후 key >> " + key);
		
		member.setId(key.longValue());
		System.out.println("[save method] 종료");
		
		return member;
	}

	@Override
	public Optional<Member> findById(Long id) {
		List<Member> result = jdbcTemplate.query("select * from member where id=?", rowMapper(), id);
		
		for(Member member: result) {
			if(member.getId().equals(id))
				return Optional.ofNullable(member);
		}
		return Optional.empty();
	}

	@Override
	public Optional<Member> findByName(String name) {
		List<Member> result = jdbcTemplate.query("select * from member where name=?", rowMapper(), name);
		
		for(Member member: result) {
			if(member.getName().equals(name))
				return Optional.ofNullable(member);
		}
		return Optional.empty();
	}

	@Override
	public List<Member> findAll() {
		return jdbcTemplate.query("select * from member", rowMapper());
	}
	
}
