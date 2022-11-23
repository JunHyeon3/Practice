package himedia.fourthspring.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import himedia.fourthspring.domain.Member;

@Repository
@Transactional
public class JpaMemberRepository implements MemberRepository {

	private final EntityManager em;
	
	@Autowired
	public JpaMemberRepository(EntityManager em) {
		this.em = em;
	}

	@Override
	public Member save(Member member) {
		em.persist(member);
		System.out.println("[JPA] save method 실행완료");
		return member;
	}

	@Override
	public Optional<Member> findById(Long id) {
		// class type 그대로 쓰고자하면 .class를 붙여주면된다.
		// id가 key이기 때문에 가능함
		Member member = em.find(Member.class, id);
		return Optional.ofNullable(member);
	}

	@Override
	public Optional<Member> findByName(String name) {
//		TypedQuery<Member> typedQuery = em.createQuery("select m from member m where m.name = :name", Member.class);
		// setParameter() : :name에 name을 넣음
//		TypedQuery<Member> typedQuery2 = typedQuery.setParameter("name", name);
//		List<Member> result = typedQuery2.getResultList();
		
		List<Member> result = 
				em.createQuery("select m from Member m where m.name = :name", Member.class)
				.setParameter("name", name)
				.getResultList();
		
		for(Member m: result) {
			if(m.getName().equals(name))
				return Optional.ofNullable(m);
		}
		
		return Optional.empty();
	}

	@Override
	public List<Member> findAll() {
		// jpa query문 작성시 유의사항 : table 명의 첫 글자는 대문자로 시작해야 함
		return em.createQuery("select m from Member m", Member.class).getResultList();
	}
	
}
