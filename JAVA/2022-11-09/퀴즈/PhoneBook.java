import phone.MenuViewer;
import phone.PhoneBookManager;

public class PhoneBook {
	public static PhoneBookManager manager = new PhoneBookManager();
	
	public static void main(String[] args) {
		int choice = 0;
		menu:
		while(true) {
			MenuViewer.showMenu();
			choice = MenuViewer.INPUT.nextInt();
			
			switch(choice) {
			case 1:
				manager.inputData();
				break;
			case 2:
				manager.searchData();
				break;
			case 3:
				manager.deleteData();
				break;
			case 4:
				manager.printData();
				break;
			case 5:
				System.out.println("프로그램을 종료합니다.");
				break menu;
			}
		}
		MenuViewer.INPUT.close();
	}
}
