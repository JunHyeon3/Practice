/*
 * [평가 문제 응용2]
 * - HashSet을 HashMap으로 변경
 * - key: name, value : 객체
 * - 이름이 같을 경우, '이미 저장된 이름입니다.' 출력하고 저장되지 않도록 하시오
 */
package phone;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

public class PhoneBookManager {
	private HashMap<String, PhoneBookInfo> infoStorage = new HashMap<String, PhoneBookInfo>();
	
	// 변경된 search() 메서드 - 메서드내에서 이름을 입력 받아 비교하기 
	private PhoneBookInfo search() {
		System.out.print("이름 : ");
		String name = MenuViewer.INPUT.next();
		
		for(String key: infoStorage.keySet()) {
			if(name.equals(key))
				return infoStorage.get(key);
		}
		return null;
	}
	
	public void inputData() {
		System.out.println("====================================");
		System.out.println("데이터 입력을 시작합니다...");
		
		System.out.print("이름 : ");
		String name = MenuViewer.INPUT.next();
		
		System.out.print("전화번호 : ");
		String phoneNumber = MenuViewer.INPUT.next();
		
		if(infoStorage.containsKey(name)) {
			System.out.println("이미 저장된 이름입니다.");
			System.out.println("====================================\n");
		}
		else {
			infoStorage.put(name, new PhoneBookInfo(name, phoneNumber));
			System.out.println("데이터 입력이 완료되었습니다.");
			System.out.println("====================================\n");
		}
	}
	
	public void searchData() {
		System.out.println("====================================");
		System.out.println("데이터 검색을 시작합니다...");
		
		PhoneBookInfo isSearch = search();
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
		
		PhoneBookInfo isSearch = search();
		if(isSearch == null) {
			System.out.println("해당 데이터는 존재하지 않습니다.");
			System.out.println("====================================\n");
		}
		else {
			infoStorage.remove(isSearch.getName());
			
			System.out.println("데이터 삭제가 완료되었습니다.");
			System.out.println("====================================\n");
		}
	}
	
	public void printData() {
		System.out.println("====================================");
		System.out.println("전체 데이터 개수 : " + infoStorage.size());
		
		Iterator<Entry<String, PhoneBookInfo>> iter = infoStorage.entrySet().iterator();
		while(iter.hasNext())
			iter.next().getValue().showPhoneInfo();
		
		System.out.println("====================================\n");
	}
}