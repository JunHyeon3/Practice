package perimeter;

public class CirclePerimeter {
	double rad;
	final double PI;
	
	public CirclePerimeter(double r) {
		rad = r;
		PI = 3.14;
	}
	
	public double getPerimeter() {
		return (rad * 2) * PI;
	}
}