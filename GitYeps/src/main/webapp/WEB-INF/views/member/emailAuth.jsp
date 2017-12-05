<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function numCheck(authNum,email1,email2){
 
		if(!authenform.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(authenform.authnum.value!=authNum){
			alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요");
			authenform.authnum.value="";
			return false;
		}
		if(authenform.authnum.value==authNum){
			alert("인증완료");
			setEmail(email1,email2);
		}
	}
	
	function setEmail(email1,email2){
		opener.opener.document.join.email1.value=email1;
		opener.opener.document.join.email2.value=email2;
		opener.opener.document.join.idDuplication.value="idCheck";
		opener.opener.document.join.mailCheck.value="이메일 인증완료";
		opener.close();
	}
	
</script>

<center>
<br /><br />
<h5>인증번호 7자리를 입력하세요</h5>
<div class="container">
	<form method="post" name="authenform">
		<input type="text" name="authnum" onkeypress="if(event.keyCode==13){return false;}"><br /><br />
		<input type="button" value="인증번호 확인" onclick="numCheck('${authNum}','${email1}','${email2}');">
	</form>
</div>
</center>