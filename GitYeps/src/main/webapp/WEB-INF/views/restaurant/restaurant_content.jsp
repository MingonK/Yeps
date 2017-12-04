<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>

<html>
<head>
<title>레스토랑</title>
</head>
<body>
	<div align="center" width="900">
		<b>레스토랑 보기</b>
		<h1>${getRest.rname }</h1>
		<a href="restaurant_uploadForm2?rnum=${getRest.rnum}">사진 추가</a><br>
		<c:forEach var="dto" items="${uploadFileList}">
		<img width="100" height="100" src="getImage/${dto.file_name }">
		</c:forEach>
	</div>
	<div id="in">
	    <div id="map" style="width:250px;height:250px;"></div>
	    <span>${getRest.roadAddrPart1}</span><br>
	    <span>${getRest.roadAddrPart2}</span><br>
	    <span>${getRest.addrDetail}</span>
	</div>
	    
	    
	    
	    
    <script>
      var map = new naver.maps.Map('map',{
    	  mapTypeControl : true 
      });
      var myaddress = '봉오대로 463번길 12'// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          //마커 표시
          
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          
//           // 마커 클릭 이벤트 처리
//           naver.maps.Event.addListener(marker, "click", function(e) {
//             if (infowindow.getMap()) {
//                 infowindow.close();
//             } else {
//                 infowindow.open(map, marker);
//             }
//           });
//           // 마크 클릭시 인포윈도우 오픈
//           var infowindow = new naver.maps.InfoWindow({
//               content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
//           });
      });
      </script>
</body>
</html>



















