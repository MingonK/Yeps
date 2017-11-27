<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Yeps!</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
</head>
<body>
<div id="container">
	<div id="header">
		<img src="<c:url value="/resources/images/MyPhoto_1151871583_0302.jpg"/>" style="opacity:0.7">
 		<div id="header_top">
 			<div id="header_write_review" onclick="location.href='#'" style="cursor: pointer;">
				Write a Review
			</div>
			<div id="header_events" onclick="location.href='#'" style="cursor: pointer;">
				Events
			</div>
			<div id="header_signup" onclick="location.href='#'" style="cursor: pointer;">
				Sign Up
			</div>
			<div id="header_login" onclick="location.href='#'" style="cursor: pointer;">
				Log In
			</div>
		</div>
		<div id="header_center">
			<div id="header_center_top">
				<a href="#"><img src="<c:url value="/resources/images/Yelp_Logo.png"/>"></a>
			</div>
			<form name="f" action="post">
				<div id="header_ceter_footer">
					<div id="search_cate">
						<input type="text" name="category">
					</div>
					<div id="search_location">
						<input type="text" name="location">
					</div>
					<div id="search_name">
						<input type="text" name="name">
					</div>
					<div id="search_button">
						<input type="submit" value="돋보기">
					</div>
				</div>
			</form>
		</div>
		<div id="header_bottom">
			<h3>사진찍은 장소 Photo by 사진찍은 사람</h3>
		</div>
	</div>
	<div id="content">
		<h2>Content</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
	</div>
	<div id="bottom">
		<ul>
			<li>About</li>
			<li>About Yeps</li>
			<li>Careers</li>
			<li>Investor Relations</li>
			<li>Content Guidelines</li>
			<li>Terms of Service</li>
			<li>Privacy Policy</li>
			<li>Ad Choices</li>
		</ul>
	</div>
</div>	
</body>
</html>
