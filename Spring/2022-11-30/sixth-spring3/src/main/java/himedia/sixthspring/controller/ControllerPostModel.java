package himedia.sixthspring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import himedia.sixthspring.domain.GoodDay;

@Controller
public class ControllerPostModel {

	// form을 통해서 HTTP message body에 기록되어 넘어오는 데이터는 키=값&키=값 형태이다.
	// @ModelAttribute는 키=값&키=값 형태의 데이터를 받을 수 있기 때문에,
	// query parameter나  HTTP message body에 기록되어 넘어오는 데이터를 처리할 수 있다.
	// 하지만, JSON 형태로 넘어오는 데이터는 형태가 달라 처리할 수 없다.
	
	// [형태 1] - key와 value 형태로 view에 전달
//	@PostMapping("/control")
//	public String control(@ModelAttribute GoodDay goodDay, Model model) {
//		System.out.println("기분 >> " + goodDay.getFeeling());
//		System.out.println("날씨 >> " + goodDay.getWeather());
//		
//		model.addAttribute("feeling", goodDay.getFeeling());
//		model.addAttribute("weather", goodDay.getWeather());
//		
//		return "member/member-control";
//	}

	
	// [형태 2] - 데이터가 저장된 객체를 view에 전달
//	@PostMapping("/control")
//	public String control(@ModelAttribute GoodDay goodDay, Model model) {
//		System.out.println("기분 >> " + goodDay.getFeeling());
//		System.out.println("날씨 >> " + goodDay.getWeather());
//		
//		// [생략 가능] - 생략해도 model에 자동으로 아래 형태로 저장됨
//		model.addAttribute(goodDay);
//		
//		return "member/member-control";
//	}
	
	// [형태 3] - model.addAttribute() 생략
	// @ModelAttribute("feeling")에서 feeling은 goodDay를 model에 저장하여 넘겨줄 때의 이름이다.
	// 즉, @ModelAttribute로 ()를 생략하면, @ModelAttribute("goodDay")가 기본으로 설정되는 것이다.
//	@PostMapping("/control")
//	public String control(@ModelAttribute("day") GoodDay goodDay, Model model) {
//		System.out.println("기분 >> " + goodDay.getFeeling());
//		System.out.println("날씨 >> " + goodDay.getWeather());
//	
//		return "member/member-control";
//	}
	
	// [형태 4] - Model model, model.addAttribute() 생략
//	@PostMapping("/control")
//	public String control(@ModelAttribute GoodDay goodDay) {
//		System.out.println("기분 >> " + goodDay.getFeeling());
//		System.out.println("날씨 >> " + goodDay.getWeather());
//		
//		return "member/member-control";
//	}
	
	// [형태 5] - @ModelAttribute, Model model, model.addAttribute() 생략
	@PostMapping("/control")
	public String control(@ModelAttribute GoodDay goodDay) {
		System.out.println("기분 >> " + goodDay.getFeeling());
		System.out.println("날씨 >> " + goodDay.getWeather());
	
		return "member/member-control";
	}
	
}
