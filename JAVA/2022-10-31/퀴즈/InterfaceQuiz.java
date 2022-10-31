package interfaceexample;

interface Vehicle {
	public abstract void printNumber();
	public abstract void drive();
	public abstract void sail();
}

class Car implements Vehicle {
	int carNumber;

	public Car(int carNumber) {
		this.carNumber = carNumber;
	}
	
	@Override
	public void printNumber() {
		System.out.println("자동차 등록번호 : " + this.carNumber);
	}
	@Override
	public void drive() {
		System.out.println("자동차가 고속도로를 달립니다.\n");
	}
	@Override
	public void sail() { }
}

class Yacht implements Vehicle {
	int yachtNumber;

	public Yacht(int yachtNumber) {
		this.yachtNumber = yachtNumber;
	}

	@Override
	public void printNumber() {
		System.out.println("요트 등록번호 : " + this.yachtNumber);
	}
	@Override
	public void drive() { }
	@Override
	public void sail() {
		System.out.println("요트가 한강 위를 떠다닙니다.\n");
		
	}	
}
/*
 * 반복문으로 method drive와 sail을 호출하고 
 * 추상 메서드(printNumber)로 자동차와 요트의 등록번호를 출력 
 * 
 * [출력]
 * 자동차 등록번호 : 8586 
 * 자동차가 고속도로를 달립니다.
 * 
 * 요트 등록번호 : 679111 
 * 요트가 한강 위를 떠다닙니다.
 */
public class InterfaceQuiz {
	public static void main(String[] args) {
		Vehicle[] myVehicle = new Vehicle[2];
		myVehicle[0] = new Car(8586);
		myVehicle[1] = new Yacht(679111);

		for (Vehicle v: myVehicle) {
			v.printNumber();
			v.drive();
			v.sail();
		}
	}
}
