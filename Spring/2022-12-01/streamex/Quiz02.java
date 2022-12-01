package streamex;

import java.util.Arrays;
import java.util.List;

public class Quiz02 {

	public static void main(String[] args) {
		
		Student[] student = {new Student("하루", 24), 
				new Student("마루", 22), 
				new Student("하루", 24),
			};
		List<Student> studentList = Arrays.asList(student);
		
		// [문제] 
		// 이름과 나이가 모두 같은 경우, 하나의 객체만 출력되도록 하시오.
		// [풀이]
		// Stream의 distinct()로 중복을 제거하기 위해서,
		// Set 컬렉션 클래스에서 중복 요소를 저장하지 않기 위해 해주었던것 처럼
		// equals()와 hashCode() 메서드를 오버라이딩 해줘야 한다.
		studentList.stream().distinct().forEach(s -> System.out.println("이름 : " + s.getName() + ", 나이 : " + s.getAge()));

		
	}

}
