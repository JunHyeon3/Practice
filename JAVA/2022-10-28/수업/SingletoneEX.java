/*
 * [싱글톤]
 * 클래스에 생성되는 객체가 오로지 하나만 생성됨
 * 즉, 외부에서 객체 생성이 안되야 함
 * 
 * [싱글톤으로 구성하는 방법]
 * 생성자의 접근권한 : private
 * 클래스 내에서 객체 생성 : 멤버 객체
 * 멤버 메서드를 통해 생성된 객체의 주소를 리턴
 */
class Pattern {
	
	// [멤버 변수]
	// 2. 멤버 변수를 통해서 객체 생성
//	Pattern member = new Pattern();
	
	// 4. static 메서드인 getPattren()에서 member 참조변수를 사용할 수 있도록, static 변수로 설정
//	static Pattern member = new Pattern();
	
	// 5. 외부에 절대 드러나지 않도록, 멤버 변수의 접근권한을 private로 설정
	private static Pattern member = new Pattern();
	
	// 번외) 멤버 변수 추가
	private int count;
	
	// [생성자]
	// 1. 외부에서 객체 생성이 불가능하도록, 생성자의 접근권한을 private로 설정
	private Pattern() { }
	
	// [멤버 메서드]
	// 3. 외부에서 사용할 수 있도록, instance 메서드를 static 메서드로 전환
	public static Pattern getPattern() {
		return member;
	}
	
	// 번외) 멤버 메서드 추가
	// 번외-1) 멤버 변수 count 값 설정
	public void setCount(int count) {
		this.count = count;
	}
	// 번외-2) 멤버 변수 count 값 리턴
	public int getCount() {
		return this.count;
	}
	
}
public class SingletoneEX {

	public static void main(String[] args) {
		
		// 1-1. 외부에서 객체를 생성하면 Error!
//		Pattern p = new Pattern();
		
		Pattern p = Pattern.getPattern();
		System.out.println(p);
		// class가 로드 될 때 객체가 생성되므로
		// 결국 p와 p2는 동일한 주소를 가리킨다. 즉, 하나의 객체를 공유한다.
		Pattern p2 = Pattern.getPattern();
		System.out.println(p);
		
		p.setCount(5);
		System.out.println("멤버 변수 count 값 >> " + p.getCount());
		System.out.println("멤버 변수 count 값 >> " + p2.getCount());
		
		
	}

}
