<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Yeps 카테고리 리스트</title>
</head>
<body>
<div align="center">
	<table width="70%">
		<caption align="top"><font size="3"><b>카 테 고 리 목 록</b></font></caption>
		<tr>
			<td align="right" colspan="4">
			<a href="category_insert"><font color="blue"><u>글쓰기</u></font></a>
			</td>
		</tr>
		<tr>
		<td colspan="4" align="center">
			<table border="1" width="100%">
				<tr bgcolor="yellow">
					<th align="center" width="10%">번호</th>
					<th align="center" width="50%">카테고리명</th>
					<th align="center" width="10%">삭제</th>
					<th align="center" width="10%">수정</th>
				</tr>
				<c:if test="${empty categoryList}">
				<tr>
					<td colspan="4">등록된 카테고리가 없습니다.</td>
				</tr>
				</c:if>
				<c:forEach var="dto" items="${categoryList}">
				<tr>
					<td align="center">${dto.cnum}</td>
					<td align="center">${dto.cname}</td>
					<td align="center"><a href="category_delete?cnum=${dto.cnum}">삭제</a></td>
					<td align="center"><a href="category_edit?cnum=${dto.cnum}">수정</a></td>
				</tr>
			</c:forEach>
			</table>
			</td>
			</tr>
		</table>
</div>
</body>
</html>