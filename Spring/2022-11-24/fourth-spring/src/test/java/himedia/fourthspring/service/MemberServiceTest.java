package himedia.fourthspring.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.fourthspring.domain.Member;

@SpringBootTest
@Transactional
class MemberServiceTest {

	@Autowired MemberService memberService;
	
	@Test
	void join() {
		// given : "홍길동" 사용자
		Member member = new Member();
		member.setName("홍길동");
		
		// when
		Long savedId = memberService.join(member); 
		
		// then
		assertThat(savedId).isEqualTo(member.getId());
	}
	
	@Test
	void findAllMember() {
		// given : "둘리", "짱구" 사용자
		Member member1 = new Member();
		member1.setName("둘리");
		Member member2 = new Member();
		member2.setName("짱구");
		
		// when : 무엇을
		List<Member> beforeList = memberService.findAllMember();
		memberService.join(member1);
		memberService.join(member2);
		List<Member> afterList = memberService.findAllMember();
		
		// then : 검증
		assertThat(afterList.size()).isEqualTo(beforeList.size() + 2);
		assertThat(afterList).isNotEmpty();
	}
	
	@Test
	void findId() {
		// given : "박보검" 사용자
		Member member = new Member();
		member.setName("박보검");
		Long savedId = memberService.join(member);
		
		// when
		Member findMember = memberService.findId(savedId).get();
		
		// then
		assertThat(findMember.getId()).isEqualTo(savedId);
	}
	
	@Test
	void findName() {
		// given : "이미자" 사용자
		Member member = new Member();
		member.setName("이미자");
		memberService.join(member);
		
		// when
		Member findMember = memberService.findName("이미자").get();
		
		// then
		assertThat(findMember.getName()).isEqualTo("이미자");
	}
	
//	@Test
//	void searchPost() {
//		// given
//		Member member = new Member();
//		member.setName("다니엘");
//		memberService.join(member);
//		
//		SearchForm searchForm = new SearchForm();
//		searchForm.setId(member.getId());
//		
//		// when
//		String result = memberController.search(searchForm, model);
//		
//		// then
//		assertThat(result).isEqualTo("member/search");
//		
//	}

}
