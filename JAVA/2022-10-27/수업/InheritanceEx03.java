class ParentThree {
	String name;
	
	// 어느 순간 자식 class가 생길 수 있으므로, 
	// 매개변수가 없는 기본 생성자도 만들어 주는 것이 좋다.
	public ParentThree() {}
	
	public ParentThree(String name) {
		this.name = name;
	}
}

class ChildThree extends ParentThree {
	
}


public class InheritanceEx03 {

	public static void main(String[] args) {

		
		
	}

}
