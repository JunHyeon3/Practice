var count = 0; 
//만일 stop버튼이 눌리면 start동작이 다시 수행되지 않도록 하는 변수
var control = true;

onmessage = function(e) {
    //만일 전송된 e의 값이 "start" 이고, control이 true일 경우
    if(e.data == "start" && control==true) {
        //setInerval()함수를 사용하여 myCallback 함수를 1000ms 주기로 실행
        timer = setInterval(myCallback, 1000);
    }
    //만일 전송된 e의 값이 "stop" 이고, count가 0이 아닐 경우
    //count가 0이 아닌 조건은 start를 한번도 실행 안했을 경우를 대비
    else if(e.data == "stop" && count != 0) {
        //clearInterval() 함수를 사용하여 카운팅을 중단한다.
        clearInterval(timer);
        //control을 false로 바꾸어, 다시 start 동작을 막음
        control = false;
    }
}
//1초 간격으로 호출
function myCallback() {
    //시작과 동시에 1씩 추가
    count++;
    //메인의 addWorker.onmessage로 데이터 넘김
    postMessage(count);
}