package himedia.secondspring.repository;

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

import himedia.secondspring.domain.Member;

public class JdbcTemplateMemberRepository implements MemberRepository {

	private final JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcTemplateMemberRepository(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// RowMapper : Template을 사용하기 위해 필요함
	private RowMapper<Member> memberRowMapper() {
		// 익명 클래스
//		return new RowMapper<Member>() {
//			@Override
//			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//				Member member = new Member();
//				member.setId(rs.getLong("id"));
//				member.setName(rs.getString("name"));
//				return member;
//			}
//		};
		// 익명 클래스 -> 람다식
		// 오버라이딩 된 영역을 블록 지정한 후, ctrl + 1을 누르면 자동으로 람다식으로 변경해줌
		return (rs, rowNum) -> {
				Member member = new Member();
				member.setId(rs.getLong("id"));
				member.setName(rs.getString("name"));
				System.out.println("[memberRowMapper method] rowNum >> " + rowNum);
				return member;
			};
	}

	@Override
	public Member save(Member member) {
		System.out.println("[save method] 실행");
		SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		
		// member 테이블에 id는 자동으로 1씩 증가되도록 함
		jdbcInsert.withTableName("member").usingGeneratedKeyColumns("id");
		
		// id는 자동으로 1씩 증가되므로, name만 HashMap에 저장
		Map<String, Object> parmeters = new HashMap<>();
		parmeters.put("name", member.getName());
		
		// data를 가지고 insert문 실행
		Number key = jdbcInsert.executeAndReturnKey(new MapSqlParameterSource(parmeters));
		System.out.println("[save method] DB에 저장된 후 반환되는 key" + key);
		
		// member 객체에는 name만 저장되어 있으므로, 증가된 key를 넣어줌
		member.setId(key.longValue());
		
		System.out.println("[save method] 종료");
		return member;
	}

	@Override
	public Optional<Member> findById(long id) {
		// 파라미터로 전달되는 id가 ? 자리에 들어감 
		List<Member> result = jdbcTemplate.query("select * from member where id=?", memberRowMapper(), id);
		
		for(Member member: result) {
			if(member.getId().equals(id))
				return Optional.ofNullable(member);
		}
		
		return Optional.empty();
	}

	@Override
	public Optional<Member> findByName(String name) {
		List<Member> result = jdbcTemplate.query("select * from member where name=?", memberRowMapper(), name);
		
		for(Member member: result) {
			if(member.getName().equals(name))
				return Optional.ofNullable(member);
		}
		
		return Optional.empty();
	}

	@Override
	public List<Member> findAll() {
		return jdbcTemplate.query("select * from member", memberRowMapper());
	}
}
