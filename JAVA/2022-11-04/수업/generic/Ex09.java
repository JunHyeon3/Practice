/*
 * 1. 제너릭 타입은 해당 영역내에서만 유효
 * 	1.1. 제너릭 타입 선언 형태 : 인터페이스, 클래스, 메서드 
 * 	1.2. 제너릭 타입은 두 개 이상 가능
 */

package generic;

// 1.1. 제너릭 인터페이스
interface InterfaceName<T> { }

// 1.1. 제너릭 클래스
class ClassName<T> { }

// 1.2. 제너릭 타입이 두개
class ClassOne<K, V> { }

public class Ex09 {
	// 1.1. 제너릭 메서드
	public static <T> void show(T t) {
		System.out.println(t);
	}
	
	// extends : 나를 포함한 자식들
	public static <T> void one(ClassName<? extends T> name) { }
	public static void two(ClassName<? extends Tree> name) { }
	
	// super : 나를 포함한 부모들
	public static <T> void three(ClassName<? super T> name) { }
	
	public static void main(String[] args) {
		// Error! 기본형인 int는 사용할 수 없다.
//		show(int);
		// 참조형만 사용할 수 있다.
		show(new Integer(10));
		
	}

}
