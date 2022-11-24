package himedia.fourthspring;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import himedia.fourthspring.repository.JpaMemberRepository;
import himedia.fourthspring.repository.MemberRepository;
import himedia.fourthspring.service.MemberService;

@Configuration
public class Config {
	
	private EntityManager em;
	@Autowired
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	@Bean
	public MemberRepository setMemberRepository() {
		return new JpaMemberRepository(em);
	}
	
	@Bean
	public MemberService setmMemberService() {
		return new MemberService(setMemberRepository());
	}
	
}
