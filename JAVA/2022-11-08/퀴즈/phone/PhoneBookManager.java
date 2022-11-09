/*
 * [평가 문제 응용]
 * - 배열을 HashSet으로 변경
 * - 이름이 같을 경우, '이미 저장된 이름입니다.' 출력하고 저장되지 않도록 하시오
 */

package phone;

import java.util.HashSet;
import java.util.Iterator;

public class PhoneBookManager {
	private HashSet<PhoneBookInfo> infoStorage = new HashSet<PhoneBookInfo>();
	
	private PhoneBookInfo search(String name) {
		PhoneBookInfo pbi = null;
		for(Object obj: infoStorage) {
			pbi = (PhoneBookInfo)obj; 
			if(pbi.getName().equals(name))
				return pbi;
		}
		return null;
	}
	
	public void inputData() {
		System.out.println("====================================");
		System.out.println("데이터 입력을 시작합니다...");
		
		System.out.print("이름 : ");
		String name = MenuViewer.INPUT.next();
		
		// 방법2 - 굳이 inputData에서 search() 메서드를 사용할 필요가 없음
		System.out.print("전화번호 : ");
		String phoneNumber = MenuViewer.INPUT.next();
		// add() 메서드는 저장이 가능하면 true, 저장할 수 없으면 false 반환
		if(infoStorage.add(new PhoneBookInfo(name, phoneNumber))) {
			System.out.println("데이터 입력이 완료되었습니다.");
			System.out.println("====================================\n");
		}
		else {
			System.out.println("데이터 입력이 되지않았습니다.");
			System.out.println("====================================\n");
		}

		// 방법1
//		PhoneBookInfo isSearch = search(name);
//		if(isSearch == null) {
//			System.out.print("전화번호 : ");
//			String phoneNumber = MenuViewer.INPUT.next();
//			
//			infoStorage.add(new PhoneBookInfo(name, phoneNumber));
//			
//			System.out.println("데이터 입력이 완료되었습니다.");
//			System.out.println("====================================\n");
//		}
//		else {
//			System.out.println("이미 저장되어 있습니다.");
//			System.out.println("====================================\n");
//		}
	}
	
	public void searchData() {
		System.out.println("====================================");
		System.out.println("데이터 검색을 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
		
		PhoneBookInfo isSearch = search(searchName);
		if(isSearch == null) {
			System.out.println("해당하는 데이터가 존재하지 않습니다.");
			System.out.println("====================================\n");
		}
		else {
			isSearch.showPhoneInfo();
			
			System.out.println("데이터 검색이 완료되었습니다.");
			System.out.println("====================================\n");
		}
	}
	
	public void deleteData() {
		System.out.println("====================================");
		System.out.println("데이터 삭제를 시작합니다...");
		
		System.out.print("이름 : ");
		String searchName = MenuViewer.INPUT.next();
	
		PhoneBookInfo isSearch = search(searchName);
		if(isSearch == null) {
			System.out.println("해당 데이터는 존재하지 않습니다.");
			System.out.println("====================================\n");
		}
		else {
			infoStorage.remove(isSearch);
			
			System.out.println("데이터 삭제가 완료되었습니다.");
			System.out.println("====================================\n");
		}
	}
	
	public void printData() {
		System.out.println("====================================");
		System.out.println("전체 데이터 개수 : " + infoStorage.size());
		
		// 향상된 for문 사용 출력
//		for(Object pbi: infoStorage) {
//			((PhoneBookInfo)pbi).showPhoneInfo();
//		}
		
		// iterator() 사용 출력
		Iterator<PhoneBookInfo> iter = infoStorage.iterator();
		while(iter.hasNext())
			iter.next().showPhoneInfo();
		
		System.out.println("====================================\n");
	}
}