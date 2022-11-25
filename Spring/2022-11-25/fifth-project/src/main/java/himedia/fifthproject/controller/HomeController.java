package himedia.fifthproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	/*
	 * GetMapping의 "/"는 url
	 * return하는 "home"은 논리적인 view
	 * templates 폴더에 있는 "home.html"은 물리적인 view
	 */
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
}
