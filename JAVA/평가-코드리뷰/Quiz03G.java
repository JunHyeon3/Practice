/*
 * [code review]
 * - top++; arr[top] = push; 만 arr[++top] = push;로 바꿔주면 좋을것 같습니다.
 */

class ArrayStack{
	int[] arr;
	int top = -1; // 인덱스
	
	int peek() {
		return arr[top];
	}

	public void setArr(int arr) {
		this.arr = new int[arr];
	}
	
	public void push(int push) {
		if(arr.length == top+1) {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
			return;
		}
		top++;
		arr[top] = push;
		System.out.println("Inserted Item : " + push);
	}
	
	public int pop() {
		if(top < 0) {
			System.out.println("스택이 비었습니다!");
			return top;
		}
		return arr[top--];
	}
	
}

public class Quiz03G {

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
