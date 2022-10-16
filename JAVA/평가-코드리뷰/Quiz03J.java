/*
 * [code review]
 * - count 변수는 top변수로 대체할 수 있다.
 * - push 메서드에서 if문의 조건식을 top < arr.length-1로 바꿔주고, 
 *   arr[count] = num; count++;을 arr[++top] = num;으로 바꿔준다.
 * - pop 메서드에서 if문의 조건식을 top >= 0로 바꿔주고,
 *   else문의 중괄호가 빠져있으므로, 중괄호로 println()과 return top;을 묶어 준다.
 */

class ArrayStack {
	
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}

	int[] setArr(int num) {
		arr = new int[num];
		return arr;
	}
	
	void push(int num) {
		if (top < arr.length-1) {
			arr[++top] = num;
			System.out.println("Inserted Item : " + num);			
		} else 
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");	
	}
	
	int pop() {
		if (top >= 0) {
			return arr[top--];
		} else {
			System.out.println("스택이 비었습니다!");
			return top;
		}
	}
	
}

public class Quiz03J {

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
