package area;

// class에 사용할 수 있는 접근 제어자는 default 와 public 밖에 없음
// public은 파일명과 동일한 하나의 class에만 사용할 수 있음
public class CircleArea {
	double rad;
	final double PI;
	
	public CircleArea(double r) {
		rad = r;
		PI = 3.14;
	}
	
	public double getArea() {
		return (rad * rad) * PI;
	}
}