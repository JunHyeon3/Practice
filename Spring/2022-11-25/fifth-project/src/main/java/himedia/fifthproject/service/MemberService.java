package himedia.fifthproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import himedia.fifthproject.domain.Member;
import himedia.fifthproject.repository.MemberRepository;

//@Service
public class MemberService {

	private final MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public Long join(Member member) {
		memberRepository.save(member);
		
		return member.getId();
	}
	
	public List<Member> findAllMembers() {
		return memberRepository.findAll();
	}
	
	public Optional<Member> findOne(Long memberId) {
		return memberRepository.findById(memberId);
	}
	
	public Optional<Member> findOne(String memberName) {
		return memberRepository.findByName(memberName);
	}
	
}
