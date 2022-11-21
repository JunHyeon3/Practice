package himedia.secondspring.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import himedia.secondspring.domain.Member;

// @SpringBootTest : test용으로 spring boot가 실행되도록 하는 어노테이션
// 의존성 주입을 config 파일에서 하므로 spring boot가 실행되어야 한다.
// @Transactional : test를 하지만 DB에 저장은 하지 않도록(rollback) 하는 어노테이션
@SpringBootTest
@Transactional
class MemberServiceIntegrationTest {
	// [방법4] - 의존성 주입
	// Spring Container가 실행되므로 없어도 된다.
//	@Autowired JdbcTemplateMemberRepository memberRepository;
	@Autowired MemberService memberService;
	
	@Test
	void 회원가입() {
		// given : 어떤 데이터 - Member 객체에 one 사용자
		Member member = new Member();
		member.setName("one");
		
		// when : 무엇 검증 - 가입
		Long saveId = memberService.join(member);
		
		// then : 검증 - 가입한 사용자 one과 저장된 one의 객체 주소가 같은지 검증
		Member findMember = memberService.findOne(saveId).get();
		
		// findOne() 메서드로 DB에서 반환된 객체의 주소와는 같을 수 없음
		// Why? DB에서 row의 데이터를 새로운 객체를 생성하여 담아서 반환한다.
//		assertThat(member).isEqualTo(findMember);
		assertThat(member.getName()).isEqualTo(findMember.getName());
	}

	@Test
	void 중복회원확인() {
		// given : 어떤 데이터 
		Member member1 = new Member();
		member1.setName("one");
		
		Member member2 = new Member();
		member2.setName("one");
		
		// when : 무엇 검증 
		Long saveId1 = memberService.join(member1);
		Long saveId2 = memberService.join(member2);
		
		// then : 검증 
		Member findMember1 = memberService.findOne(saveId1).get();
		Member findMember2 = memberService.findOne(saveId2).get();
		
		assertThat(saveId1).isNotEqualTo(saveId2);
		assertThat(findMember1.getName()).isEqualTo(findMember2.getName());
	}
	
}
