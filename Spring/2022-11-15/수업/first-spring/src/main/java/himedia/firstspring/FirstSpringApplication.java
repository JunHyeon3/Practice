package himedia.firstspring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FirstSpringApplication {

	public static void main(String[] args) {
		// spring boot가 실행되면서, 내장 tomcat server가 자동으로 실행됨!
		SpringApplication.run(FirstSpringApplication.class, args);
	}

}
