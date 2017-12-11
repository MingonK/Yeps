<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp" %>

<html>
<head>
	<title>레스토랑 리스트 사진목록 + 리뷰 + 평점 달 수 있도록 구현해둔 곳</title>
	<style type="text/css">
		td{
		  border: 1px solid gray;
		  width: 1100px;
		  height: 180px;
		  margin: 2px;
		}
	</style>
	
</head>
<body>

	<h3>Been to these businesses recently?</h3><p>
	
	<table>
	
	<tr>
		<c:if test="${empty rlist}">
			<td>목록이 없음</td>
		</c:if>
	<tr>
	
	<tr>
		<c:forEach var="dto" items="${rlist}" varStatus="countnumber">
			<td>
				${countnumber.count}<p>
				사진(식당번호):${dto.rnum}<br>
				<a href="review_selectedres?rnum=${dto.rnum}">식당명:${dto.rname}</a><br>
				위치:${dto.raddress}<br>
				<a href="review_write">별점:미구현</a>
			</td>
		
			<c:if test="${countnumber.count%2 == 0}">
				<tr></tr>
			</c:if>
		</c:forEach>
	</tr>
	
	</table>
	<p><p>
	★★ 바뀐부분:1.사진 안눌림 2.식당명을 누르면 그 식당에 해당하는 리뷰들이 나오는 페이지로 이동함.3.별점을 선택하면 선택한별점을 가지고 작성페이지로 이동함★★<p>
	★★rnum으로 사진+식당명+위치가 뿌려지고, 그 뿌려진곳에서 별점을 선택하면, 별점과함께 리뷰작성페이지로 이동함. 식당명을 클릭하면, rnum을 가지고 해당 식당사이트로 이동함★★<p>

</body>
</html>

<%@ include file="../bottom.jsp" %>

