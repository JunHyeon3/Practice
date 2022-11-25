package himedia.fifthproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import himedia.fifthproject.domain.Member;

public interface SpringDataJpaMemberRepository extends JpaRepository<Member, Long>, MemberRepository {
	
}
