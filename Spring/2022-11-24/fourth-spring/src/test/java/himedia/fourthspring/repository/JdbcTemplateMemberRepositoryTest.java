package himedia.fourthspring.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.fourthspring.domain.Member;

@SpringBootTest
@Transactional
class JdbcTemplateMemberRepositoryTest {	
	/*
	 * Spring Boot에서는 constructor를 통한 DI를 권장한다.
	 * 
	 * JUnit에서는 test에 필요한 Bean들을 우선적으로 만들도록 생성자를 사용하기 때문에 
	 * 생성자를 통한 DI는 맞지않다.
	 * 
	 * 따라서 JUnit에서는 field를 통한 DI를 권장한다.
	 */
	
	// field를 통한 DI
//	@Autowired DataSource dataSource;
	@Autowired JdbcTemplateMemberRepository repository;
	
	@Test
	void save() {
		// given : 어떤 데이터 - Member 객체에 "홍길동" 사용자
		Member member = new Member();
		member.setName("홍길동");
		
		// when : 무엇을 
		Member savedMember = repository.save(member);
		
		// then : 검증
		// assertThat(테스트 타겟).메서드()		
		assertThat(savedMember.getName()).isEqualTo(member.getName());
	}
	
	@Test
	void findById() {
		// given : 어떤 데이터 - Member 객체에 "박보검" 사용자
		Member member = new Member();
		member.setName("박보검");
		Member savedMember = repository.save(member);
		
		// when : 무엇을
		Member findMember = repository.findById(savedMember.getId()).get();
		
		// then : 검증
		assertThat(findMember.getId()).isEqualTo(member.getId());
		assertThat(findMember).isNotNull();
	}
	
	@Test
	void findByName() {
		// given : 어떤 데이터 - Member 객체에 "권지용" 사용자
		Member member = new Member();
		member.setName("권지용");
		Member savedMember = repository.save(member);
		// cf) member 와 savedMember의 주소는 같다. 
		// 하지만, member에는 id가 없고, savedMember에는 save()메서드에 의해 id가 지정됨 
		
		// when : 무엇을
		Member findMember = repository.findByName(savedMember.getName()).get();
		
		// then : 검증
		assertThat(findMember.getName()).isEqualTo(member.getName());
		assertThat(findMember).isNotNull();
	}
	 
	@Test
	void findAll() {
		// give : 어떤 데이터 - Member 객체에 "둘리", "짱구" 사용자
		Member member1 = new Member();
		member1.setName("둘리");
		Member member2 = new Member();
		member2.setName("짱구");
		
		// when : 무엇을
		List<Member> before = repository.findAll();
		repository.save(member1);
		repository.save(member2);
		List<Member> after = repository.findAll();
		
		// then : 검증
		assertThat(after.size()).isEqualTo(before.size() + 2);
		assertThat(after).isNotEmpty();
	}
}
