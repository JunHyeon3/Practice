/*
 * [code review]
 * - pop메서드안의 else문에서 top값을 -1로 저장할 필요가 없다. 
 *    그 이유는 어차피 이전 조건을 만족하지 못할때 -1값인 상태로 오기 때문이다.
 */

/*
 * [문제]
 * stack 메모리 구조를 Java로 간단히 구현하시오.
 */

class ArrayStack {
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}
	
	void setArr(int size) {
		arr = new int[size];
	}
	
	void push(int value) {
		if (top < arr.length - 1) {
			arr[++top] = value;
			
			System.out.println("Inserted Item : " + value);
		}
		else {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
		}
	}
	
	int pop() {
		if (top > -1) {
			return arr[top--];
		}
		else {
			System.out.println("스택이 비었습니다!");
			
			return top;
		}
	}
}

public class Quiz03H {

	public static void main(String[] args) {
		
		ArrayStack stack = new ArrayStack();
		
		stack.setArr(5);
		
		stack.push(20);
		stack.push(15);
		stack.push(10);
		stack.push(55);
		stack.push(8);
		stack.push(5);
		
		System.out.println("\ntop에 있는 아이템 출력 : " + stack.peek());
		
		System.out.println("pop 실행 : " + stack.pop());
		System.out.println("pop 실행 : " + stack.pop());
		System.out.println("pop 실행 : " + stack.pop());
		System.out.println("pop 실행 : " + stack.pop());
		System.out.println("pop 실행 : " + stack.pop());
		System.out.println("pop 실행 : " + stack.pop());
		
	}

}
