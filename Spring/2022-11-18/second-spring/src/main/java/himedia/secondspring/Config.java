package himedia.secondspring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import himedia.secondspring.repository.MemberRepository;
import himedia.secondspring.repository.MemoryMemberRepository;
import himedia.secondspring.service.MemberService;

// 설정과 관련된 class로, Spring Boot 실행시 실행되도록 하는 어노테이션
@Configuration
public class Config {
	/*
	 * [의존성 주입을 위한 Bean 등록 파일]
	 * 의존성 주입을 해주기 위해서는 Bean에 이미 등록이 되어있어야 한다.
	 * 미리 Bean을 등록해두려면, 각 파일에서 어노테이션을 붙여줘야한다.
	 * 하지만, 단계별로 찾아가 어노테이션을 붙여줘야 하고 알아보기 쉽지 않기 때문에
	 * 한 곳에서 한번에 미리 Bean으로 등록해주어 관리하는것이 좋다.
	 */
	
	@Bean
	public MemberRepository memberRepository() {
		return new MemoryMemberRepository();
	}
	
	// DB와 연동
//	private DataSource dataSource;
//	@Autowired
//	public void setDataSource(DataSource dataSource) {
//		this.dataSource = dataSource;
//	}
//	@Bean
//	public MemberRepository memberRepository() {
//		return new JdbcMemberRepository(dataSource);
//	}
	
	@Bean
	public MemberService memberService() {
		return new MemberService(memberRepository());
	}
	
}
