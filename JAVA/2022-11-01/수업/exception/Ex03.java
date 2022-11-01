package exception;

public class Ex03 {

	public static void main(String[] args) {
		for(int i=1; i<=10; i++) {
			System.out.println(i);
			
			try {
				// sleep() 메서드 자체에서 예외를 전가하고 있기 때문에, 사용할 때 예외 처리를 해줘야 한다.
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}