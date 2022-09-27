
public class Variable {
	public static void main(String[] args) {
		
		// 변수 선언
		// 형태 : 자료형 변수명;
		int num;
		// 초기화 : 변수에 값을 넣는다. 자바에서는 초기화 없이 변수를 사용할 수 없다.		
		num = 5;
		
		// 변수 선언과 동시에 초기화 ( 권장 )
		int var = 6;
		
		System.out.println("num : " + num);
		System.out.println("var : " + var);
	}
}

/*
 * [변수]
 * - 변하는 값
 * - 특정 값을 저장하기 위한 공간
 * - 메모리 공간에 이름을 부여한 것 -> 이름을 통한 접근
 * 
 * [변수 명명 규칙]
 * - 숫자로 시작 불가능
 * - 변수명의 길이 제한이 없음
 * - _ 와 & 기호만 사용 가능
 * - 대소문자를 구분 (int num;과 int Num;은 서로 다름)
 * - 쓰임이 정해져 있는 예약어(int, float, ...)를 사용 할 수 없음
 * - 소문자로 시작
 * 
 * [변수 표기법]
 * snake 표기법 : num_one
 * camel 표기법 : numOne
 * 
 * [상수]
 * - 변하지 않는 값
 * - 기본 자료형을 사용
 * - 정수형 상수 : int
 * - 실수형 상수 : double
 * 
 * [접미사]
 * - L : 정수형 상수L, 기본 자료형을 int -> long으로 변경 
 * - F : 실수형 상수F, 기본 자료형을 double -> float로 변경 
 */