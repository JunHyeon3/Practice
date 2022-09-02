//웹 페이지로 부터 숫자를 기다림
onmessage = function(e) {
    var sum = 0;
    // 받은 데이터에서 from에 해당하는 값
    var from = parseInt(e.data.from);
    // 받은 데이터에서 to에 해당되는 값
    var to = parseInt(e.data.to);
    for (var i=from; i<=to; i++){
        sum += i;
    }
    // 합산한 값을 worker 객체로 보냄
    postMessage(sum);
}