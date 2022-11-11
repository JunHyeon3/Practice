import item.ItemBusinessRule;
import item.ItemView;

public class Main {

	public static void main(String[] args) {
		ItemBusinessRule manager = new ItemBusinessRule();
		
		int choice = 0;
		menu:
		while(true) {
			ItemView.showMenu();
			choice = ItemView.INPUT.nextInt();
			
			switch(choice) {
			case 1:
				manager.save();
				break;
			case 2:
				manager.find();
				break;
			case 3:
				manager.update();
				break;
			case 4:
				manager.delete();
				break;
			case 5:
				manager.findAll();
				break;
			case 6:
				manager.clearStore();
				break;
			case 7:
				System.out.println("프로그램을 종료합니다.");
				break menu;
			}
		}
		
		ItemView.INPUT.close();
	}

}
