package book;

import bookquiz.AnimalBook;

public class BookManager {
	private final int MAX_CNT = 100;
	private AnimalInfo[] infoStorage = new AnimalInfo[MAX_CNT];
	private int index;

	public void inputData() {
		System.out.println("<< 정보를 입력하세요 >>");
		
		System.out.print("1. 이름 : ");
		String name = AnimalBook.input.next();
		
		System.out.print("2. 나이 : ");
		int age = AnimalBook.input.nextInt();
		
		infoStorage[index++] = new AnimalInfo(name, age);
		
		System.out.println("데이터 입력이 완료되었습니다.\n");
	}
	
	public void showBook() {
		System.out.println("<< 저장 목록 >>");
		for(AnimalInfo i: infoStorage) {
			if(i == null) 
				break;
			i.showAnimalInfo();
		}
	}
}
