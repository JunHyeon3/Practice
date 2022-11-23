package himedia.fourthspring.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.fourthspring.domain.Member;
import himedia.fourthspring.domain.MemberForm;
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
		
		System.out.println(member.getName());
		
		memberService.join(member);
		
		return "redirect:/";
	}
	
	@GetMapping("/member/list")
	public String memberList(Model model) {
		List<Member> members = memberService.findAllMember();
		
		model.addAttribute("members", members);
		
		return "member/memberList";
	}
	
	@GetMapping("/member/search")
	public String search(Long id, String name, Model model) {
		if(id != null) {
			Optional<Member> findMember = memberService.findId(id);
			if(!findMember.isEmpty()) {
				model.addAttribute("id", findMember.get().getId());
				model.addAttribute("name", findMember.get().getName());
			}
		}
		if(name != null) {
			Optional<Member> findMember = memberService.findName(name);
			if(!findMember.isEmpty()) {
				model.addAttribute("id", findMember.get().getId());
				model.addAttribute("name", findMember.get().getName());
			}
		}
		
		return "member/search";
	}
	
}
