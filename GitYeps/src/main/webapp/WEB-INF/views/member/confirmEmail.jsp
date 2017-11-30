<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Email 중복확인</title>
<script type="text/javascript">
	function change_email(){
		if(checkForm.email3.options[checkForm.email3.selectedIndex].value == '0'){
			checkForm.email2.readOnly = false;
			checkForm.email2.value = "";
			checkForm.email2.focus();
		} else{
			checkForm.email2.readOnly = true;
			checkForm.email2.value = document.checkForm.email3.options[checkForm.email3.selectedIndex].value;
		}
	}
	function confirmEmail(){
		if(checkForm.email1.value=="" || checkForm.email2.value==""){
 			alert("이메일주소를 입력해주세요")
 			checkForm.email1.focus()
 			return false;
 		}
		var email = checkForm.email1.value+"@"+checkForm.email2.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일형식이 올바르지 않습니다.");
			document.checkForm.email2.focus();
			return false;
		}
		return true;
	}
	
	function resetEmail(){
		opener.inputEmailChk()
		opener.document.join.email1.value="";
		opener.document.join.email2.value="";
		self.close();
	}
	
	function openEmailAuthCheck(){
		window.open("", "emailAuth", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=300");
	 	frm = document.emailauthf;
	 	frm.action = "member_emailAuth";
	 	frm.target = "emailAuth";
	 	frm.method = "POST";
	 	frm.submit;
	}
	
</script>
</head>
<body>
<c:choose>
		<c:when test="${isMember==1}">
			<b><font color="red">${email}</font>는 이미 사용중인 이메일입니다.</b>
			<form name="checkForm" action="member_confirmEmail" onsubmit="confirmEmail()">
				<b>다른 이메일을 입력해주세요.</b><br /><br />
				<input type="text" name="email1" class="box" maxlength="15" size="20" onkeypress="if(event.keyCode==13){return false;}">@
						<input type="text" name="email2" maxlength="20" class="box" onkeypress="if(event.keyCode==13){return false;}">
						<select name="email3" onchange="change_email()">
							<option value="0">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="korea.com">korea.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="chol.com">chol.com</option>
							<option value="netian.com">netian.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="live.com">live.com</option>
						</select> </b><br /><br />
					<input type="submit" name="confirm_email" value="중복확인" >
			</form>
		</c:when>
		<c:otherwise>
			<center>
			<form name="emailauthf" method="POST" onsubmit="return openEmailAuthCheck()">
			<b>입력하신 <font color="red">${email}</font>는<br />
			사용하실 수 있는 Email입니다. </b><br /><br />
			<input type="hidden" name="email" value="${email}">
			<input type="submit" value="인증메일 받기">
			<input type="button" value="취소" onclick="resetEmail()">
			</form>
			</center>
		</c:otherwise>
	</c:choose>	
</body>
</html>