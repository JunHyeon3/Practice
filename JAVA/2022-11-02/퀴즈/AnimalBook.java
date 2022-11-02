import java.util.Scanner;
import book.BookManager;

public class AnimalBook {
	private static BookManager manager = new BookManager();

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		String isYes = "";
		String[] yes = {"y", "Y", "yes", "Yes", "yEs","yeS", "YEs", "YeS", "yES", "YES"};
		String[] no = {"n", "N", "no", "No", "nO","NO"};
		
		escape :
		while(true) {
			System.out.print("정보를 입력할까요? (Y/N) ... ");
			isYes = input.nextLine();
			
			for(String y: yes) {
				if(y.equals(isYes)) {
					manager.inputData();
					continue escape;
				}
			}
			for(String n: no) {
				if(n.equals(isYes)) {
					System.out.println("정보 입력을 종료합니다.\n");
					break escape;
				}
			}
		}
		
		manager.showBook();
		input.close();
	}

}
