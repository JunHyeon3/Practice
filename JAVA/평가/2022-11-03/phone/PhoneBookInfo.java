package phone;

public class PhoneBookInfo {
	String name;
	String phoneNumber;
	
	public PhoneBookInfo(String name, String phoneNumber) {
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
	public void showPhoneInfo() {
		System.out.println("name : " + this.name);
		System.out.println("phone : " + this.phoneNumber);
	}
}
