package himedia.secondspring.repository;

import static org.assertj.core.api.Assertions.assertThat;
// assertEquals는 직접 import 
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import himedia.secondspring.domain.Member;


// 통합 Test를 할 경우, 메서드 작성 순서와 상관없이 진행되기 때문에  정확한 Test가 안될 수 있다.
// 따라서, 메서드 단위로 Test 하거나, 메서드가 끝날 때 저장소를 비워주는 것이 좋다.
public class MemoryMemberRepositoryTest {
	
	MemoryMemberRepository repository = new  MemoryMemberRepository();
	
	// 각 테스트가 끝날 때마다 실행되도록 지정하는 어노테이션
	@AfterEach
	void afterEach() {
		repository.clearStore();
	}
	
	// Test 메서드임을 지정하는 어노테이션
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
		Member member = new Member();
		member.setName("hong");
		repository.save(member);
		
		Member result = repository.findByName("hong").get();
		
		assertThat(result).isEqualTo(member);
		assertThat(result.getName()).isEqualTo("hong");
	}
}
