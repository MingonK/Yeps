<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>mvc게시판</title>
</head>
<body>
<%-- <img width="100" height="100" src="getImage/${dto.file_name }"> --%>
<c:forEach var="dto" items="${restList}">
<div id="super-container">
	<div id="container">
		<img width="100" height="100" src="getImage/${dto.file_name }">
	</div>
</div>
</c:forEach>
</body>
</html>
<%@ include file="../bottom.jsp" %>



