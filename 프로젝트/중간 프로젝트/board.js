$(document).ready(function(){
    // radios[0].checked = true;
    choice=sessionStorage.getItem("choice");
    if(choice==null) {
        radios[0].checked = true;
    }
    else { 
        radios[choice].checked = true;
    }
    chooseBoard();
});

var radios = document.getElementsByClassName("board_choice");
function chooseBoard() {
    for (var i = 0; i < radios.length; i++) {
        document.getElementById('board_' + radios[i].value).style.display = 'none';
        radios[i].parentNode.style.cssText = '';
        if (radios[i].checked) {
            document.getElementById('board_' + radios[i].value).style.display = 'block';
            radios[i].parentNode.style.cssText = 'border-bottom: 2px orangered solid; color: orangered;';
        }
    }
    sessionStorage.clear();
}


function changeBoard() {
    if (radios[0].checked) {
        sessionStorage.setItem("choice", "0");
    }
    else if (radios[1].checked) {
        sessionStorage.setItem("choice", "1");
    }
    else if (radios[2].checked) {
        sessionStorage.setItem("choice", "2");
    }
    location.href='board_main.html';
}




$(document).ready(function(){
    $(".flip1").click(function(){
        $(".panel1").slideToggle("slow");
    });
    $(".flip2").click(function(){
        $(".panel2").slideToggle("slow");
    });
    $(".flip3").click(function(){
        $(".panel3").slideToggle("slow");
    });
    $(".flip4").click(function(){
        $(".panel4").slideToggle("slow");
    });
});
