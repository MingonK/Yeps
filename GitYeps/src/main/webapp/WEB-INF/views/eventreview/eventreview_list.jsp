<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Yeps 이벤트리뷰리스트</title>
</head>
<body>
	<div align="center">
		<table width=100%>
			<caption align="top"><font size="3"><b>이 벤 트 리 뷰 목 록</b></font></caption>
			<tr>
				<td align="right" colspan="8">
					<a href="eventreview_insert"><font color="blue"><u>글쓰기</u></font></a>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center">
					<table border="1" width="100%">
						<tr bgcolor="yellow">
							<th align="center">이벤트리뷰번호</th>
							<th align="center">이벤트번호</th>
							<th align="center">멤버번호</th>
							<th align="center">작성자</th>
							<th align="center" width="70%">내용</th>
							<th align="center">작성날짜</th>
							<th align="center">ip</th>
							<th align="center">삭제</th>
							<th align="center">수정</th>
						</tr>
						<c:if test="${empty eventReviewList}">
						<tr>
							<td colspan="8">등록된 이벤트리뷰가 없습니다.</td>
						</tr>
						</c:if>
						<c:forEach var="dto" items="${eventReviewList}">
						<tr>
							<td align="center">${dto.evrnum}</td>
							<td align="center">${dto.evnum}</td>
							<td align="center">${dto.mnum}</td>
							<td align="center">${dto.writer}</td>
							<td align="center">${dto.content}</td>
							<td align="center">${dto.writedate}</td>
							<td align="center">${dto.ip}</td>
							<td align="center"><a href="eventReview_delete?evrnum=${dto.evrnum}">삭제</a></td>
							<td align="center"><a href="eventReview_edit?evrnum=${dto.evrnum}">수정</a></td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>