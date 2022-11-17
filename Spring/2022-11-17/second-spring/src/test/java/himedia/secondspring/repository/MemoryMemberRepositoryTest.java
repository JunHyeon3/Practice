package himedia.secondspring.repository;

import static org.assertj.core.api.Assertions.assertThat;
// assertEquals는 직접 import 
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;

import himedia.secondspring.domain.Member;

public class MemoryMemberRepositoryTest {
	
	MemoryMemberRepository repository = new  MemoryMemberRepository();
	
	@Test
	public void save() {
		Member member = new Member();
		member.setName("spring");
		repository.save(member);
		
		// 1. 검증
		// Optional 래퍼 클래스로 감싸져 있으므로, 감싸진 값을 get()으로 꺼내옴
		Member result = repository.findById(member.getId()).get();

		assertEquals(member, result);
		assertThat(member).isEqualTo(result);
	}
	
	@Test
	public void findAll() {
		Member member1 = new Member();
		member1.setName("hong");
		repository.save(member1);
		
		Member member2 = new Member();
		member2.setName("park");
		repository.save(member2);
		
		List<Member> result = repository.findAll();
		assertThat(result.size()).isEqualTo(2);
	}
	
	@Test
	public void findByName() {
		Member member3 = new Member();
		member3.setName("Kim");
		repository.save(member3);
		
		Member member4 = new Member();
		member4.setName("Lee");
		repository.save(member4);
		
		Member result = repository.findByName(member3.getName()).get();
		
		assertThat(member3).isEqualTo(result);
		assertThat(result.getName()).isEqualTo("Kim");
	}
}
