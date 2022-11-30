package himedia.sixthspring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import himedia.sixthspring.domain.Member;

@Controller
public class ControllerQuiz {
	
	/*
	 * [문제] request : JSON data {"이름":"홍길동", "age":25}
	 * Post 방식으로 이름과 나이를 view로 부터 받아서,
	 * member folder의 member-quiz 뷰를 사용자에게 response 하시오.
	 * member-quiz 뷰에 이름과 나이를 출력하시오.
	 * 단, 일반적인 형태와 ModelAndView 2가지 모두 작성하시오
	 * 1) quizOne : 일반적인 형태
	 * 	- addAttribute 2개 -> 1개
	 * 	- model.addAttribute 생략 가능??
	 * 2) quizTwo : ModelAndView
	 * 	- model.addAttribute 생략되어도 실행되도록!!
	 * 	- addObject 1개
	 * 요청 url : /quiz
	 */
	
	// 1) 일반적인 형태
	@PostMapping("/quiz")
	public String quizOne(@RequestBody Member member, Model model) {
		System.out.println("이름 >> " + member.getName());
		System.out.println("나이 >> " + member.getAge());
		
		// [생략 가능]
//		model.addAttribute("name", member.getName());
//		model.addAttribute("age", member.getAge());
	
		model.addAttribute(member);
		
		return "member/member-quiz";
	}
	
//	@PostMapping("/quiz")
	public ModelAndView quizTwo(@RequestBody Member member) {
		System.out.println("이름 >> " + member.getName());
		System.out.println("나이 >> " + member.getAge());
		
		ModelAndView mav = new ModelAndView("member/member-quiz").addObject(member);
		
		return mav;
	}
}
