<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>yeps_review yreviewList</title>
</head>
<body>
<div align="center">
	<b>글 목 록</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="yreview_write">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="600">
		<tr bgcolor="green">
			<th>번호</th>
			<th>외래키1</th>
			<th>외래키2</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
			<th>평점</th>
			<th>파일</th>
			<th>IP</th>
		</tr>
	<c:if test="${empty yreviewList}">
		<tr>
			<td colspan="9">등록된 게시글이 없습니다.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${yreviewList}">
		<tr>
			<td>${dto.rvnum}</td>
			<td>${dto.no1}</td>
			<td>${dto.no2}</td>
			<td>${dto.writer}</td>
			<td>${dto.content}</td>
			<td>${dto.joindate}</td>
			<td>${dto.gradepoint}</td>
			<td>${dto.filenum}</td>
			<td>${dto.ip}</td>
		
		</tr>
	</c:forEach>		
	</table>
</div>
</body>
</html>

