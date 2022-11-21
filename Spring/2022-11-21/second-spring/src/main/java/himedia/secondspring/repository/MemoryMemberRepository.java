package himedia.secondspring.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import himedia.secondspring.domain.Member;

//@Repository
public class MemoryMemberRepository implements MemberRepository {
	
	private static Map<Long, Member> store = new HashMap<>(); 
	
	private static long sequence = 0L;

	@Override
	public Member save(Member member) {
		member.setId(++sequence);
		store.put(member.getId(), member);
		return null;
	}

	@Override
	public Optional<Member> findById(long id) {
		return Optional.ofNullable(store.get(id));
	}

	@Override
	public Optional<Member> findByName(String name) {
		for(Member m: store.values()) {
			if(m.getName().equals(name))
				return Optional.ofNullable(m);
		}
		return Optional.ofNullable(null);
	}
	
	@Override
	public List<Member> findAll() {
		List<Member> list = new ArrayList<>(store.values());
		return list;
	}
	
	public void clearStore() {
		store.clear();
	}

}
