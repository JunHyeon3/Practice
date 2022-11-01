package string;

public class StringEx02 {

	public static void main(String[] args) {
		String[] str = {"one", "two", "three", "four"};
		String con = "";
		
		// [concat 함수]
		// 문법 : 문자열.concat(문자열, 문자열, 문자열)
		
		System.out.println(str[0].concat(str[1]));
		
		for(String s: str) {
			// 원본이 아니라 복사본 끼리 이어서 새로운 문자열을 만드는 것이다.
			// 그렇기 때문에 concat 실행 후의 값을 따로 저장해주어야 사용할 수 있다.
			con = con.concat(s).concat(", ");
		}
		
		System.out.println("concat 함수 >> " + con);
	}

}
