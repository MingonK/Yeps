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
		<form name="form" method="post">
			<%-- <c:forEach test="${eventList}"> --%>
			<!-- foreach로 이벤트 목록 생성, 한줄에 3개 그 다음은 다음줄로,테이블 외곽선 없애고 이미지 위에 글씨가 나오게 생성  -->


			<!-- 	 <div style="position: absolute;">
        <div style="position: relative; top: 100px; left: 200px;"><img src="resources/img/girl.jpg"></img></div>
    </div> -->
			<c:if test="${empty eventList}">
				<hr color="blue" width="70%">
				<h2>등록된 이벤트가 없습니다.</h2>
				<hr color="blue" width="70%">
			</c:if>
			<c:forEach var="dto" items="${eventList }">
			<input id="${dto.evnum}" type="image" src="resources/img/girl.jpg"
				style="width: 25%; height: 200px; margin-left: -30px;"
				onclick="window.location='event_content?evnum=${dto.evnum}'"> <br>
			<a href="event_restaurant">${dto.place}</a> <br>${dto.periode1}~${dto.periode2} <br> <a
				href="event_content?evnum=${dto.evnum}">이벤트내용</a> <br>
			<!-- 이벤트 내용중 앞부분 20여자를 나타낸다. -->
</c:forEach>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>