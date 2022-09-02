onmessage = function(e) {
    var result = "A";
    var rate = e.data/10;
    rate = parseInt(rate);
    switch(rate) {
        case 10 : result = "A"; 
        case 9 : result = "A"; 
        break;
        case 8 : result = "B"; 
        break;
        case 7 : result = "C"; 
        break;
        case 6 : result = "D"; 
        break;
        default : result = "F";
    }
    postMessage(result)
}