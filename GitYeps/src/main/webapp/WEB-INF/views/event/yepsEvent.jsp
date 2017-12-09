<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>

<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>
<html>
<head>
<title>yeps event</title>
</head>
<body>
	<div align="center">
		<h2>여기는 Yeps Event 페이지입니다.</h2>
		<tr>
			<a href="event_regist">이벤트 등록</a>
		</tr>
		<br> <br>
		<form name="eventform" method="post">
			<%-- <c:forEach test="${eventList}"> --%>
			<!-- foreach로 이벤트 목록 생성, 한줄에 3개 그 다음은 다음줄로, 테이블 외곽선 없애고 이미지 밑으로 글씨가 나오게 생성  -->
			<c:if test="${empty eventList}">
				<hr color="blue" width="60%">
				<h2>등록된 이벤트가 없습니다.</h2>
				<hr color="blue" width="60%">
			</c:if>
			<c:set var="i" value="1"></c:set>
			<c:forEach var="dto" items="${eventList}">
				<input id="${dto.evnum}" type="image" src="resources/img/girl.jpg"
					style="width: 25%; height: 200px; margin-left: -30px;"
					onclick="window.location='event_content?evnum=${dto.evnum}'">
				<br>
				<a href="event_restaurant">${dto.place}장소</a>
				<br>${dto.periode1}~${dto.periode2} <br>
				<a href="event_content?evnum=${dto.evnum}">${dto.content}</a>
				<br>
				<!-- 이벤트 내용중 앞부분 20여자를 나타낸다. -->
				<c:if test="${i%3 == 0 }">
					<!-- 리스트에 한줄에 3개의 이벤트 목록을 띄우기 위해 그리고 한 페이지에 12개의 목록을 생성 , 그 다음은 다음 페이지. 
				목록이 개수에 따라 화면에 유동적으로 움직여야 한다. -->
					<br>
					<br>
				</c:if>
			</c:forEach>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>