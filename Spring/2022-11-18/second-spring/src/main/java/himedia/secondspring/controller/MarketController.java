package himedia.secondspring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.secondspring.domain.Member;
import himedia.secondspring.domain.MemberForm;
import himedia.secondspring.service.MemberService;

@Controller
public class MarketController {
	
	/*
	 * [의존성 주입, DI]
	 * - 메서드에서 사용된다. 생성자에서 사용하는 것을 권장한다.
	 * - 구현이 되어있어야 하고, Bean이 미리 만들어져 있어야 한다.
	 * - @Autowired 어노테이션을 사용하여 의존성 주입을 명시한다.
	 * - 단, 생성자가 하나만 있을경우 어노테이션 생략이 가능하다.
	 * 
	 * - MemberService는 의존성 주입으로 사용된다. 따라서 MemberService가 Bean으로 생성되어 있어야 한다.
	 * - MemberService를 찾아가 미리 Bean으로 등록하는 @Service 어노테이션을 붙여준다.
	 * - MemberService에서 MemberRepository가 의존성 주입으로 사용된다.
	 * - 따라서 MemberRepository도 Bean으로 생성되어 있어야 한다.
	 * - MemberRepository는 인터페이스 이므로 MemoryMemberRepository에 @Repositoy 어노테이션을 붙여준다.
	 */
	
//	private final MemberService memberService = new MemberService(new MemoryMemberRepository());
	private final MemberService memberService;
	
//	@Autowired // 생성자가 1개 뿐이므로 생략가능
	public MarketController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/")
	public String welcome() {
		return "welcome";
	}
	
	@GetMapping("/members/new")
	public String newForm() {
		return "members/newForm";
	}
	
	// post 방식으로 전달되는 Data는 알아서 memberForm에 저장됨
	@PostMapping("/members/new")
	public String form(MemberForm memberForm) {
		Member member = new Member();
		member.setName(memberForm.getUserName());
		
		System.out.println(member.getName());
		
		memberService.join(member);
		
//		return "welcome";
		// redirect : 재요청 - server의 응답을 다시 client가 요청한 것 처럼 요청을 받음
		return "redirect:/";
	}
	
	@GetMapping("/members")
	public String list(Model model) {
		List<Member> members = memberService.findMember();
			model.addAttribute("members", members);
		return "members/memberList";
	}
}
