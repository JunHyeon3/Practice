package himedia.alone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

class News {
	String economic;

	public String getEconomic() {
		return economic;
	}

	public void setEconomic(String economic) {
		this.economic = economic;
	}
}

@Controller
public class AloneController {
	@GetMapping("shop")
	public String shopMvc(@RequestParam("item") String item, Model model) {
		model.addAttribute("item", item);
		return "shop";
	}
	
	@GetMapping("stock")
	public String stockMvc(@RequestParam("sise") int sise, Model model) {
		model.addAttribute("sise", sise);
		return "stock";
	}
	
	@GetMapping("news")
	@ResponseBody
	public News newsApi(@RequestParam("economic") String economic) {
		News news = new News();
		news.setEconomic(economic);
		return news;
	}
}
