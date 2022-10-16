/*
 * [code review]
 * - push메서드에서 3보다 크다 보다는 arr.length-1보다 크거나 같다로 하여 
 *   배열의 크기가 달라져도 코드 수정을 하지 않아도 되도록 하는 것이 좋을것 같다.
 *   top++; arr[top] = num;을 arr[++top] = num; 한줄로 표현할 수 있다.
 * - pop메서드에서도 top--; return arr[top + 1];을 return arr[top--]; 한줄로 표현할 수 있다.
 */

class ArrayStack {
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}
	
	void setArr(int num) {
		arr = new int[num];
	}
	
	void push (int num) {
		if (top >= arr.length-1) {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
			return;
		}
		
		arr[++top] = num;
		System.out.println("Inserted Item : " + num);
	}
	
	int pop() {
		if(top < 0) {
			System.out.println("스택이 비었습니다.");
			return top;
		}
		
		return arr[top--];
	}
}

public class Quiz03A {

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
		
		System.out.println("pop 실행 : " +stack.pop());
		System.out.println("pop 실행 : " +stack.pop());
		System.out.println("pop 실행 : " +stack.pop());
		System.out.println("pop 실행 : " +stack.pop());
		System.out.println("pop 실행 : " +stack.pop());
		System.out.println("pop 실행 : " +stack.pop());
	}

}