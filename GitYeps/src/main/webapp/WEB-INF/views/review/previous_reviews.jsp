<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
	<title>타이틀 설정해야함</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>
				<c:if test="${empty mdto_y}">
					회원목록 출력안되는중
				</c:if>
  		    
				<c:forEach var="mdto" items="${mdto_y}">
					이름:${mdto.name}<br>
					리뷰수:${mdto.reviewcount}	
					이름:${mdto.name}<p>
				</c:forEach>
			
				<c:if test="${empty rdto_y}">
    				식당목록 출력안되는중
  		   	    </c:if>
  		    
  		    	<c:forEach var="rdto" items="${rdto_y}">
    				wrote for
    				식당명:${rdto.rname}<br>
  		   	    </c:forEach>
			
				<c:if test="${empty rvdto_y}">
   					리뷰목록 출력안되는중
				</c:if>	
				
				<c:forEach var="rvdto" items="${rvdto_y}">
    				평점:${rvdto.gradepoint}<br>
    				글쓴날:${rvdto.joindate}<br>
   			 		내용:${rvdto.content}<br>
   			 		Was this review...?<br>
   			 		button button button <p>
   				</c:forEach>
			</td>
		</tr>
		
		
	</table>
</body>
</html>






				

    
    
    
    
    
	
	
	