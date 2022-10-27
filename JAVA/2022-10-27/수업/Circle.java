import area.CircleArea;
import perimeter.CirclePerimeter;

public class Circle {

	public static void main(String[] args) {
		CircleArea area = new CircleArea(1.5);
		System.out.println("원의 넓이 >> " + area.getArea());
		
		CirclePerimeter perimeter = new CirclePerimeter(1.5);
		System.out.println("원의 둘레 >> " + perimeter.getPerimeter());
	}

}
