$(document).ready(function(){
    myMap();
});

// 구글 맵 api
function myMap() {
    var myCenter = new google.maps.LatLng(37.50324579472511, 126.87893517055778);
    var mapProp = {
        center:myCenter,
        zoom:17,
        mapTypeId:google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map"), mapProp);

    var marker = new google.maps.Marker({
        position : myCenter,
        title : "하이 렌트카",
        animation : google.maps.Animation.BOUNCE
    });
    marker.setMap(map);

    var contentString = "하이 렌트카 구로점 <br> 서울특별시 구로구 경인로 557";
    var infowindow = new google.maps.InfoWindow({ content: contentString });
    marker.addListener("click", function() {
        infowindow.open({
            anchor: marker
        });
    });
}

// 네이버 맵 api
// var container = document.getElementById('map');
// var options = { 
// 	center: new kakao.maps.LatLng(37.503246, 126.878935),
// 	level: 3,
//     draggable : false
// };
// var map = new kakao.maps.Map(container, options);

// var markerPosition  = new kakao.maps.LatLng(37.503246, 126.878935); 
// var marker = new kakao.maps.Marker({
//     position: markerPosition
// });
// marker.setMap(map);

// var iwContent = '<div style="border-radius:14px; padding:5px; font-weight:bold;">하이렌트카<br>서울 구로구 경인로 557</div>'
// var iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);
// var infowindow = new kakao.maps.InfoWindow({
//     position : iwPosition, 
//     content : iwContent 
// });
// infowindow.open(map, marker); 

// var mapTypeControl = new kakao.maps.MapTypeControl();
// map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
// var zoomControl = new kakao.maps.ZoomControl();
// map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


