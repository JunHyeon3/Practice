var pop_btn = document.querySelectorAll(".pop_img button")
var count=1; 
var seoul_img = document.querySelectorAll(".pop_seoul img")
var incheon_img = document.querySelectorAll(".pop_incheon img")
var jeju_img = document.querySelectorAll(".pop_jeju img")

$(document).ready(function(){
    $(seoul_img[0]).show();
    $(incheon_img[0]).show();
    $(jeju_img[0]).show();
});

$(pop_btn[0]).click(function(){
    for(var i=0; i<seoul_img.length; i++){
        $(seoul_img[i]).hide();
    };        
    count--;
    if(count < 1) count = seoul_img.length; 
    $(seoul_img[count-1]).fadeIn("slow");
}); 

$(pop_btn[1]).click(function(){
    for(var i=0; i<seoul_img.length; i++){
        $(seoul_img[i]).hide();
    };
    count++;
    if(count > seoul_img.length) count = 1; 
    $(seoul_img[count-1]).fadeIn("slow");
}); 

$(pop_btn[2]).click(function(){
    for(var i=0; i<incheon_img.length; i++){
        $(incheon_img[i]).hide();
    };        
    count--;
    if(count < 1) count = incheon_img.length; 
    $(incheon_img[count-1]).fadeIn("slow");
}); 

$(pop_btn[3]).click(function(){
    for(var i=0; i<incheon_img.length; i++){
        $(incheon_img[i]).hide();
    };
    count++;
    if(count > incheon_img.length) count = 1; 
    $(incheon_img[count-1]).fadeIn("slow");
}); 

$(pop_btn[4]).click(function(){
    for(var i=0; i<jeju_img.length; i++){
        $(jeju_img[i]).hide();
    };        
    count--;
    if(count < 1) count = jeju_img.length; 
    $(jeju_img[count-1]).fadeIn("slow");
}); 

$(pop_btn[5]).click(function(){
    for(var i=0; i<jeju_img.length; i++){
        $(jeju_img[i]).hide();
    };
    count++;
    if(count > jeju_img.length) count = 1; 
    $(jeju_img[count-1]).fadeIn("slow");
}); 