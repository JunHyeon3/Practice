/*
 * [상속 관계] IS-A 관계
 * 	~는 ~다.
 * ex1) 학생은 사람이다. (o)
 * 		학생 : 자식, 사람 : 부모
 * ex2) 사람은 학생이다. (x)
 * 
 * [포함 관계] HAS-A 관계
 * 	~는 ~를 소유(포함)하고 있다.
 * ex1) 핸드폰은 카메라를 포함하고 있다. (o)  
 * 		핸드폰 : 부모, 카메라 : 자식
 * ex2) 카메라는 핸드폰을 포함하고 있다. (x)
 * 
 * ex1) 경찰이 총을 소유하고 있다. (o)
 * 		경찰 : 자식,  총 : 부모
 * ex2) 총이 경찰을 소유하고 있다. (x)
 */

//class Gun {
//	int bullet;
//	
//	public Gun(int bnum) {
//		bullet = bnum;
//	}
//	
//	public void shoot() {
//		System.out.println("BBANG!");
//		bullet--;
//	}
//}
//
//class Police extends Gun {
//	int handcuffs;
//	
//	public Police(int bnum, int bcuff) {
//		super(bnum);
//		handcuffs = bcuff;
//	}
//	
//	public void putHandcuff() {
//		System.out.println("SNAP!");
//		handcuffs--;
//	}
//}
//
//public class InheritanceISA {
//
//	public static void main(String[] args) {
//		Police pman = new Police(5, 3);
//		pman.shoot();
//		pman.putHandcuff();
//	}
//
//}