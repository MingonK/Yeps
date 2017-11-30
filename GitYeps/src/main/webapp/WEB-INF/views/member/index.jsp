<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>YEPS회원관리</title>
	<script type="text/javascript">
   	 function loginCheck(){
   		var frm = document.getElementById('loginf')
   			if(frm.email.value==""){
	 			alert("아이디를 입력해주세요");
	 			frm.email.focus();
	 			return false;
	 		}
   	 		if(frm.passwd.value==""){
   	 			alert("비밀번호를 입력해주세요");
   	 			frm.passwd.focus();
   	 			return false;
   	 		}
   	 		frm.submit();
   	 	}
   	 </script>
</head>
<body>
<c:choose>
		<c:when test="${sessionScope.memberName != null && sessionScope.memberMnum != 0 
							&& sessionScope.memberEmail != null}">
			${sessionScope.memberEmail}님 환영합니다
			<input type="button" value="로그아웃" onclick="window.location='member_logout'">
		</c:when>
		<c:otherwise>
			<form name="loginf" action="member_login" method="POST" onsubmit="return loginCheck()">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="4" align=center class="m2">로그인</td>
 				</tr>
				<tr>
					<td class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="email" class="box" maxlength="50">
					</td>
					<td class="m3">비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box" maxlength="20">
					</td>
  				</tr>
  				<tr>
					<td colspan="4" align="center">
						<input type="submit" name="member_login" value="로그인">
						<input type="button" name="member_join" value="회원가입" onclick="window.location='member_join'">
					</td>
  				</tr>
  			</table>
		</form>
		</c:otherwise>
	</c:choose>

	<div align="center">
		<hr color="green" width="300">
		<h2>YEPS 회원관리 프로그램</h2>
		<hr color="green" width="300">
		<table border="1" width="600" height="400">
			<tr height="50">
				<th><a href="member_join">회원가입</a></th>
				<th><a href="member_manager">회원관리</a></th>
				<th><a href="member_login">로그인</a></th>
			</tr>
			<tr>
				<td colspan="4">아무 사진이나 넣어주세요!!</td>
			</tr>
			<tr height="50">
				<td colspan="4" align="center">
					YEPS Member
				</td>
			</tr>
		</table>
	</div>
</body>
</html>