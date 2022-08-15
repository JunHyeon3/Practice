var img = document.querySelectorAll(".pop_img img")
var pop_btn = document.querySelectorAll(".pop_img button")
var count=1; 

$(document).ready(function(){
    $(img[0]).show();
});

$(pop_btn[0]).click(function(){
    for(var i=0; i<img.length; i++){
        $(img[i]).hide();
    };        
    count--;
    if(count < 1) count = img.length; 
    $(img[count-1]).fadeIn("slow");
}); 

$(pop_btn[1]).click(function(){
    for(var i=0; i<img.length; i++){
    $(img[i]).hide();
    };
    count++;
    if(count > img.length) count = 1; 
    $(img[count-1]).fadeIn("slow");
}); 