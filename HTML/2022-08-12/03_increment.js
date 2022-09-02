onmessage = function(e) {
    var m = e.data;
    m++;
    this.postMessage(m);
}