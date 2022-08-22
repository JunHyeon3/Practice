window.onload = function(){
    slideShow();
}
var index = 0;
var slide = null;
var car = document.getElementsByClassName("recommend_car");
var btn = document.getElementsByClassName("recommend_btn")

//추천 차량에서 자동으로 이미지 넘어가는 함수
function slideShow() {
    for (var i = 0; i < car.length; i++) {
        car[i].style.display = "none";
        btn[i].style.background = "white";
    }
    index++;
    if (index > car.length) {
        index = 1;
    }
    btn[index-1].style.background = "black";
    car[index-1].style.display = "block";
    slide = setTimeout(slideShow, 2000);
}

//추천 차량아래에 있는 버튼으로 이미지를 변경하는 함수
function changeShow(n) {
    for (var i = 0; i < car.length; i++) {
        car[i].style.display = "none";
        btn[i].style.background = "white";
    }
    switch(n) {
        case 0: car[0].style.display = "block"; 
                btn[0].style.background = "black"; 
                index = 1; 
                break;
        case 1: car[1].style.display = "block"; 
                btn[1].style.background = "black"; 
                index = 2; 
                break;
        case 2: car[2].style.display = "block"; 
                btn[2].style.background = "black"; 
                index = 3; 
                break;
        case 3: car[3].style.display = "block"; 
                btn[3].style.background = "black"; 
                index = 4; 
                break;
        case 4: car[4].style.display = "block"; 
                btn[4].style.background = "black"; 
                index = 0; 
                break;
    }
    
}

// 차량 슬라이드를 일시정지, 재개 하는 함수
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

//인기 차종에 마우스 오버시 + 모양 나타내기
$(".recommend_car").mouseover(function(){
    $(".plus, .plusi").css("opacity","1")
}).mouseout(function(){
    $(".plus, .plusi").css("opacity","0")
})
