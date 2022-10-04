/*
 * [method] : 메서드, 메소드
 * 반드시 메서드를 정의한 후 호출해야한다.
 * 메서드는 main메서드 밖에서 정의해야한다.
 * 
 * [정의 형태]
 * 반환형 메서드명(매개변수1, 매개변수2) {
 * 		명령어;
 * 		명령어;
 *		return 값; 
 * }
 * 
 * 반환형에는 return되는 값에 맞는 자료형이 오고, 만일 return되는 값이 없다면 void를 쓴다. 
 * 매개변수는 있어도 되고 없어도 되지만 () 소괄호는 반드시 있어야 한다.
 * 
 * [호출 형태]
 * 메서드명(값1, 값2)
 */

public class MethodEx01 {

	// 메서드 정의
	// 형태 : 매개변수 없음, 리턴값 없음
	public static void show() {
		System.out.println("show() 메서드 실행됨");
	}
	
	public static void main(String[] args) {
		System.out.println("main() 메서드 시작");
		
		// 메서드 호출
		show();		
		
		System.out.println("main() 메서드 종료");
	}

}
