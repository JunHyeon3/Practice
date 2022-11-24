package himedia.fourthspring.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.fourthspring.domain.Member;
import himedia.fourthspring.domain.MemberForm;
import himedia.fourthspring.domain.SearchForm;
import himedia.fourthspring.service.MemberService;

@Controller
public class MemberController {

	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/member/new")
	public String form() {
		return "member/newForm";
	}
	
	@PostMapping("/member/new")
	public String create(MemberForm form) {
		Member member = new Member();
		member.setName(form.getUserName());
		
		if(memberService.findName(form.getUserName()).isPresent()) {
			System.out.println("중복된 이름입니다.");
		}
		else {
			memberService.join(member);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/member/list")
	public String memberList(Model model) {
		List<Member> members = memberService.findAllMember();
		
		model.addAttribute("members", members);
		
		return "member/memberList";
	}
	
	/*
	 *  [아무것도 입력하지 않을 때 방법1] - required=false 사용
	 *  - @RequestParam에 required=false 추가하면,
	 *    input에 아무것도 입력하지 않았을때, 빈문자열("")이 아니라 null로 설정한다.
	 *  - name 혹은 value를 사용하여 쿼리문의 name과 매핑해줘야 한다.
	 */
	@GetMapping("/member/search")
	public String search(@RequestParam(name="id", required=false) Long id, 
			@RequestParam(value="name", required=false) String name, Model model) {
		
		Optional<Member> member = Optional.empty();
		
		if(id != null) 
			member = memberService.findId(id);
		else if(name != null) 
			member = memberService.findName(name);
		
		// [view에 전달하는 방법1] - 빈 객체를 넘겨주기
//		if(member.isEmpty()) 
//			model.addAttribute("member", new Member());
//		else 
//			model.addAttribute("member", member.get());
		
		// [view에 전달하는 방법2] - view에서 처리하기 
		model.addAttribute("member", member.get());
		
		return "member/search";
	}
	
	/*
	 *  [아무것도 입력하지 않을 때 방법2] - id를 String으로 사용
	 *  - Long은 빈 문자열을 처리하지 못하므로, String으로 바꾼다.
	 *  - 그럼 if문에서 != null 대신 .isEmpty()로 빈 문자열인지 확인해야한다.
	 *  - 또한 id를 String -> Long으로 변환하기 위해 Long.parseLong()을 사용해야 한다. 
	 */
//	@GetMapping("/member/search")
//	public String search(@RequestParam("id") String id, 
//			@RequestParam("name") String name, Model model) {
//		
//		Optional<Member> member = Optional.empty();
//		
//		if(!id.isEmpty()) 
//			member = memberService.findId(Long.parseLong(id));
//		else if(!name.isEmpty()) 
//			member = memberService.findName(name);
//		
//		if(member.isPresent()) 
//			model.addAttribute("member", member.get());
//		
//		return "member/search";
//	}
	
	@PostMapping("/member/search")
	public String search(SearchForm searchForm, Model model) {
		Optional<Member> member = Optional.empty();
		
		Long id = searchForm.getId();
		String name = searchForm.getName();
				
		if(id != null)
			member = memberService.findId(id);
		else if(name != null) 
			member = memberService.findName(name);
		
		if(member.isPresent()) 
			model.addAttribute("member", member.get());
		
		return "member/search";
	}
	
}
