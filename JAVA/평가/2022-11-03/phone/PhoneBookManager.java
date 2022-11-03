package phone;

public class PhoneBookManager {
	private final int MAX_CNT = 100;
	private PhoneBookInfo[] infoStorage = new PhoneBookInfo[MAX_CNT];
	private int index;
	
	private int search(String name) {
		for(int i=0; i<MAX_CNT; i++) {
			if(infoStorage[i] == null)
				break;
			else if(infoStorage[i].name.equals(name))
				return i;
		}
		return -1;
	}
	public void inputData() {
		System.out.println("데이터 입력을 시작합니다...");
		
		System.out.print("이름 : ");
		String name = MenuViewer.INPUT.next();
		
		System.out.print("전화번호 : ");
		String phoneNumber = MenuViewer.INPUT.next();
		
		infoStorage[index++] = new PhoneBookInfo(name, phoneNumber);
		
		System.out.println("데이터 입력이 완료되었습니다.\n");
	}
	public void searchData() {
		System.out.println("데이터 검색을 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
		
		int searchValue = search(searchName);
		if(searchValue != -1) {
			infoStorage[searchValue].showPhoneInfo();
			System.out.println("데이터 검색이 완료되었습니다.\n");
		}
		else {
			System.out.println("해당하는 데이터가 존재하지 않습니다.\n");
		}
	}
	public void deleteData() {
		System.out.println("데이터 삭제를 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
		
		int searchValue = search(searchName);
		if(searchValue != -1) {
			infoStorage[searchValue].name = "";
			infoStorage[searchValue].phoneNumber = "";
		}
		
		System.out.println("데이터 삭제가 완료되었습니다.\n");
	}
}