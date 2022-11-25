package himedia.fifthproject.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.fifthproject.domain.Member;

@SpringBootTest
@Transactional
class JdbcTemplateMemberRepositoryTest {

	@Autowired DataSource dataSource;
	@Autowired JdbcTemplateMemberRepository repository;
	
	@Test
	void save() {
		// given
		Member member = new Member();
		member.setName("one");
		
		// when
		Member result = repository.save(member);
		
		// then
		assertThat(result.getName()).isEqualTo(member.getName());
	}
	
	@Test
	void findById() {
		// given
		Member member = new Member();
		member.setName("two");
		repository.save(member);
		
		// when
		Member result = repository.findById(member.getId()).get();
				
		// then
		assertThat(result.getId()).isEqualTo(member.getId());
		assertThat(result).isNotNull();
	}
	
	@Test
	void findByName() {
		// given
		Member member = new Member();
		member.setName("three");
		repository.save(member);
		
		// when
		Member result = repository.findByName(member.getName()).get();
		
		// then
		assertThat(result.getName()).isEqualTo(member.getName());
		assertThat(result).isNotNull();
	}
	
	@Test
	void findAll() {
		// given
		List<Member> before = repository.findAll();
		Member member = new Member();
		member.setName("four");
		repository.save(member);
		
		// when
		List<Member> after = repository.findAll();
		
		// then
		assertThat(after.size()).isEqualTo(before.size() + 1);
		assertThat(after).isNotEmpty();
	}

}
