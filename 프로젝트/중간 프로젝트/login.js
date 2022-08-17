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


// var id = document.getElementById("idpw1")
// var pw = document.getElementById("idpw2")

// function check_idpw() {
//     if(id.value.length == 0 || pw.value.length == 0){
//         if(id.value.length == 0) {
//             alert("아이디를 입력하세요.")
//         }
//         else if(pw.value.length == 0) {
//             alert("비밀번호를 입력하세요.")
//         }
//         return false;
//     }
//     return true;
// }