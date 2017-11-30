<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <html>
    <head>
   	 <link rel="stylesheet" type="text/css" href="style.css"> 
   	 <script type="text/javascript">
   	
   	 function focusSsn2(){
   		 if(join.ssn1.value.length==6){
   			 join.ssn2.focus();
   		 }
   		join.ssn1.value=join.ssn1.value.replace(/[^0-9]/g,'')

   	 }
   	 
 	function numberOnly(){
		if(event.keyCode < 47 || event.keyCode > 58 || event.keyCode>=96 && event.keyCode<=105){
 			return false; 
		}
 	}
 	
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
		inputEmailChk();
	}
	
	function openConfirmEmail(){
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
		join.mailCheck.value="";
	}
	
   	 function check(){
   			if(join.name.value==""){
	 			alert("이름을 입력해주세요")
	 			join.name.focus()
	 			return
	 		}
   			
      		 var ck=0;
      		 // 처음 7자 검사
      		 if (join.ssn1.value.length != 6 || join.ssn2.value.length != 7 || join.ssn1.value.substring(0,2) < 20 || join.ssn1.value.substring(2,4) < 1 || join.ssn1.value.substring(2,4) > 12 || join.ssn1.value.substring(4,6) < 0 || join.ssn1.value.substring(4,6) > 31 || join.ssn2.value.substring(0,1) > 2 || join.ssn2.value.substring(0,1) < 1) {
       		  alert("주민등록번호를 정확히 입력해주세요.");
      		  join.ssn1.value = join.ssn2.value="";
      		  join.ssn1.focus();
      		  return;
      		 }
      		 //끝자리 검증번호 유효성 검사
      		 var total = join.ssn1.value + join.ssn2.value;
      		 for (i=0; i < 12; i++) {
      		  ck  += (i%8+2)*total.substring(i, i+1);
      		 }
      		 ck = (11-(ck%11))%10;
      		 if (parseInt(ck) != parseInt(total.substring(12, 13))) {
      		  alert("잘못된 주민등록번호입니다. 다시 확인해주세요.");
      		  join.ssn1.value = join.ssn2.value="";
      		  join.ssn1.focus();
      		  return;
      		 }
      		
   			 
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
   			if(join.idDuplication.value!="idCheck"){
	 			alert("이메일 중복체크를 해주세요")
	 			join.email1.focus()
	 			return
	 		}
   			
   	 		if(join.passwd.value==""){
   	 			alert("비밀번호를 입력해주세요")
   	 			join.passwd.focus()
   	 			return
   	 		}
   	 		if(join.passwd.value != join.passwd2.value)
   	 	  	 {
   	 	     	alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다")
   	 	    	return
   	 	   	}
   	 		if(join.passwd.value.length<6) {
  		    	alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지 입력해주세요")
  		    	return
  		   	}
  			if(!join.passwd.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
  		    	alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6~16자까지 입력해주세요")
  		    	return
  		   	}
   	 		document.join.submit()
   	 	}
   	 </script>
    </head>

	<body onload="join.name.focus()">
		<form name="join" method="POST" action="member_join">
			<table width="800" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">회원가입</td>
 				</tr>
				<tr>
					<td width="150" class="m3">*이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" maxlength="20">
					</td>
				</tr>
				<tr>
					<td width = "150">*주민등록번호</td>
      				<td class="m3">
						<input onkeypress="return numberOnly();" onkeyup="focusSsn2()" style="IME-MODE: disabled" maxlength="6" size="6" name="ssn1" /> - 
						<input onkeypress="return numberOnly();" style="IME-MODE: disabled" type="password" maxlength="7"size ="7" value="" name="ssn2" />
      				</td>
				</tr>
				<tr>
					<td width="150" class="m3">*이메일(아이디)</td>
					<td class="m3">
						<input type="text" name="email1" class="box" maxlength="20" size="20" onkeydown="inputEmailChk()">@
						<input type="text" name="email2" maxlength="25" class="box" onkeydown="inputEmailChk()">
						<select name="email3" onchange="change_email()" onchange="change_email()">
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
						</select>
						<input type="button" name="confirm_email" value="중복확인" onclick="openConfirmEmail()">
						<input type="text" name="mailCheck" value="" readOnly style="background-color:transparent;border:0 solid black;text-align:right;">
						<input type="hidden" name="idDuplication" value="idUncheck">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">*비밀번호</td>
					<td class="m3">
						<input type="password" name="passwd" class="box" maxlength="20" onkeyup="checkPw()">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">*비밀번호 확인</td>
					<td class="m3">
						<input type="password" name="passwd2" class="box" maxlength="20" onkeyup="checkPw()">
						<input type="text" name="result" readOnly style="background-color:transparent;border:0 solid black;text-align:right;">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="button" value="전송" onclick="check()">
						<input type="button" value="취소" onclick="location.href='member_index'">
					</td>
  				</tr>
  			</table>
		</form>
	</body>
	</html>