window.onload = function(){
    slideShow();
}
var index = 0;
var slide;
var recommend = document.getElementsByClassName("recommend_car");
var btn = document.getElementsByClassName("recommend_btn")
//이미지 넘기기
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
//아래 버튼으로 이미지 변경
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
//일시 정지
var control = true;
function pause(){
    if(control==true){
        clearTimeout(slide);
        control=false;
        $(".fa-play").show();
        $(".fa-pause").hide();
    }
    else {
        setTimeout(slideShow, 1000);
        control=true;
        $(".fa-play").hide();
        $(".fa-pause").show();
    }
}

//인기 차종 + 모양 나타내기
$(".recommend_car").mouseover(function(){
    $(".plus, .plusi").css("opacity","1")
}).mouseout(function(){
    $(".plus, .plusi").css("opacity","0")
})


// var doubleFlag = false;
// function check() {
//     if(doubleFlag) {return doubleFlag;}
//     else {
//         doubleFlag = true;
//         return false;
//     }

// }