package himedia.firstspring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


// Controller로 동작하는 class파일은 여러개 있을 수 있다.
@Controller
public class HeyController {
	
	// 하나의 요청을 처리하는 메서드는 단 하나만 있어야 한다.
	@GetMapping("hey")
	public String hey() {
		return "hey";
	}
	
	// @ResponseBody는 반환 값이 View로 출력되지 않고, HTTP Response Body에 직접 출력된다.
	// 문자열을 반환하면, 문자열 데이터를 출력한다.
	@GetMapping("yo")
	@ResponseBody
	public String yo() {
		return "test-code";
	}
	
	// 객체의 주소를 반환하면, 객체에 저장된 정보를 json형태로 출력한다.
	@GetMapping("myfriend")
	@ResponseBody
	public Friend greeting(@RequestParam("name") String name) {
		Friend friend = new Friend();
		friend.setName(name);
		return friend;
	}
	
	class Friend {
		private String name;

		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
}
