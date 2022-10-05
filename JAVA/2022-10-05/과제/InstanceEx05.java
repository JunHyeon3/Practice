
public class InstanceEx05 {
	
	// constructRobot 메서드 정의
	public static Robot constructRobot() {
		return new Robot();
	}
		
	public static void main(String[] args) {

		Robot robot = constructRobot();
		
		robot.setProductYear(2000);
		robot.setProductName("옵티머스");
		
		System.out.println("로봇의 생산년도 >> " + robot.productYear); // --> 2000
		System.out.println("로봇의 제품명 >> " + robot.productName); // --> 옵티머스
		
	}

}

