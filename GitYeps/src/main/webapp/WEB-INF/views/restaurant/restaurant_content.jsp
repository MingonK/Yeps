<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
<%@include file="../top.jsp" %>
<script type="text/javascript">
function today1(){
	var day=new Array("mon","tue","wed","thu","fri","sat","sun");
	var mon="mon"
	var d = new Date();
	var day2=d.getDay();
	
	/* alert("${getRest.mon}"); */
	
}
</script>

<html>
<head>
<title>레스토랑</title>

</head>
<body onload="today1()">

	<div id="super-container">
	<div id="map" style="width:300px;height:150px;"></div>
    <script>
      var map = new naver.maps.Map('map');
      var myaddress = '${getRest.roadAddrPart1}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
      });
      </script>
	    <span>${getRest.roadAddrPart1}</span><br>
	    <span>${getRest.roadAddrPart2}</span><br>
	    <span>${getRest.addrDetail}</span>
	    </div>
	    <table style=width:300px border="1">
	    		<tr>
	    			<th>오늘</th>
	    			<td id="today1"></td>

	    		</tr>
	    		<tr>
	    			<th>모든메뉴</th>
	    			<td><a href="#">모든메뉴</a></td>
	    		</tr>
	    		<tr>
	    			<th>평균가격</th>
	    			<td>??</td>
	    		</tr>
	    </table>
	    <div id="hours">
	    <h1>영업시간</h1>
	    <table style=width:300px>
	    	<tbody>
	    		<tr>
	    		<th>월요일</th>
	    			<td><span>${getRest.mon}</span></td><td></td>
	    		</tr>
	    		<tr>
	    		<th>화요일</th>
	    			<td>${getRest.tue}</td>
	    		</tr>
	    		<tr>
	    		<th>수요일</th>
	    			<td>${getRest.wed}</td>
	    		</tr>
	    		<tr>
	    		<th>목요일</th>
	    			<td>${getRest.thu}</td>
	    		</tr>
	    		<tr>
	    		<th>금요일</th>
	    			<td>${getRest.fri}</td>
	    		</tr>
	    		<tr>
	    		<th>토요일</th>
	    			<td>${getRest.sat}</td>
	    		</tr>
	    		<tr>
	    		<th>일요일</th>
	    			<td>${getRest.sun}</td>
	    		</tr>
	    	</tbody>
	    </table>
	    <h1>가게정보</h1>
			<table style=width:300px>
				<tbody>
					<tr>
						<th>앉는방식</th>
						<td>${getRest.reststyle }</td>
					</tr>
					<tr>
						<th>예약</th>
						<td>${getRest.reserv }</td>
					</tr>
					<tr>
						<th>배달</th>
						<td>${getRest.delivery }</td>
					</tr>
					<tr>
						<th>TAKEOUT</th>
						<td>${getRest.takeout }</td>
					</tr>
					<tr>
						<th>주차장</th>
						<td>${getRest.parking }</td>
					</tr>
					<tr>
						<th>키드존</th>
						<td>${getRest.kidzone }</td>
					</tr>
					<tr>
						<th>소음</th>
						<td>${getRest.noise }</td>
					</tr>
					<tr>
						<th>주류</th>
						<td>${getRest.alcohol }</td>
					</tr>
					<tr>
						<th>대기실</th>
						<td>${getRest.waiting }</td>
					</tr>
					<tr>
						<th>와이파이</th>
						<td>${getRest.wifi }</td>
					</tr>
					<tr>
						<th>화장실</th>
						<td>${getRest.toilet }</td>
					</tr>
					<tr>
						<th>테이블 갯수</th>
						<td>${getRest.tablecount } ${getRest.standard}개 기준</td>
					</tr>
					<tr>
						<th>바쁜시간</th>
						<td>${getRest.busytime }</td>
					</tr>
				</tbody>
			</table>
	    		</div>
</body>
</html>
<script>
</script>
<%@include file="../bottom.jsp" %>

















