
// Robot 클래스 정의
class Robot {
	
	// 멤버 변수(객체 변수, 인스턴스 변수)
	int productYear;
	String productName;
	
	// 멤버 메소드
	// setter, getter 추가 : Alt + Shift + S --> R (Generate Getters and Setters...)
	void setProductYear(int productYear) {
		this.productYear = productYear;
	}
	
	void setProductName(String productName) {
		this.productName = productName;
	}
	
	int getProductYear() {
		return productYear;
	}
	
	String getProductName() {
		return productName;
	}
	
//	자동으로 생성된 멤버 메소드
//	public int getProductYear() {						
//		return productYear;
//	}
//	public void setProductYear(int productYear) {
//		this.productYear = productYear;
//	}
//	public String getProductName() {
//		return productName;
//	}
//	public void setProductName(String productName) {
//		this.productName = productName;
//	}
	
}

//파일명과 이름이 같은 클래스에만 public 붙임
public class InstanceEx03 {		

	public static void main(String[] args) {

		// r1 객체 생성
		Robot r1 = new Robot();
		r1.setProductYear(2017);
		r1.setProductName("Emmet");
		
		// r1 호출
		System.out.println("r1의 생산년도 >> " + r1.getProductYear());
		System.out.println("r1의 제품명 >> " + r1.getProductName());
		
		// r2 객체 생성
		Robot r2 = new Robot();
		r2.setProductYear(2022);
		r2.setProductName("HTML");
		
		// r2 호출
		System.out.println("r2의 생산년도 >> " + r2.getProductYear());
		System.out.println("r2의 제품명 >> " + r2.getProductName());
		
		// 객체 생성은 되지만 주소를 불러올 지역 변수가 없어 사용 불가능.
		// Garbage Collector에 의해 자동으로 삭제됨.
		new Robot().setProductYear(2032);	
		
		// r3라는 참조 변수 생성 (객체 생성은 안 했음). 근데 r3 = r2
		// r3를 호출하면 r2 객체의 내용을 불러냄.
		Robot r3 = r2;		
	}

}



