window.onload = function(){
    slideShow();
}
var index = 0;
var recommend = document.getElementsByClassName("recommend_car");
var slide;
var btn = document.getElementsByClassName("recommend_btn")

function slideShow() {
    for (var i = 0; i < recommend.length; i++) {
        recommend[i].style.display = "none";
        btn[i].style.background = "white";
    }
    index++;
    if (index > recommend.length) {
        index = 1;
    }
    btn[index-1].style.background = "black";
    recommend[index-1].style.display = "block";
    slide = setTimeout(slideShow, 2000);
}

var doubleFlag = false;
function check() {
    if(doubleFlag) {return doubleFlag;}
    else {
        doubleFlag = true;
        return false;
    }

}

function changeShow(n) {
    for (var i = 0; i < recommend.length; i++) {
        recommend[i].style.display = "none";
        btn[i].style.background = "white";
    }
    clearTimeout(slide);
    switch(n) {
        case 0: recommend[0].style.display = "block"; 
                btn[0].style.background = "black"; 
                index = 1; 
                break;
        case 1: recommend[1].style.display = "block"; 
                btn[1].style.background = "black"; 
                index = 2; 
                break;
        case 2: recommend[2].style.display = "block"; 
                btn[2].style.background = "black"; 
                index = 3; 
                break;
        case 3: recommend[3].style.display = "block"; 
                btn[3].style.background = "black"; 
                index = 4; 
                break;
        case 4: recommend[4].style.display = "block"; 
                btn[4].style.background = "black"; 
                index = 0; 
                break;
    }
    setTimeout(slideShow, 2000);
    
}
    
var control = true;
function pause(){
    if(control==true){
        clearTimeout(slide);
        control=false;
    }
    else {
        setTimeout(slideShow, 1000);
        control=true;
    }
}