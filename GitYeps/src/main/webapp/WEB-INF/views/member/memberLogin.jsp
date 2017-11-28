<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<script type="text/javascript">
   		
	function checkPw(){
		if(join.passwd.value == join.passwd2.value){
			join.result.value="일치합니다"
		}else{
			join.result.value="일치하지않습니다"
		}
	}
	
	function change_email(){
	if(join.email3.options[join.email3.selectedIndex].value == '0'){
		join.email2.readOnly = false;
		join.email2.value = "";
		join.email2.focus();
	} else{
		join.email2.readOnly = true;
		join.email2.value = document.join.email3.options[join.email3.selectedIndex].value;
		}
	}
	
	function openConfirmEmail(inputEmail){
		if(join.email1.value=="" || join.email2.value==""){
 			alert("이메일주소를 입력해주세요")
 			join.email1.focus()
 			return
 		}
		var email = join.email1.value+"@"+join.email2.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일형식이 올바르지 않습니다.");
			document.join.email2.focus();
			return
		}
		url = "member_confirmEmail?email=" + email;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=180");
		
	}
   	 
	function inputEmailChk(){
		join.idDuplication.value="idUncheck"
	}
	
   	 function loginCheck(){
   			
   			if(join.email.value==""){
	 			alert("이메일을 입력해주세요")
	 			loginf.email.focus()
	 			return
	 		}
   	 		if(join.passwd.value==""){
   	 			alert("비밀번호를 입력해주세요")
   	 			loginf.passwd.focus()
   	 			return
   	 		}
   	 		document.join.submit()
   	 	}
   	 </script>
</head>
<body>
	<form name="loginf" method="POST" action="member_login">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">로그인</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이메일</td>
					<td class="m3">
						<input type="text" name="email" class="box" maxlength="40">
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
						<input type="submit" name="member_login" value="로그인" onsubmit="loginCheck()" >
						<input type="button" name="member_join" value="회원가입" onclick="window.location='member_join'">
					</td>
  				</tr>
  				<tr>
  					<td align="center">
  						<a href="board_findEmail">
						이메일 찾기
						</a>
  					</td>
  					<td align="center">
  						<a href="board_findpassWd">
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