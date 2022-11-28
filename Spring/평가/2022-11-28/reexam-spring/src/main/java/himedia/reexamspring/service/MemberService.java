package himedia.reexamspring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import himedia.reexamspring.domain.Member;
import himedia.reexamspring.repository.MemberRepository;

@Service
public class MemberService {
	
	private final MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public Member join(Member member) {
		memberRepository.save(member);
		return member;
	}
	
	public List<Member> findAll() {
		return memberRepository.findAll();
	}
	
	public Optional<Member> findName(String name) {
		return memberRepository.findByName(name);
	}
	
}
