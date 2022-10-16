/*
 * [code review]
 * - 화이트라인 한줄 이상 사용하지 않기
 * - setArr메서드 에서 top=0;으로 하면 안된다. 그 이유는 만약 아무 값도 push하지 않고 pop을 할 때 문제가 생길 수 있다.
 *   userSet 변수는 필요가 없다. 그 이유는 나중에 배열의 크기가 필요할 때 arr.length를 사용하면 된다.
 * - push메서드에서 userSet을 arr.length-1로 바꾸고
 *   arr[top] = item; top++;를 arr[++top] = item으로 바꾸고
 *   else문의 top = userSet-1;은 필요없으니 빼준다.
 * - pop메서드에서 top < 0 일때 top=0; popValue=-1;은 필요 없으니 빼주고 return top;으로 바꿔준다.
 *   else에서 popValue=arr[top]; pop--;을 return arr[top--]한줄로 바꿔준다.
 */

class ArrayStack{
	int[] arr;
	int top = -1;
	int popValue = 0;
	
	int peek() {
		return arr[top];
	}
	
	void setArr(int number) {
		this.arr = new int[number];
	}
	
	void push(int item) {
		if(top < arr.length-1) {
			arr[++top]=item;
			System.out.println("Inserted Item : "+ item);
		}
		else {
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
		}
	}
	
	int pop() {
		if(top<0) {
			System.out.println("스택이 비었습니다!");
			return top;
		}
		else {
			return arr[top--];
		}
	}
}

public class Quiz03C {

	public static void main(String[] args) {
		
		ArrayStack stack = new ArrayStack();
		
		stack.setArr(5);
		
		stack.push(20);
		stack.push(15);
		stack.push(10);
		stack.push(55);
		stack.push(8);
		stack.push(5);
		
		System.out.println("\ntop에 있는 아이템 출력 : "+stack.peek());
		
		System.out.println("pop 실행 : "+stack.pop());
		System.out.println("pop 실행 : "+stack.pop());
		System.out.println("pop 실행 : "+stack.pop());
		System.out.println("pop 실행 : "+stack.pop());
		System.out.println("pop 실행 : "+stack.pop());
		System.out.println("pop 실행 : "+stack.pop());
	}

}
