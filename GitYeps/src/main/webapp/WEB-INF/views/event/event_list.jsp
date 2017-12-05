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
			<td align="right" colspan="12"><a href="event_write">이벤트 등록</a></td>
		</tr>
		<tr bgcolor="green">
			<th align="center">번호</th>
			<th align="center">cnum</th>
			<th align="center">eventname</th>
			<th align="center">start_date</th>
			<th align="center">start_time</th>
			<th align="center">end_date</th>
			<th align="center">end_time</th>
			<th align="center">store_address</th>
			<th align="center">content</th>
			<th align="center">discount</th>
			<th align="center">category</th>
			<th align="center">IP</th>
		</tr>
	<c:if test="${empty eventList}">
		<tr>
			<td colspan="12">등록된 게시글이 없습니다.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${eventList}">
		<tr>
			<td>${dto.evnum}</td>
			<td>${dto.cnum}</td>
			<td><a href="event_content?evnum=${dto.evnum}">${dto.eventname}</a></td>
			<td>${dto.start_date}</td>
			<td>${dto.start_time}</td>
			<td>${dto.end_date}</td>
			<td>${dto.end_time}</td>
			<td>${dto.store_address}</td>
			<td>${dto.content}</td>
			<td>${dto.discount}</td>
			<td>${dto.category}</td>
			<td>${dto.ip}</td>
		</tr>
	</c:forEach>		
	</table>
</div>
<%@ include file="../bottom.jsp"%>
