package functionalinterface;

import java.util.function.Supplier;

public class SupplierEx01 {

	public static void main(String[] args) {
		// Supplier<T> ==================================================== 
		// T는 반환형의 type
		// get() 메서드 : 매개변수 없고, 반환값 있음 
		// lambda : () -> expression
		// ============================================================= 
		
		Supplier<String> supplier = () -> "신기한 함수형 인터페이스";
		System.out.println(supplier.get());
	}

}
 
		