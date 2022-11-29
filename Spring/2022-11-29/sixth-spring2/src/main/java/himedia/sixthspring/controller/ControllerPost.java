package himedia.sixthspring.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import himedia.sixthspring.domain.Member;
import himedia.sixthspring.domain.Product;

@RestController
public class ControllerPost {

	@PostMapping("/buy")
	public String buy(@RequestParam("name") String name, @RequestParam("price") int price) {
		return "상품명 : " + name + ", 가격 : " + price;
	}
	
	@PostMapping("/sell")
	public String sell(@RequestParam Map<String, String> map) {
		return "상품명 : " + map.get("name") + ", 가격 : " + map.get("price");
	}
	
	// domain의 Product class는 기본 자료형이 아니므로, @ModelAttribute를 사용한다.
//	@PostMapping("/share")
//	public String share(@ModelAttribute Product product) {
//		return "상품명 : " + product.getName() + ", 가격 : " + product.getPrice();
//	}
	
	// @RequestBody content type이 JSON이어야 한다.
	// JSON 형태 - {"name":"하루","price":200}
	@PostMapping("/share")
	public String share(@RequestBody Product product) {
		return "상품명 : " + product.getName() + ", 가격 : " + product.getPrice();
	}
	
	// @RequestBody를 생략할 경우
	// controller의 파라미터 어노테이션 생략은 @RequestParam, @ModelAttribute 만 가능하다.
	// 따라서 @RequestBody를 생략하면 @ModelAttribute가 적용된다.
//	@PostMapping("/share")
//	public String share(Product product) {
//		return "상품명 : " + product.getName() + ", 가격 : " + product.getPrice();
//	}
	
	// return 하는 값이 논리적인 view가 아니면 알아서 API로 반환한다.
	@PostMapping("/join")
	public Member join(@RequestBody Member member) {
		System.out.println("이름 >> " + member.getName());
		System.out.println("나이 >> " + member.getAge());
		
		return member;
	}
	
	/*
	 * [상황] TemplateInputException
	 * [원인] 해당 view 없음
	 * [해결] 
	 * 
	 * ModelAndView 편리함 :
	 * 
	 */
	@PostMapping("/find")
	public ModelAndView find() {
		// 논리 view
//		ModelAndView mav = new ModelAndView("/member/path-join");
//		ModelAndView mv = mav.addObject("name", "홍길동");
		
		// 코드 정리
		ModelAndView mav = new ModelAndView("/member/path-join").addObject("name", "홍길동");
		
		return mav;
	}
}
