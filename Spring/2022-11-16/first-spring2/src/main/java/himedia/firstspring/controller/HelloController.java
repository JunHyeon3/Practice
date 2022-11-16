// Controller는 사용자의 요청에 해당하는 웹 페이지를 연결해준다.
package himedia.firstspring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// 이 클래스가 Controller임을 어노테이션으로 명시해줌
@Controller
public class HelloController {

//	public 반환형 메서드명(매개변수) {
//		return 웹페이지명;
//	}
	
	/**
	 * 1. MVC 
	 */
	@GetMapping("first-mvc")
	public String firstMvc() {
		return "first";
	}
	
	// get방식(url에 붙여서 제출)으로 요청할 때 붙여주는 어노테이션 
	// 여기서 hello는 사용자가 요청한 이름임. localhost:8080/hello
	/**
	 * 2. Template(Thymeleaf) 
	 * 		: view template을 통해 데이터 표현
	 */
	@GetMapping("hello")
	public String hello(Model model) {
		// client 쪽으로 key와 value값 형태로 데이터를 전송한다.
		model.addAttribute("name", "홍길동");
		// spring boot가 자동으로 사용자에게 전달될 웹 페이지명인 hello뒤에 .html을 붙여줌
		return "hello";
	}
	
	// @RequestParam()의 인수에는 사용자가 요청한 key를 입력하고, 그 뒤에는 key에 대응하는 value를 저장할 변수를 선언
	@GetMapping("second-mvc")
	public String secondMvc(@RequestParam("fruit") String fruit, Model model) {
		System.out.println("fruit >> " + fruit);
		System.out.println("model >> " + model);
		model.addAttribute("fruit", fruit);
		return "second";
	}
	
	@GetMapping("third-mvc")
	public String thirdMvc(@RequestParam("count") int count, Model model) {
		model.addAttribute("count", count);
		return "third";
	}
	
	/**
	 * 3-1. API 방식 : String으로 전송
	 */
	@GetMapping("api-one")
	@ResponseBody
	public String apiOne(@RequestParam("fruit") String fruit) {
		// @ResponseBody 어노테이션을 명시하면, 웹 페이지 명을 반환하지 않아도 
		// 요청한 이름의 페이지를 찾아가서 반환하는 문자열을 출력한다. 
		return "쿼리 파라미터 fruit의 값 >> " + fruit;
	}
	
	
	/**
	 * 3-2. API 방식 : json으로 전송
	 * (일반적으로) json 형식의 API 방식으로 데이터 전송
	 */
	@GetMapping("api-two")
	@ResponseBody
	public FruitInfo apiTwo(@RequestParam("fruit") String fruit) {
		FruitInfo fruitInfo = new FruitInfo();
		
		fruitInfo.setFruit(fruit);
		
		return fruitInfo;
	}
	
	// 예시용 class
	static class FruitInfo {
		private String fruit;

		public String getFruit() {
			return fruit;
		}
		public void setFruit(String fruit) {
			this.fruit = fruit;
		}
	}
}
