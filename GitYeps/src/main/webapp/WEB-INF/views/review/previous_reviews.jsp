<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
	<title>타이틀 설정해야함</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=4"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=4"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<%@ include file="../top.jsp" %>
	<div class="previous_review_Frame_div">
		<div class="previous_review_InnerFrame_div">
			<!--실질적인 전체묶음 -->
			<div class="previous_review_Important_div">
			   <!--제목 -->
			   <div class="previous_review_title_div">Review Of The Day Archive for 위치</div>
			   		<hr>
			   <!--실질적인 정보 전체 묶음 -->
			   <div class="previous_review_InnerImportant_div">
			   			<div class="previous_review_Picture_div">사진</div>
						
							<c:if test="${empty mdto_y}">
								회원목록 출력안되는중
							</c:if>
  		    			
							<c:forEach var="mdto" items="${mdto_y}">
						<div class="previous_review_Name_div">이름:${mdto.name}<br></div>
						<div class="previous_review_Location_div">위치:</div>
						<div class="previous_review_ReviewCount_div">리뷰수:${mdto.reviewcount}</div>			
						<div class="previous_review_Name_div">이름:${mdto.name}</div>
						<div class="previous_review_phrase_div">wrote for</div>
							</c:forEach>
						
							<c:if test="${empty rdto_y}">
    							식당목록 출력안되는중
  		   	  	  			</c:if>
  		    
  		    				<c:forEach var="rdto" items="${rdto_y}">
    					<div class="previous_review_Rname_div">식당명:${rdto.rname}</div>
    					
  		   	   				</c:forEach>
						
							<c:if test="${empty rvdto_y}">
   								리뷰목록 출력안되는중
							</c:if>	
				
							<c:forEach var="rvdto" items="${rvdto_y}">
    					<div class="previous_review_Gradepoint_div">평점:${rvdto.gradepoint}</div>
    					<div class="previous_review_Joindate_div">글쓴날:${rvdto.joindate}</div>
   			 			<div class="previous_review_Content_div">내용:${rvdto.content}</div>
   			 			<div class="previous_review_phrase_div">Was this review...?</div>
   			 			<div class="previous_review_Useful_Funny_Cool_div">button button button </div>
   							</c:forEach>
   					
   				</div>
   			</div>	
		</div>
	</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>






				

    
    
    
    
    
	
	
	