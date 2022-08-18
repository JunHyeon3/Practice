// 로그인시 아이디와 비밀번호 입력되었는지 확인하는 함수
var id = document.getElementById("idpw1")
var pw = document.getElementById("idpw2")

function check_login() {
    if(id.value.length == 0 || pw.value.length == 0){
        if(id.value.length == 0) {
            alert("아이디를 입력하세요.")
        }
        else if(pw.value.length == 0) {
            alert("비밀번호를 입력하세요.")
        }
        return false;
    }
    return true;
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
    // txt[6] : 인증번호
    else if(txt[6].value.length == 0){
        alert("인증번호를 입력하세요.")
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
function send_number() {
    var timer = setInterval(function(){
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