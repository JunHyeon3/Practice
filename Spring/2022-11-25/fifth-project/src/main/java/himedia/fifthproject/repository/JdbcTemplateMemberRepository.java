package himedia.fifthproject.repository;

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

import himedia.fifthproject.domain.Member;

//@Repository
public class JdbcTemplateMemberRepository implements MemberRepository {

	// 생성자를 통한 DI를 권장하는 이유!!!
	// -> 의존성 주입으로 생성되는 객체는 "불변성"을 보장하는 것이 좋다.
	// -> 따라서 final로 선언하게 되고, final 변수는 생성자로 초기화 해줘야 하기 때문이다.
	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcTemplateMemberRepository(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private RowMapper<Member> memberRowMapper() {
		return (rs, rowNum) -> {
			Member member = new Member();
			member.setId(rs.getLong("id"));
			member.setName(rs.getString("name"));
			return member;
		};
	}

	@Override
	public Member save(Member member) {
		SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		
		jdbcInsert.withTableName("member").usingGeneratedKeyColumns("id");
		
		// 매개변수 member에서 이름을 추출하여 HashMap에 저장
		Map<String, String> parameter = new HashMap<>();
		parameter.put("name", member.getName());
		
		// HashMap에 저장된 데이터로 SQL 실행 후 생성된(저장된) key(id) 리턴
		Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parameter));
		
		// 리턴 받은 키 값(id)을 member에 저장
		member.setId(key.longValue());
		
		return member;
	}

	@Override
	public Optional<Member> findById(Long id) {
		List<Member> result =  jdbcTemplate.query("select * from member where id=?", memberRowMapper(), id);
		
		// 비효율적인 코드 : Stream으로 변경예정 =====================
		for(Member member: result) {
			if(member.getId().equals(id))
				return Optional.ofNullable(member);
		}
		
		return Optional.empty();
		// ===========================================================
	}

	@Override
	public Optional<Member> findByName(String name) {
		List<Member> result =  jdbcTemplate.query("select * from member where name=?", memberRowMapper(), name);
		
		// 비효율적인 코드 : Stream으로 변경예정 =====================
		for(Member member: result) {
			if(member.getName().equals(name))
				return Optional.ofNullable(member);
		}
		
		return Optional.empty();
		// ===========================================================
	}

	@Override
	public List<Member> findAll() {
		return jdbcTemplate.query("select * from member", memberRowMapper());
	}
	
}
