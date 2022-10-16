/*
 * [code review]
 * - top++; arr[top] = userValue; 는 arr[++top] = userValue;로
 *   top--; return arr[top+1]; 는 return arr[top--];로
 *   변경만 해주면 좋을것 같습니다.
 */

class ArrayStack {
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}
	
	void setArr(int userValue) {
		arr = new int[userValue];
	}
	
	void push(int userValue) {
		if(top == arr.length-1) {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
		}
		else {
			arr[++top] = userValue;
			
			System.out.println("Inserted Item : " + userValue);
		}
	}
	
	int pop( ) {
		if (top == -1) {
			System.out.println("스택이 비었습니다!");
			return top;
		}
		else {
			return arr[top--];
		}
	}
}
public class Quiz03E {

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
