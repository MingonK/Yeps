<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../top.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<style>
.checked {
	color: red;
}
</style>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 500px; height: 500px"></div>
	<script>
	  var map = new naver.maps.Map('map',{
  	  zoom: 8
    });
	  var markers = [],
	    infoWindows = [];
	   var j=0;
	   var k=1;
    	var myaddress =["봉오대로 463번길 12","봉오대로 365"];
    	for(var i=0;i<myaddress.length;i++){
    		
    		naver.maps.Service.geocode({address: myaddress[i]}, function(status, response) {
        	var result = response.result;
       		 var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
      		  map.setCenter(myaddr); // 검색된 좌표로 지도 이동
      		  // 마커 표시
      	  var marker = new naver.maps.Marker({
       		   position: myaddr,
      		    map: map,
      	        icon: {
      	        	url: './getImage/pin_s_'+(j+1)+'.png',
      	            size: new naver.maps.Size(22, 30),
      	            anchor: new naver.maps.Point(11, 30)
      	        }
      		  });
		
        iwContent = [
          '<div><h1>'+j+'</h1></div>'
        ].join('')
        var infowindow = new naver.maps.InfoWindow({
            content:iwContent
        });
        markers.push(marker)
        
   	 	naver.maps.Event.addListener(markers[j], "click", function(e) {
   	    if (infowindow.getMap()) {
   	        infowindow.close();
   	    } else {
   	        infowindow.open(map, marker);
   	    }
   	});
   	 	j++
    });
   };			
 
      </script>
</body>
</html>
<%@include file="../bottom.jsp"%>