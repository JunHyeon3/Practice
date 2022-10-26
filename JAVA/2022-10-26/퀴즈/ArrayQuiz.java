class Fruit2 {
	String sort;
	int count;
	
	public Fruit2(String sort, int count) {
		this.sort =  sort;
		this.count = count;
	}
	
	public void FruitInfo() {
		System.out.printf("%s가 현재 %d개 있습니다.\n", this.sort, this.count);
	}
}
public class ArrayQuiz {

	public static void main(String[] args) {
		Fruit2[] fruit = new Fruit2[3];
		
		fruit[0] = new Fruit2("사과", 5);
		fruit[1] = new Fruit2("바나나", 2);
		fruit[2] = new Fruit2("망고", 3);
		
		System.out.println("<<일반 for문으로 배열 객체의 정보 출력>>");
		for(int i=0; i<fruit.length; i++)
			fruit[i].FruitInfo();
		
		System.out.println("\n<<향상된 for문으로 배열 객체의 정보 출력>>");
		for(Fruit2 j:fruit)
			j.FruitInfo();
	}

}
