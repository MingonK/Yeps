<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
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
   	 </script>
</head>
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
</html>