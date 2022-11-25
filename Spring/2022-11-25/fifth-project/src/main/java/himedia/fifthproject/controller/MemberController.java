package himedia.fifthproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.fifthproject.domain.Member;
import himedia.fifthproject.domain.MemberForm;
import himedia.fifthproject.service.MemberService;

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
		member.setName(form.getName());
		
		memberService.join(member);
		
		return "redirect:/";
	}
	
	@GetMapping("/member/list")
	public String memberList(Model model) {
		List<Member> members = memberService.findAllMembers();
		
		model.addAttribute("members", members);
		
		return "member/memberList";
	}
	
}
