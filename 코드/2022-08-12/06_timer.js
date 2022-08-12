var count = 0; 

onmessage = function(e) {
    if(e.data == "start") {
        timer = setInterval(myCallback, 1000);
    }
    else if(e.data == "stop") {
        clearInterval(timer);
    }
}

//1초 간격으로 호출
function myCallback() {
    //시작과 동시에 1씩 추가
    count++;
    //메인의 addWorker.onmessage로 데이터 넘김
    postMessage(count);
}