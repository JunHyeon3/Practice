package streamex;

import java.util.Arrays;
import java.util.List;

public class Quiz01 {

	public static void main(String[] args) {

		Student[] student = {new Student("하루", 25), new Student("마루", 22)}; 
		List<Student> list = Arrays.asList(student);
		
		// [문제 1] - 향상된 for문으로 이름과 나이를 출력
		// [출력 형태] - 이름 : 하루, 나이 : 25
		for(Student stu: list) 
			System.out.printf("이름 : %s, 나이 : %d\n", stu.getName(), stu.getAge());
		
		// [문제 2-1] - stream을 생성하여, 이름만 출력하시오.
		// [출력 형태] - 하루
		list.stream().forEach(t -> System.out.println(t.getName()));
		
		// [문제 2-2] - stream을 생성하여, 이름과 나이를 출력하시오.
		// [출력 형태] - 이름 : 하루, 나이 : 25
		list.stream().forEach(t -> System.out.printf("이름 : %s, 나이 : %d\n", t.getName(), t.getAge()));
					
	}

}
