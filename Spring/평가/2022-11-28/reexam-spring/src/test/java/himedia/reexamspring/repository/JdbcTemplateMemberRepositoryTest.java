package himedia.reexamspring.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.reexamspring.domain.Member;

@SpringBootTest
@Transactional
class JdbcTemplateMemberRepositoryTest {

	@Autowired JdbcTemplateMemberRepository repository;
	
	@Test
	void save() {
		// given
		Member member = new Member();
		member.setName("one");
		
		// when
		Member savedMember = repository.save(member);
		
		// then
		assertThat(savedMember.getName()).isEqualTo(member.getName());
	}
	
	@Test
	void findById() {
		// given
		Member member = new Member();
		member.setName("two");
		Member savedMember = repository.save(member);
		
		// when
		Member findMember = repository.findById(savedMember.getId()).get();
		
		// then
		assertThat(findMember.getId()).isEqualTo(member.getId());
		assertThat(findMember).isNotNull();
	}
	
	@Test
	void findByName() {
		// given
		Member member = new Member();
		member.setName("three");
		Member savedMember = repository.save(member);
		
		// when
		Member findMember = repository.findByName(savedMember.getName()).get();
		
		// then
		assertThat(findMember.getName()).isEqualTo(member.getName());
		assertThat(findMember).isNotNull();
	}
	 
	@Test
	void findAll() {
		// given
		Member member = new Member();
		member.setName("four");
		
		// when
		List<Member> before = repository.findAll();
		repository.save(member);
		List<Member> after = repository.findAll();
		
		// then
		assertThat(after.size()).isEqualTo(before.size() + 1);
		assertThat(after).isNotEmpty();
	}
}
