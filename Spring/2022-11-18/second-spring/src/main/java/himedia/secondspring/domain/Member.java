package himedia.secondspring.domain;

// DTO : field, getter, setter
// 계층간 데이터를 주고 받을 때 사용
public class Member {
	private Long id;
	private String name;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
