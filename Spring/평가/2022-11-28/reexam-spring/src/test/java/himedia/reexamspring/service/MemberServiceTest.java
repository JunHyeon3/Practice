package himedia.reexamspring.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.reexamspring.domain.Member;

@SpringBootTest
@Transactional
class MemberServiceTest {

	@Autowired MemberService memberService;
	
	@Test
	void join() {
		// given
		Member member = new Member();
		member.setName("one");
		
		// when
		Member savedMember = memberService.join(member); 
		
		// then
		assertThat(savedMember.getId()).isEqualTo(member.getId());
	}
	
	@Test
	void findAll() {
		// given
		Member member = new Member();
		member.setName("two");
		
		// when
		List<Member> beforeList = memberService.findAll();
		memberService.join(member);
		List<Member> afterList = memberService.findAll();
		
		// then
		assertThat(afterList.size()).isEqualTo(beforeList.size() + 1);
		assertThat(afterList).isNotEmpty();
	}
	
	@Test
	void findName() {
		Member member = new Member();
		member.setName("three");
		memberService.join(member);
		
		// when
		Member findMember = memberService.findName("three").get();
		
		// then
		assertThat(findMember.getName()).isEqualTo("three");
	}
}
