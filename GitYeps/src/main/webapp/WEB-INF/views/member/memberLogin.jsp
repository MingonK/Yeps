<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="../style.jsp"%>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
   <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
   <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
   <script src="<c:url value="/resources/js/custom-file-input.js"/>"></script>
   <script src="<c:url value="/resources/js/jquery.custom-file-input.js"/>"></script>
   <script src="<c:url value="/resources/js/jquery-v1.min.js"/>"></script>
   <script src="//code.jquery.com/jquery.min.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
   	 function loginCheck(){
   			
   			if(loginf.email.value==""){
	 			alert("아이디를 입력해주세요");
	 			loginf.email.focus();
	 			return false;
	 		}
   	 		if(loginf.passwd.value==""){
   	 			alert("비밀번호를 입력해주세요");
   	 			loginf.passwd.focus();
   	 			return false;
   	 		}
   	 		document.loginf.submit();
   	 }
   	 
   	 $(document).ready(function() {
         $('.signUp').hover(function() {
            $(this).css('cursor', 'pointer');
            $(this).css('text-decoration', 'underline');
         })
         $('.').mouseleave(function() {
            $(this).css('text-decoration', 'none');
         })
         $('.signUp').click(function() {
            $('.login_header').toggle();
            $('.loginf').toggle();
         })
   	 </script>
</head>
<body>

<div id="super-container">
	<div id="Membercontainer">
		<div id="lbody">
		<div id="login-wrapper">
		<div id="login" align="center">
			<div id="login_header">
				<h2>Log In to YEPS</h2>
					<p class="subheading">New to YEPS? <a class="signup-link u-pseudo-link" href="/signup">Sign up</a>
					<p class="legal-copy">
					By logging in, you agree to Yelp’s <a class="legal-link" href="https://www.yelp.com/static?p=tos">Terms of Service</a> and <a class="legal-link" href="/tos/privacy_en_us_20160131">Privacy Policy</a>.
					</p>
			</div>
		
			<div id="login_body">
			<form name="loginf" class="loginf" action="member_login" method="POST" onsubmit="return loginCheck()">
                <input id="email" name="email" placeholder="Email" required="required" type="email" value="">
                <input id="passwd" name="passwd" placeholder="Password" required="required" type="password" value="">
                    <div class="forgot-email">
                        <small><a class="forgot-link">Forgot e-mail?</a></small>
                    </div>
                    <div class="forgot-password">
                        <small><a class="forgot-link">Forgot password?</a></small>
                    </div>
                <div class="captcha login-captcha"></div>
                <button type="submit" value="submit" class="ybtn ybtn-primary ybtn-big submit ybtn-full"><span>Log In</span></button>
                <div class="sub-text-box">
                <small class="subtle-text">New to Yelp? <a class="signup-link u-pseudo-link" href="/signup">Sign up</a></small>
            	</div>
    		</form>
    		</div>
		</div>
		</div>
		
		
		<div id="login_img">
			<img src="https://s3-media4.fl.yelpcdn.com/assets/2/www/img/1e82406ff345/signup/signup_illustration.png">
		</div>
		</div>
	</div>
</div>

<%@ include file="../bottom.jsp"%>




               

<!-- 
<body>
	<form name="loginf" action="member_login" method="POST" onsubmit="return loginCheck()">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">로그인</td>
 				</tr>
				<tr>
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="email" class="box" maxlength="50">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box" maxlength="20">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="member_login" value="로그인">
						<input type="button" name="member_join" value="회원가입" onclick="window.location='member_join'">
					</td>
  				</tr>
  				<tr>
  					<td align="center">
  						<a href="member_findEmail">
						아이디 찾기
						</a>
  					</td>
  					<td align="center">
  						<a href="member_findPasswd">
						비밀번호 찾기
						</a>
  					</td>
  				</tr>
  			</table>
  			<br>
			<a href="member_index">메인페이지로 이동</a>
		</form>
</body>
 -->