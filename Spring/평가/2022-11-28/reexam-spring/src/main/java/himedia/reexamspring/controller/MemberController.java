package himedia.reexamspring.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import himedia.reexamspring.domain.Member;
import himedia.reexamspring.domain.MemberForm;
import himedia.reexamspring.service.MemberService;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/")
	public String home() {
		return "../static/index";
	}
	
	@GetMapping("/member/join")
	public String join() {
		return "member/newForm";
	}
	
	@PostMapping("/member/join")
	public String create(MemberForm memberForm) {
		Member member = new Member();
		member.setName(memberForm.getName());

		memberService.join(member);
		
		return "redirect:/";
	}
	
	@GetMapping("/member/list")
	public String list(Model model) {
		List<Member> members = memberService.findAll();
		
		model.addAttribute("members", members);
		
		return "member/memberList";
	}
	
	@GetMapping("/member/search")
	public String search(@RequestParam(value="searchName", required=false) String searchName, Model model) {

		Optional<Member> member = Optional.empty();
		
		if(searchName != null) 
			member = memberService.findName(searchName);

		model.addAttribute("member", member.get());
		
		return "member/memberSearch";
	}
	
}
