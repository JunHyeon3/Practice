package himedia.secondspring.service;

import java.util.List;
import java.util.Optional;

import himedia.secondspring.domain.Member;
import himedia.secondspring.repository.MemberRepository;

// @Service : 미리 Bean으로 만들어 두는 어노테이션 중 하나이다.
//@Service
public class MemberService {

//	private final MemberRepository memberRepository = new MemoryMemberRepository();
	private final MemberRepository memberRepository;
	
//	@Autowired // 의존성 주입, 생성자가 1개 뿐이라 생략 가능
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	/**
	 * 회원가입
	 */
	public Long join(Member member) {
		memberRepository.save(member);
		return member.getId();
	}
	
	/**
	 * 전체 회원 조회
	 */
	public List<Member> findMember() {
		return memberRepository.findAll();
	}
	
	/**
	 * 아이디로 회원 조회
	 */
	public Optional<Member> findOne(Long memberId) {
		return memberRepository.findById(memberId);
	}
	
}
