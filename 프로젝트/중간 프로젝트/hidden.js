
// document.getElementById("bars").addEventListener(click,alert("DD"));

// function hidden() {
//     alert("Ddd")
// }

$(document).ready(function(){
    $(".fa-bars").click(function(){
        $(".nav_hidden").slideToggle("slow");   
    });
});