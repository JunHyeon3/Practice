///*
// * [code review]
// * - ArrayStack 클래스를 2번 정의한 이유와 메서드로 또 선언한 이유를 모르겠습니다..
// * - 문제에서 주어진 양식을 바탕으로 풀기
// * - 화이트라인 1줄이상 사용하지 않기
// * - 클래스 정의는 메인 메서드가 있는 클래스 외부에 하기
// */
//
//class ArrayStack {
//    
//	int[] arr;
//	int top = -1;
//	
//	int peek() {
//		return arr[top];
//	}
//    
//	void setArr(int size) {
//		arr = new int[size];
//	}
//	
//	void push(int value) {
//		if (top < arr.length - 1) {
//			arr[++top] = value;
//			System.out.println("Inserted Item : " + value);
//		}
//		else {
//			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
//		}
//	}
//	
//	int pop() {
//		if (top > -1) {
//			return arr[top--];
//		}
//		else {
//			System.out.println("스택이 비었습니다!");
//			
//			return -1;
//		}
//	}
//}
//
//public class Portfolio3F {
//
//	public static void main(String[] args){
//		ArrayStack stack = new ArrayStack();
//		
//		stack.setArr(5);
//		
//		stack.push(20);
//		stack.push(15);
//		stack.push(10);
//		stack.push(55);
//		stack.push(8);
//		stack.push(5);
//		
//		System.out.println("\ntop에 있는 아이템 출력 : " + stack.peek());
//		System.out.println("pop 실행 : " +stack.pop());
//		System.out.println("pop 실행 : " +stack.pop());
//		System.out.println("pop 실행 : " +stack.pop());
//		System.out.println("pop 실행 : " +stack.pop());
//		System.out.println("pop 실행 : " +stack.pop());
//		System.out.println("pop 실행 : " +stack.pop());
//	}
//
//}
