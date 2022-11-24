package himedia.fourthspring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import himedia.fourthspring.domain.Member;
import himedia.fourthspring.repository.MemberRepository;

//@Service
public class MemberService {
	
	// DI로 주입한 객체는 변경이 되지 않기를 원하기 때문에 final 변수로 한다. 
	private final MemberRepository memberRepository;

	// final 변수는 값을 바로 초기화 하거나, 생성자를 통해 초기화 해주어야 하기 때문에, 생성자를 통해 DI를 한다.
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	/**
	 * 회원 가입
	 */
	public Long join(Member member) {
		memberRepository.save(member);
		
		return member.getId();
	}
	
	/**
	 * 전체 회원 조회
	 */
	public List<Member> findAllMember() {
		return memberRepository.findAll();
	}
	
	/**
	 * 특정 회원 조회
	 */
	public Optional<Member> findId(Long memberId) {
		return memberRepository.findById(memberId);
	}
	
	public Optional<Member> findName(String memberName) {
		return memberRepository.findByName(memberName);
	}
	
}
