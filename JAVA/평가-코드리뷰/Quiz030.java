/*
 * [code review]
 * - 패키지는 지우기
 * - public ArrayStack(){ setArr(); }는 뭔지 모르겠습니다..
 * - setArr메서드는 배열의 크기를 인수로 받고, 그 값을 가지고 정수형 배열 객체를 생성하면 된다.
 * - push메서드에서 top += 1; 과 arr[top] = value;를 else로 묶어 top == arr.lentgh-1이 아닐때 실행되도록 하면 된다.
 * - pop메서드는 값만 return하면 되므로 println()은 필요 없다.
 *   int res = arr[top]; arr[top] = -1; top -= -1; return res;이 4줄의 코드는 단순히 return arr[top--];로 쓸 수 있다.
 *   arr[top]에 -1을 저장할 필요는 없다. 
 */


class ArrayStack{
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}

	public void setArr(int size) {
		arr = new int[size];
	}

	public void push(int value) {
		System.out.println("Inserted Item : " + value);
		
		if (top == arr.length-1) {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
		}
		else {
			arr[++top] = value;
		}
	}
	
	public int pop() {
		if (top == -1) {
			System.out.println("스택이 비어있습니다!");
	        return -1;
	    }

	    return arr[top--];
	}
	
}

public class Quiz030 {

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
