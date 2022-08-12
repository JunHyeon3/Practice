onmessage = function(e) {
    var op1 = e.data.op1;
    var op2 = e.data.op2;
    result = op1*op2;
    postMessage(result);
}