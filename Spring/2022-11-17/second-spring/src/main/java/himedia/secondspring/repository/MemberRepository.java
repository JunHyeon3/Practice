package himedia.secondspring.repository;

import java.util.List;
import java.util.Optional;

import himedia.secondspring.domain.Member;

public interface MemberRepository {
	
	// 저장소에 저장
	Member save(Member member);
	
	// 저장된 id로 검색
	// Optional : null을 감싸서 처리해주는 wrapper class
	Optional<Member> findById(long id);
	
	// 저장된 name으로 검색
	Optional<Member> findByName(String name);
	
	// 저장된 모든 회원 정보 반환
	List<Member> findAll();
	
}
