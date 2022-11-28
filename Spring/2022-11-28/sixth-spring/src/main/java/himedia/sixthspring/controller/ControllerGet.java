package himedia.sixthspring.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ControllerGet {

	// method level에서 사용
	@GetMapping("/search") 
	public String search() {
		System.out.println("search method 실행됨");
		
		return "item/item-search";
	}
	
//	@GetMapping("/detail")
//	public String detail(@RequestParam(name="itemName") String itemName) {
//		System.out.println("item-search 뷰로 부터 받은 값 >> " + itemName);
//		
//		return "item/item-detail";
//	}
	
	// [상황1] localhost:8080/detail?itemName=sky	-> itemName = sky
	// [상황2] localhost:8080/detail?itemName=		-> itemName = ""
	// [상황3] localhost:8080/detail 			 	-> MissingServletRequestParameterException: Required request parameter 'itemName' for method parameter type String is not present]
	
	// Exception 해결 방법1) 속성 required = false 사용		
//	@GetMapping("/detail")
//	@ResponseBody
//	public String detail(@RequestParam(name="itemName", required = false) String itemName) {
//		System.out.println("item-search 뷰로 부터 받은 값 >> " + itemName);
//		
//		return itemName;
//	}
	
	// Exception 해결 방법2) 속성 defaultValue = "default value"
//	@GetMapping("/detail")
//	@ResponseBody
//	public String detail(@RequestParam(name="itemName", defaultValue = "default") String itemName) {
//		System.out.println("item-search 뷰로 부터 받은 값 >> " + itemName);
//		
//		return itemName;
//	}
	
	// Exception 해결 방법3) Optional keyword 사용
	// Optional을 사용하여, query parameter의 key와 value가 있을 경우 value를 리턴
	// value가 없을 경우와 key와 value 모두 없을 경우, default 리턴
	@GetMapping("/detail")
	@ResponseBody
	public String detail(@RequestParam(name="itemName") Optional<String> itemName) {
		System.out.println("item-search 뷰로 부터 받은 값 >> " + itemName);
		
		if(itemName.isEmpty() || itemName.get().isEmpty())
			return "default";
		
		return itemName.get();
	}
	
	@GetMapping("/count")
	public String count(@RequestParam(name="itemCount") Optional<Integer> itemCount) {
		if(itemCount.isEmpty()) {
			itemCount = Optional.of(0);
		}
		
		System.out.println("item-detail 뷰(웹 페이지)로 부터 받은 값 >> " + itemCount.get());
		
		return "item/item-count";
	}
	
	// 예전 스타일 
	// RequestMapping은 기본적으로 Get방식과 Post방식 모두 처리할 수 있다.
	// value : 요청을 받음, name : 별칭을 지정, method : 허용할 요청 방식을 지정한다.
//	@RequestMapping(value = "/order", method = RequestMethod.GET)
//	public String oldStyle(HttpServletRequest request, HttpServletResponse response) {
//		String itemName = request.getParameter("itemName");
//		int itemCount = Integer.parseInt(request.getParameter("itemCount"));
//		
//		System.out.println("상품명 : " + itemName);
//		System.out.println("상품수 : " + itemCount);
//		
//		return "item/item-order";
//	}
	
	// Spring 4.3 부터 지원 : GetMapping, PostMapping
	// [기본 형태] - @RequestParam("itemName") String itemName
	// query parameter의 key의 값을 method의 parameter에 저장하는 것을 "바인딩"이라 한다.
//	@GetMapping("/order")
//	public String newStyle(@RequestParam("itemName") String itemName, @RequestParam("itemCount") Integer itemCount) {
//		System.out.println("상품명 : " + itemName);
//		System.out.println("상품수 : " + itemCount);
//		
//		return "item/item-order";
//	}
	
	// [생략된 형태1] - @RequestParam String itemName
	// query parameter의 key와 method의 parameter가 같은 경우, query parameter의 key는 생략 가능
//	@GetMapping("/order")
//	public String newStyle(@RequestParam String itemName, @RequestParam Integer itemCount) {
//		System.out.println("상품명 : " + itemName);
//		System.out.println("상품수 : " + itemCount);
//		
//		return "item/item-order";
//	}
	
	// [생략된 형태2] - String itemName
	// query parameter의 key와 method의 parameter가 같으면서 "기본 자료형"일 경우, @RequestParam도 생략 가능
	// @RequestParam를 생략하면 required 속성이 false인 것 처럼 처리된다.
	// [상황1] localhost:8080/order?itemName=sky&itemCount=2	-> itemName = "sky", itemCount = "2"
	// [상황2] localhost:8080/order?itemName=&itemCount=		-> itemName = "", itemCount = null
	// [상황3] localhost:8080/order		 						-> Exception 발생x, itemName = null, itemCount = null
	@GetMapping("/order")
	public String newStyle(String itemName, Integer itemCount) {
		System.out.println("상품명 : " + itemName);
		System.out.println("상품수 : " + itemCount);
		
		return "item/item-order";
	}
}
