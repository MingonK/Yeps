<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>Yeps 이벤트 리스트</title>
</head>
<body>
<div align="center">
	<table border="1" width="100%">
		<caption>이 벤 트 목 록</caption>
		<tr bgcolor="yellow">
			<td align="right" colspan="9"><a href="event_write">이벤트 등록</a></td>
		</tr>
		<tr bgcolor="green">
			<th align="center">번호</th>
			<th align="center">rnum</th>
			<th align="center">eventname</th>
			<th align="center">start_time</th>
			<th align="center">end_time</th>
			<th align="center">storename</th>
			<th align="center" width="50%">content</th>
			<th align="center">discount</th>
			<th align="center" width="10%">IP</th>
		</tr>
	<c:if test="${empty eventList}">
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
<%@ include file="../bottom.jsp"%>
