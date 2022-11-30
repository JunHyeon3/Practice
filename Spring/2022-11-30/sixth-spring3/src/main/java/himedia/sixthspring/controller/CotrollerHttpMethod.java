package himedia.sixthspring.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CotrollerHttpMethod {

	/**
	 * == [URI 설계] ====================================================
	 * 			   METHOD		URI						멱등(Idempotent)
	 * 회원 조회 : GET			/members				O			
	 * 회원 가입 : POST			/members				X
	 * 회원 검색 : GET			/members/{memberId}		O
	 * 정보 수정 : PUT			/members/{memberId}		O
	 * 일부 수정 : PATCH		/members/{memberId}		O
	 * 회원 삭제 : DELETE		/members/{memberId}		O
	 * ==================================================================
	 * 
	 * 멱등(Idempotent)
	 * - 여러 번 수행해도 결과가 같음을 의미
	 * 
	 * ex) 결제 같은 것은 PUT으로 해야한다. why??
	 * 		POST는 멱등이 아니기 때문에 여러 번 수행하면 여러 번 수행되기 때문에
	 */

	// 회원 조회 : GET			/members
	@GetMapping("/members")
	public String member() {
		
		return "[회원 조회] GET";
	}
	
	// 회원 가입 : POST			/members
	@PostMapping("/members")
	public String addMember() {
		
		return "[회원 가입] POST";
	}
	
	// 회원 검색 : GET			/members/{memberId}
	@GetMapping("/members/{memberId}")
	public String findMember(@PathVariable String memberId) {
		
		return "[회원 검색] GET : " + memberId;
	}
	
	// 정보 수정(전체) : PUT			/members/{memberId}
	@PutMapping("/members/{memberId}")
	public String updateMember(@PathVariable String memberId) {
		
		return "[전체 정보 수정] PUT : " + memberId;
	}
	
	// 정보 수정(일부) : PATCH			/members/{memberId}
	@PatchMapping("/members/{memberId}")
	public String partUpdateMember(@PathVariable String memberId) {
		
		return "[일부 정보 수정] PATCH : " + memberId;
	}
	
	// 회원 삭제 : DELETE		/members/{memberId}
	@DeleteMapping("/members/{memberId}")
	public String deleteMember(@PathVariable String memberId) {
		
		return "[회원 삭제] DELETE : " + memberId;
	}
	
	
}
