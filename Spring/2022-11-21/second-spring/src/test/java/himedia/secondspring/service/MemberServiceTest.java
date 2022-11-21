package himedia.secondspring.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import himedia.secondspring.domain.Member;
import himedia.secondspring.repository.MemoryMemberRepository;

class MemberServiceTest {
	// [방법1] 
//	MemberService memberService = new MemberService(new MemoryMemberRepository());
	
	// [방법2] - clearStore() 메서드를 사용하기 위해
//	MemoryMemberRepository memberRepository = new MemoryMemberRepository();
//	MemberService memberService = new MemberService(memberRepository);
	
	// [방법3]
	MemoryMemberRepository memberRepository;
	MemberService memberService;
	// 단위 테스트 전, 객체를 생성함	
	@BeforeEach
	void beforeEach() {
		memberRepository = new MemoryMemberRepository();
		memberService = new MemberService(memberRepository);
	}
	
	// 단위 테스트 후, store에 저장된 노드 모두 삭제
	@AfterEach
	void afterEach() {
		memberRepository.clearStore();
	}
	
	@Test
	void 회원가입() {
		// given : 어떤 데이터 - Member 객체에 one 사용자
		Member member = new Member();
		member.setName("one");
		
		// when : 무엇 검증 - 가입
		Long saveId = memberService.join(member);
		
		// then : 검증 - 가입한 사용자 one과 저장된 one의 객체 주소가 같은지 검증
		Member findMember = memberService.findOne(saveId).get();
		
		assertThat(member).isEqualTo(findMember);
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
