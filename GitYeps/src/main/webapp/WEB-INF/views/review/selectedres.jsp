<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="../top.jsp" %>
    
<html>
<head>
	<title>아직 타이틀 미설정</title>
	
	<style type="text/css">
	
	</style>
	
	<script src="resources/js/placeholders.min.js"></script>
	
</head>
<body>

	<form name="selectKeyword" action="review_keyword" method="post">  

	평균평점 |리뷰작성자수 | Details<br>
	지도 | 사진1 |사진2 |사진3 ...<p>

	사진1 - 리뷰<br> 
	사진2 - 리뷰<br> 
	사진3 - 리뷰<p>

	<a href="">Show more review highlights</a><p>
	<hr>
	식당사진|ad(광고)|식당명<br>
	평점|리뷰작성자수|위치
	내용...................<a href="">read more</a><br>
	식당위치 
	<hr>
	<hr>
	식당사진|ad(광고)|식당명<br>
	평점|리뷰작성자수|위치
	내용...................<a href="">read more</a><br>
	식당위치 
	<hr><p>

	<h1>Ask the Community</h1>
	Is the king-dum xiao long bao filling enough on its own?<br> 
	I'm not really a big eater and I want to try one,<br>
	but I don't know if I'll have to order more things with it.<p>
	사진 | 의견 <br>
	기록날짜|
	<a href="">View 3 more answers</a><p>
	<hr>

	<a href="restaurant_qna">See all 2 question for ${Rname}(내가누른식당)</a><p><p>

	<h1>Recommended Reviews for ${Rname}(내가누른식당)</h1><p><p>

	<input type="text" placeholder="Search within the reviews" autocomplete="on" value="">
	<button onclick="review_keyword">버튼</button><p><p><p>
 
	별점 주기<br>
	<a href="review_write">Start your review of ${Rname}(내가누른식당)</a><p>
 
 	<table border="1">
	<tr>
 		<c:if test="${empty selectedDataM}">
 			<td>해당 식당에 대한 회원정보가 없습니다.</td>
 		</c:if>
 	</tr>	
	<tr>
 		<c:forEach var="mdto" items="${selectedDataM}">
 			<td>
 				작성자:${mdto.name}<br>
 				리뷰수:${mdto.reviewcount}<br>
 				사진수:${mdto.imagecount}<p>
 			</td>
 		</c:forEach>
 	</tr>
 	<tr>
 		<c:if test="${empty selectedDataRV}">
 			<td>해당 식당에 대한 리뷰가 없습니다.</td>
 		</c:if>
 	</tr>
 	<tr>
		<c:forEach var="rvdto" items="${selectedDataRV}">
			<!-- -->
			<td>
				평점:${rvdto.gradepoint}/
				작성일:${rvdto.joindate}<p>
				내용:${rvdto.content}<p>	
				Was this review...?<br>
				
				<input type="button" value="Useful">
				<input type="button" value="Funny">
				<input type="button" value="Cool"><p>
			</td>	
		</c:forEach>
	</tr>
	</table>
	<p><p><p>

	★Useful/Funny/Cool 버튼 눌렀을때 자동으로 숫자 올라가게 해주기 
	★ 페이징 처리 ★
	</form>
</body>
</html> 
<%@ include file="../bottom.jsp" %>



 


 




