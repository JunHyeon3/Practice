package himedia.sixthspring.controller;

import java.util.Map;

import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *  반복적으로 사용되는 요청은 class level에서 @RequestMapping으로 관리할 수 있다.
 *  cf) @GetMapping은 method level에서만 사용이 가능하므로 @RequestMapping을 사용
 *  
 *  Postman에서 테스트 할 때, 논리적인 View에 해당하는 물리적인 View가 없으면 에러가 발생한다.
 *  따라서, @ResponseBody를 사용하여 return 값을 body에 실어 보내서 테스트한다.
 *  
 *  @RestController : @ResponseBody와 @Controller가 합쳐진 어노테이션
 */
@RequestMapping("/members")
//@ResponseBody
//@Controller
@RestController
public class ControllerGetMember {
	
//	@GetMapping("/members/new")
	@GetMapping("/new")
	public String memberNew() {
		return "new-ok";
	}
	
//	@GetMapping("/members/list")
	@GetMapping("/list")
	public String memberList() {
		return "list-ok";
	}
	
	/** 
	 * [여러개의 요청 처리하는 방법]
	 * value = {}의 중괄호 안에 처리할 요청을 나열한다. 
	 * localhost:8080/members/hello, localhost:8080/members/hi
	 */
	@GetMapping(value = {"/hello", "/hi"})
	public String greeting() {
		return "hello";
	}
	
	/** 
	 * [변수 취급하여 사용하는 방법]
	 * 요청에서 변수처럼 취급할 위치에 {변수명}으로 요청을 받고, 
	 * @PathVariable을 사용하여 {변수명} 자리에 들어오는 요청 값을 바인딩한다.
	 * localhost:8080/members/reservation/2
	 */
	@GetMapping("/reservation/{page}")
	public String reservation(@PathVariable(name = "page") Integer page) {
		return "reservation-" + page + "-ok";
	}
	
	/** 
	 * [문제]
	 * localhost:8080/members/store/chungjungone/products/3744261301/
	 * return 형태 : 업체명 : chungjunone, 상품ID : 3744261301
	 */
	@GetMapping("/store/{companyName}/products/{productId}")
	public String store(@PathVariable("companyName") String companyName, @PathVariable("productId") Long productId) {
		return "업체명 : " + companyName + ", 상품ID : " + productId;
	}
	
	/** 
	 * [여러개의 query parameter 처리 방법]
	 * query parameter는 key와 value로 구성 되어 있다.
	 * 따라서 key와 value 형태인 컬렉션 프레임워크인 Map을 사용할 수 있다.
	 * 여러개의 query parameter가 있다면, @RequestParam를 여러번 사용해야 한다.
	 * 하지만, Map을 사용하면 여러개의 query parameter가 자동으로 key와 value형태로 Map에 저장된다. 
	 * localhost:8080/members/check?id=acb123&pw=iennse
	 */
	@GetMapping("/check")
	public String check(@RequestParam Map<String, String> map) {
		return "check-" + map.get("id") + "-" + map.get("pw") + "-ok";
	}
	
	/**
	 * [여러개의 query parameter의 key가 동일할 경우]
	 * Map은 key가 동일할 경우, 마지막 key의 value로 덮어써지는 문제가 있다.
	 * 이를 해결하기 위해 MultiValueMap<>을 사용한다.
	 * localhost:8080/members/hobby?select=reading&select=music
	 */
	@GetMapping("/hobby")
	public String check(@RequestParam MultiValueMap<String, String> multi) {
		// 동일한 key를 가지는 value들을 하나로 묶어 저장하기 때문에 size가 1이다.
		System.out.println(multi.size());
		
		// [문제] - 값 출력
		for(String s: multi.get("select"))
			System.out.println(s);
		
		return "hobby-ok";
	}
	
}
