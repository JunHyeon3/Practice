/*
 * [code review]
 * - 변수 num은 arr.lenght로 대체, count는 바뀌는 top값으로 대체
 * - setArr메서드에서 this,num = num; 지우기
 * - push메서드에서 if문의 조건식 num < count을 top >= arr.length-1로 바꾸기
 *   else 문의 arr[count-1]을 arr[++top]으로 바꾸기
 * - pop메서드에서 if문의 조건식 num < 0을 top < 0으로 바꾸고 return top;추가해주기
 *   arr[--num]을 arr[top--]으로 바꾸기
 */

class ArrayStack{
	int[] arr;
	int top = -1;
	
	int peek() {
		return arr[top];
	}

	public void setArr(int num) {
		arr = new int[num];
	}
	
	public void push(int insertNum) {
		if(top >= arr.length-1) 
			System.out.println("스택이 꽉 찼습니다! 용량 초과!");
		else {
			arr[++top] = insertNum;
			System.out.println("Inserted Item " + insertNum);
		}
	}
	
	public int pop() {
		if(top < 0) {
			System.out.println("스택이 비었습니다!");
			return top;
		}
		
		return arr[top--];
	}
}

public class Quiz03dd {
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
