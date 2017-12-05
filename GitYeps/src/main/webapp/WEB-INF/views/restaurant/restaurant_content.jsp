<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>

<html>
<head>
<title>�������</title>
</head>
<body>
	<div align="center" width="900">
		<b>������� ����</b>
		<h1>${getRest.rname }</h1>
		<a href="restaurant_uploadForm2?rnum=${getRest.rnum}">���� �߰�</a><br>
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
      var myaddress = '������� 463���� 12'// ���θ� �ּҳ� ���� �ּҸ� ���� (�ǹ��� �Ұ�!!!!)
      
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '�� �˻� ����� ���ų� ��Ÿ ��Ʈ��ũ ����');
          }
          var result = response.result;
          // �˻� ��� ����: result.total
          // ù��° ��� ��� �ּ�: result.items[0].address
          // ù��° �˻� ��� ��ǥ: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // �˻��� ��ǥ�� ���� �̵�
          //��Ŀ ǥ��
          
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          
//           // ��Ŀ Ŭ�� �̺�Ʈ ó��
//           naver.maps.Event.addListener(marker, "click", function(e) {
//             if (infowindow.getMap()) {
//                 infowindow.close();
//             } else {
//                 infowindow.open(map, marker);
//             }
//           });
//           // ��ũ Ŭ���� ���������� ����
//           var infowindow = new naver.maps.InfoWindow({
//               content: '<h4> [���̹� �����ڼ���]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
//           });
      });
      </script>
</body>
</html>



















