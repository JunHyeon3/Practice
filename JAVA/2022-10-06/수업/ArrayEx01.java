/*
 * [배열 Array]
 * 배열이란 하나의 이름으로 여러 값(요소, 원소)을 관리
 * 여러 값을 구분하기 위해 인덱스(index)를 사용 (인덱스는 0부터 시작)
 * 
 * [문법]
 * 자료형[] 배열명(참조변수) = new 자료형[길이];
 * 
 * [특징]
 * 자바는 무조건 배열을 객체로 생성 (heap 영역에 생성)
 * 따라서 생성된 배열에 주소로 접근 (간접 접근)
 * 
 * [length]
 * 배열을 생성하면, 배열의 길이가 length 변수에 자동으로 저장된다.
 * 사용 방법 → 배열명.length;
 * length의 값은 변경 불가능
 */

public class ArrayEx01 {

	public static void main(String[] args) {

		// [우리 반 학생들의 수학점수 저장]
		// 1. 배열 생성
		// 자료형[] 참조변수;
		// 자료형에 맞는 배열의 주소가 참조변수에 저장
		// int[]는 정수형 배열을 의미
		// math는 정수형 배열의 주소를 저장하는 참조 변수
		int[] math;
		
		// 2. 배열 객체 생성
		// new 자료형[길이]
		// 정수형 배열의 길이가 5인 객체를 생성
		math = new int[5];
		
		// 3. 배열 요소에 값 설정
		math[0] = 60;
		math[1] = 70;
		math[2] = 90;
		math[3] = 100;
		math[4] = 20;
		
		// 4. 배열 요소 값 확인 → 주로 반복문 사용
		// 4-1. 배열의 길이 확인
		System.out.println("배열의 길이 >> " + math.length);
		
		// 4-2. 일반 for문
		// 반복문이 배열의 길이 만큼 실행된다.
		// 배열의 길이가 바뀔 수 있으므로 고정된 값을 사용하는 것 보다
		// 배열명.length로 배열의 길이를 가져와 사용하는 것이 좋다.
		System.out.println("\n<< 일반 for문 >>");
		for(int i=0; i<math.length; i++) {
			//System.out.println("math[" + i + "] >> " + math[i]);
			System.out.printf("math[%d] = %d\n", i, math[i]);
		}
		
		// 4-3. 향상된 for문 
		// 배열에서만 사용되는 쉽게 표현한 for문
		// for(자료형 변수명: 참조변수) {
		// 		명령어;
		// }
		System.out.println("\n<< 향상된 for문 >>");
		for(int i : math) {
			System.out.println(i);
		}
	}

}
