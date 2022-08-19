var radios = document.getElementsByClassName("board_choice");
$(document).ready(function(){
    changeBoard();
    radios[0].checked=true;
    radios[0].parentNode.style.cssText = 'border-bottom: 2px orangered solid; color: orangered;';
    // chooseBoard();
    // document.getElementById('board_inquiry').style.display = 'block';
    // for (var i = 0; i < radios.length; i++) {
        //     document.getElementById('board_' + radios[i].value).style.display = 'none';
        //     radios[i].parentNode.style.cssText = '';
        // }
    });
    document.write('<script src="board_read.js"></script>');
    
function chooseBoard() {
    for (var i = 0; i < radios.length; i++) {
        document.getElementById('board_' + radios[i].value).style.display = 'none';
        radios[i].parentNode.style.cssText = '';
        if (radios[i].checked) {
            document.getElementById('board_' + radios[i].value).style.display = 'block';
            radios[i].parentNode.style.cssText = 'border-bottom: 2px orangered solid; color: orangered;';
        }
    }
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
});
