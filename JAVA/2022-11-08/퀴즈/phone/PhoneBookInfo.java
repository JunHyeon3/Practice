package phone;

public class PhoneBookInfo {
	String name;
	String phoneNumber;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public PhoneBookInfo(String name, String phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}

	public void showPhoneInfo() {
		System.out.println();
		System.out.println("name : " + this.name);
		System.out.println("phone : " + this.phoneNumber);
	}
	
	@Override
	public int hashCode() {
		return this.name.hashCode();
	}
	@Override
	public boolean equals(Object obj) {		
		if(obj instanceof PhoneBookInfo) {
			PhoneBookInfo pbi= (PhoneBookInfo)obj;
			System.out.println("이미 저장되어 있습니다");
			return name.equals(pbi.getName());
		}	
		else 
			return false;
	}
	
	// 방법1
//	@Override
//	public boolean equals(Object obj) {		
//		if(obj instanceof PhoneBookInfo) {
//			PhoneBookInfo pbi= (PhoneBookInfo)obj;
//			return name.equals(pbi.getName());
//		}	
//		else 
//			return false;
//	}
}
