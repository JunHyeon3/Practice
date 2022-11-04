package phone;

public class PhoneBookManager {
	private final int MAX_CNT = 100;
	private PhoneBookInfo[] infoStorage = new PhoneBookInfo[MAX_CNT];
	private int index;
	
	private int search(String name) {
		// infoStorage.length는 전체 배열 다 검사하므로 낭비
		for(int i=0; i<index; i++) {
			if(infoStorage[i].name.equals(name))
				return i;
		}
		return -1;
	}
	
	public void inputData() {
		System.out.println("====================================");
		System.out.println("데이터 입력을 시작합니다...");
		
		System.out.print("이름 : ");
		String name = MenuViewer.INPUT.next();
		
		System.out.print("전화번호 : ");
		String phoneNumber = MenuViewer.INPUT.next();

		infoStorage[this.index++] = new PhoneBookInfo(name, phoneNumber);
		
		System.out.println("데이터 입력이 완료되었습니다.");
		System.out.println("====================================\n");
	}
	
	public void searchData() {
		System.out.println("====================================");
		System.out.println("데이터 검색을 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
		
		int searchIndex = search(searchName);
		if(searchIndex != -1) {
			infoStorage[searchIndex].showPhoneInfo();
			System.out.println("데이터 검색이 완료되었습니다.");
			System.out.println("====================================\n");
		}
		else {
			System.out.println("해당하는 데이터가 존재하지 않습니다.");
			System.out.println("====================================\n");
		}
	}
	
	public void deleteData() {
		System.out.println("====================================");
		System.out.println("데이터 삭제를 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
		
		int searchIndex = search(searchName);
		if(searchIndex != -1) {
			// [방법1] 
			// 한 칸씩 당겨서 덮어쓰는 방법은 많은 배열이 이동해야 한다.
//			for(int i=searchIndex; i<this.index; i++) {
//				if(i == this.index-1) {
//					infoStorage[i] = null;
//					break;
//				}
//				infoStorage[i] = infoStorage[i+1];
//				infoStorage[i+1] = null;
//			}
			// [방법2] 
			// 삭제할 값을 가장 마지막에 입력된 값으로 덮어쓰면 하나의 데이터만 이동하면 된다. 
			// 단, 입력된 순서는 꼬이게 된다.
			infoStorage[searchIndex] = infoStorage[this.index-1];
			infoStorage[this.index-1] = null;
			
			this.index--;
			System.out.println("데이터 삭제가 완료되었습니다.");
		}
		else {
			System.out.println("해당 데이터는 존재하지 않습니다.");
		}
		System.out.println("====================================\n");
	}
	
	public void printData() {
		System.out.println("====================================");
		System.out.println("전체 데이터 개수 : " + (this.index));
		for(PhoneBookInfo i: infoStorage) {
			if(i == null)
				break;
			i.showPhoneInfo();
		}
		System.out.println("====================================\n");
	}
}