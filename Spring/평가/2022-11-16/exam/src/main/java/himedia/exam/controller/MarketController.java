package himedia.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MarketController {

	@GetMapping("data")
	public String selectItem(@RequestParam("name") String name, @RequestParam("item") String item, Model model) {
		model.addAttribute("name", name).addAttribute("item", item);
		return "select-item";
	}
	
	@GetMapping("")
	public String welcomPage() {
		return "../static/index";
	}
	
	@GetMapping("order/order-detail")
	public String orderDetail() {
		return "order/order-detail";
	}
	
}
