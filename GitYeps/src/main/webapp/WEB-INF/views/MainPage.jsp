<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Yeps!</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
</head>
<body>
	<div id="wrap">
		<img src="<c:url value="/resources/images/MyPhoto_1151871583_0302.jpg"/>" style="opacity:0.7">
		<div id="rink1">
			<div id="Write">
				<a href="#" id="onbglink">Write a Review</a>
			</div>
			<div id="Events">
				<a href="#" id="onbglink">Events</a>
			</div>
		</div>
		<div id="rink2">
			<div>
				<div id="signup">
					<a href="#" id="onbglink">Sign Up</a>
				</div>
			</div>
<!-- 			<div id="signup" style="border:1px solid white;">
				<span style="border-radius:10px white;"><a href="#" id="onbglink">Sign Up</a></span>
			</div> -->
			<div id="login">
				<a href="#" id="onbglink">Log in</a>
			</div>
		</div>
	</div>
	
</body>
</html>