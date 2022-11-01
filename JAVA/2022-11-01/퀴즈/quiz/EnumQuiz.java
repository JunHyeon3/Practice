/*
 * [문제]
 * main 메서드를 보고 enum Shoes 작성하기
 * 
 * [출력]
 * << 상수 출력 >>
 * WALKING
 * RUNNING
 * TRACKING
 * HIKING
 * 
 * << 상수 값 출력 >>
 * 워킹화
 * 러닝화
 * 트레킹화
 * 등산화
 */
package quiz;

enum Shoes {
	WALKING("워킹화"), RUNNING("러닝화"), TRACKING("트레킹화"), HIKING("등산화");
	
	private String name;
	
	private Shoes(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
}

public class EnumQuiz {
	public static void main(String[] args) {
		System.out.println("<< 상수 출력 >>");
		System.out.println(Shoes.WALKING);
		System.out.println(Shoes.RUNNING);
		System.out.println(Shoes.TRACKING);
		System.out.println(Shoes.HIKING);
		
		System.out.println("\n<< 상수 값 출력 >>");
		for(Shoes s: Shoes.values())
			System.out.println(s.getName());
	}
}
