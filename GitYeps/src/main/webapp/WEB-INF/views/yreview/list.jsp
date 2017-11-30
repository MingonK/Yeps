<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>yeps 이벤트 리스트</title>
</head>
<body>
<div align="center">
	<b>글 목 록</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="event_write">이벤트 등록</a></td>
		</tr>
	</table>
	<table border="1" width="600">
		<tr bgcolor="green">
			<th>번호</th>
			<th>rnum</th>
			<th>이벤트 이름</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
			<th>가게명</th>
			<th>내용</th>
			<th>할인율</th>
			<th>IP</th>
		</tr>
	<c:if test="${empty EventList}">
		<tr>
			<td colspan="9">등록된 게시글이 없습니다.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${eventList}">
		<tr>
			<td>${dto.evnum}</td>
			<td>${dto.rnum}</td>
			<td>${dto.eventname}</td>
			<td>${dto.start_time}</td>
			<td>${dto.end_time}</td>
			<td>${dto.storename}</td>
			<td>${dto.content}</td>
			<td>${dto.discount}</td>
			<td>${dto.ip}</td>
		</tr>
	</c:forEach>		
	</table>
</div>
</body>
</html>

