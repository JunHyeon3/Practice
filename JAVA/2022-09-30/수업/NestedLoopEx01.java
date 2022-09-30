/*
 * [중첩 for 문]
 */
public class NestedLoopEx01 {

	public static void main(String[] args) {
		
		// break는 속해져 있는 반복문만 탈출한다.
		// 만일 다른 for문을 빠져나오고 싶은 경우, 
		// :으로 빠져나오고 싶은 for문 앞에 레이블을 설정하여 해당 반복문을 탈출할 수 있다.
		outer:
		for(int i=0; i<3; i++) {
			System.out.println("*** 바깥쪽 for문 " + (i+1) + "차 회전 ***");
			
			for(int j=0; j<3; j++) {
				System.out.println("*** 안쪽 for문 " + (j+1) + "차 회전 ***");
				
				if(i%2 == 1) 
					break outer; 
			}

			System.out.println();
			
							}
	}

}
