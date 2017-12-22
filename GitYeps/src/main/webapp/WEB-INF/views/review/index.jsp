<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>

<html>
<head>
<title>main 화면</title>

  <style> 
  		
  	   #a{
  	   	 width: 1200px;
  	   	 height: 300px;
  	     
  	   }
  	   
  	   #b{
  	   	 float: left;
  	   	 width: 750px;
  	   	 height: 270px;
  	   	 margin: auto;
  	  	 border: 1px solid black;
  	  	 text-align:left;
  	   }
  	   
  	   #c{
  	     float: right;
  	     width: 350px;
  	     height: 270px;
  	     margin: auto;
  	   	 border: 1px solid black;
  	   	 text-align:left;
  	   }
  	   
  	   body{
  	   		text-align: center;
  	   }

  </style> 


	
</head>
<body>

	<a href="gradepoint">★★★임시용(별점)★★★</a>
	<a href="start">★★임시용(페이징처리)★★</a>

	<h3><a href="restaurant_restaurantIMG">Write a Review</a> | Events | Talk</h3><br>
	<h1>Yeps Main View</h1>
	
	카테고리|이벤트|이벤트리뷰|파일|<a href="master_index">마스터</a>|회원|메뉴|메세지|QnA|식당|리뷰<p>
	
	<h2>Yelp San Francisco</h2><p>
	New YorkNew York | San JoseSan Jose |Los AngelesLos Angeles |ChicagoChicago |Palo AltoPalo Alto |OaklandOakland |More CitiesMore Cities 

	<hr>
	<h3>Hot & New Businesses</h3>
	
	식당사진1 | 식당사진2 | 식당사진3 <p>
	
	<hr>
	<h2>Browse Businesses by Category</h2>
	<table>
	<tr>
		<th><img src="resources/img/restaurants.png">Restaurants<img src="resources/img/shopping.png">Shopping<img src="resources/img/nightlife.png">Nightlife<img src="resources/img/active_life.png">Active Life</th>
	</tr>
	<tr>
		<th><img src="resources/img/beauty.png">Beauty & Spas<img src="resources/img/automotive.png">Automotive<img src="resources/img/home_services.png">Home Services<img src="resources/img/more_categories.png">More Categories</th>
	</tr>
	</table>
	<hr>
	
		 <div id="a">
		 	<div id="b">
 		 		<h3>Review of the Day</h3><p>
 		 		<a href="review_mylist?NBPmnum=${NBPmnum}">사진</a>|<a href="review_mylist?NBPmnum=${NBPmnum}">작성자</a>|리뷰달은갯수만큼의별점(리뷰1개당 별점1개표기)<br>
 		 		<a href="">리뷰작성한 식당이름명</a><br>
 		 		Review of the Day<br>
 		 		작성한식당명에대한 나의 별점 + 날짜<br>
 		 		내용작성란..<a href="">Continue reading</a><p><p><p>
 		 		<a href="">Read previous reviews</a>
 		 	</div>
   			<div id="c">
   		 		<h3>Recent Lists</h3><br>
				<a href="">사진</a>|<a href="">제목 </a>|내용|By <a href="review_recentlist">작성자</a><br>
				내용 <br>	
				By <a href="">작성자</a><p><p><p><p>
				<a href="">Browse more lists</a>
			</div>
 		</div>
 		
	<hr><p>
	 
	<h3>Recent Activity</h3>
	
	<table border="1" style=width:1000px>
	
		<tr>
		
			<c:if test="${empty get_mnameList}">
				<td>최신 회원목록이 없습니다.</td>
			</c:if>
		</tr>
		
		<tr>
			<c:forEach var="mdto" items="${get_mnameList}">
				<td>회원명:${mdto.name}</td>
				<td>Wrote a review</td>
		 		<td>사진부분(★미구현)</td>
			</c:forEach>
		</tr>
		<tr>
			<c:if test="${empty get_rnameList}">
				<td>최신 식당목록이 없습니다.</td>
			</c:if>
		</tr>
	
		<tr>
			<c:forEach var="rdto" items="${get_rnameList}">
				<td>식당명:${rdto.rname}</td>
			</c:forEach>
		</tr>
	
		<tr>
			<c:if test="${empty recentReviewInfo}">
				<td>최신 리뷰목록이 없습니다.</td>
			</c:if>
		</tr>
		
		<tr>
			<c:forEach var="rvdto" items="${recentReviewInfo}">
				<td>평점:${rvdto.gradepoint}</td>
				<td>내용:${rvdto.content}</td>
				<td>Continue reading</td>
				<td>
					<input type="button" value="버튼1">
					<input type="button" value="버튼2">
					<input type="button" value="버튼3">
				</td>
			</c:forEach>
		</tr>

	</table>
	
	<p>

	<a href="#">v Show more activity in San Francisco</a>

	
	

 
</body>
</html>

<%@ include file="../bottom.jsp" %>





