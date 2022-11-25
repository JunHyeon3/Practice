package himedia.fifthproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import himedia.fifthproject.repository.MemberRepository;
import himedia.fifthproject.service.MemberService;

@Configuration
public class Config {
	
	private final MemberRepository memberRepository;
	
	@Autowired
	public Config(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Bean
	public MemberService setMemberService() {
		return new MemberService(memberRepository);
	}
	
}
