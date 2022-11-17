package himedia.secondspring.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import himedia.secondspring.domain.Member;

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
		Iterator<Entry<Long, Member>> iter = store.entrySet().iterator();
		Member member;
		while(iter.hasNext()) {
			member = iter.next().getValue();
			if(member.getName().equals(name))
				return Optional.ofNullable(member);
		}
		return Optional.ofNullable(null);
	}
	
	@Override
	public List<Member> findAll() {
		List<Member> list = new ArrayList<>(store.values());
		return list;
	}

}
