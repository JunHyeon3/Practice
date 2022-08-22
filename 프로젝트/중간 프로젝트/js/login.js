// 로그인시 아이디와 비밀번호 입력되었는지 확인하는 함수
var id = document.getElementById("login_id")
var pw = document.getElementById("login_pw")
var id1 = localStorage.getItem("id")
var pw1 = localStorage.getItem("pw")

// 로그인시 모든 입력사항이 입력되었는지 확인하는 함수
function check_login() {
    if(id.value.length == 0) {
        alert("아이디를 입력하세요.")
        return false;
    }
    else if(pw.value.length == 0) {
        alert("비밀번호를 입력하세요.")
        return false;
    }
    else if(id.value != id1) {
        alert("등록되지 않은 아이디 입니다.")
        return false;
    }
    else if(pw.value != pw1) {
        alert("비밀번호가 틀렸습니다.")
        return false;
    }
    else { 
        sessionStorage.setItem("name", localStorage.getItem("name"));
        return true; 
    }
}

// 회원가입시 모든 입력사항이 입력되었는지 확인하는 함수
var txt = document.getElementsByClassName("txt")
var check = document.getElementById("check1")
function check_join() {
    // txt[0] : 아이디
    if(txt[0].value.length == 0){
        alert("아이디를 입력하세요.")
        return false;
    }
    // 아이디 중복 확인이 되었는지 
    else if(document.getElementById("overlap").innerText != "사용가능!"){
        alert("다른 아이디를 사용 해주세요")
        return false;
    }
    // txt[1] : 비밀번호
    else if(txt[1].value.length == 0){
        alert("비밀번호를 입력하세요.")
        return false;
    }
    // txt[2] : 비밀번호 확인
    else if(txt[2].value.length == 0){
        alert("비밀번호 확인을 입력하세요.")
        return false;
    }
    // 비밀번호와 비밀번호확인 항목이 일치하는지 판단
    else if(txt[1].value != txt[2].value){
        alert("비밀번호가 일치하지 않습니다.")
        return false;
    }
    // txt[3] : 이름
    else if(txt[3].value.length == 0){
        alert("이름을 입력하세요.")
        return false;
    }
    // txt[4] : 생년월일
    else if(txt[4].value.length == 0){
        alert("생년월일을 입력하세요.")
        return false;
    }
    // txt[5] : 전화번호
    else if(txt[5].value.length == 0){
        alert("전화번호를 입력하세요.")
        return false;
    }
    // 인증번호확인이 되었는지 
    else if(document.getElementById("timer").innerText != "인증완료!"){
        alert("전화번호 인증을 해주세요")
        return false;
    }
    // 개인정보 수집 체크박스
    else if(!check.checked){
        alert("개인정보 수집동의를 해주세요.")
        return false;
    }
    return true;
}

var time = 180;
var min = "";
var sec = "";
var timer = null;
// 아이디 중복확인 함수
function overlap() {
    if(txt[0].value != id1 && txt[0].value != "") {
        document.getElementById("overlap").innerHTML = " 사용가능!"
    }
    else if(txt[0].value == id1 && txt[0].value != "") {
        document.getElementById("overlap").innerHTML = " 이미 사용중인 아이디 입니다."
    }
}

// 인증번호 전송 함수
function send_number() {
    timer = setInterval(function(){
        min = parseInt(time/60);
        sec = time%60;
        document.getElementById("timer").innerHTML =   min + "분" + sec + "초";
        time --;
        if(time<0) {
            clearInterval(timer);
            document.getElementById("timer").innerHTML = "다시 전송버튼을 누르세요"
            time = 180;
        }
    },1000);
}

// 인증번호 확인 함수
function confirm() {
    if(txt[6].value.length != 0) {
        clearInterval(timer);
        document.getElementById("timer").innerHTML = "인증완료!"
    }
}

// 회원가입 정보 저장 함수
function join_info() {
    localStorage.setItem("id", txt[0].value)
    localStorage.setItem("pw", txt[1].value)
    localStorage.setItem("name", txt[3].value)
}



// var before_login = document.getElementsByClassName("before_login")
// var after_login = document.getElementsByClassName("after_login")
// var login_name = document.getElementsByClassName("login_name")
// var name1 = sessionStorage.getItem("name")
// $(document).ready(function(){
//     login();
// });

// function login() {
//     if(name1 != "null") {
//         login_name[0].innerText = name1 + "님 환영합니다"
//         login_name[1].innerText = name1 + "님 환영합니다"
//         $(before_login).hide();
//         $(after_login).show();
//     }
// }

// function logout() {
//     sessionStorage.clear();
// }
