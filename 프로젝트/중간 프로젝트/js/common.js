var name1 = sessionStorage.getItem("name")
var before_login = document.getElementsByClassName("before_login")
var after_login = document.getElementsByClassName("after_login")
var login_name = document.getElementsByClassName("login_name")

// 상단바의 =아이콘을 눌렀을 때 상당 메뉴가 나오도록
$(document).ready(function(){
    $(".fa-bars").click(function(){
        $(".nav_hidden").slideToggle("slow");   
    });

    login();
});

// 로그인이 되었으면 동작하는 함수
function login() {
    if(name1 != null) {
        login_name[0].innerText = name1 + "님 환영합니다"
        login_name[1].innerText = name1 + "님 환영합니다"
        $(before_login).hide();
        $(after_login).show();
    }
    else {
        $(after_login).hide();
    }
}

// 로그아웃 하는 함수
function logout() {
    sessionStorage.clear();
}
