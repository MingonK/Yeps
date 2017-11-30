<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>findID</title>
<script type="text/javascript">

	function focusSsn2(){
		 if(findemailf.ssn1.value.length==6){
			 findemailf.ssn2.focus();
		 }
		 findemailf.ssn1.value=findemailf.ssn1.value.replace(/[^0-9]/g,'')
	 }
	 
	function numberOnly(){
		if(event.keyCode < 47 || event.keyCode > 58 || event.keyCode>=96 && event.keyCode<=105){
			return false; 
		}
	}

   	 function findEmailCheck(){
   			
   			if(findemailf.name.value==""){
	 			alert("이름을 입력해주세요.");
	 			findemailf.name.focus();
	 			return false;
	 		}
   			if (findemailf.ssn1.value.length != 6 || findemailf.ssn2.value.length != 7 || findemailf.ssn1.value.substring(0,2) < 20 || findemailf.ssn1.value.substring(2,4) < 1 || findemailf.ssn1.value.substring(2,4) > 12 || findemailf.ssn1.value.substring(4,6) < 0 || findemailf.ssn1.value.substring(4,6) > 31 || findemailf.ssn2.value.substring(0,1) > 2 || findemailf.ssn2.value.substring(0,1) < 1) {
        		  alert("주민등록번호를 정확히 입력해주세요.");
        		  findemailf.ssn1.value = findemailf.ssn2.value="";
        		  findemailf.ssn1.focus();
        		  return false;
        	}
   	 		window.open("", "findEmail", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=180");
   	 		frm = document.findemailf;
   	 		frm.action = "member_findEmail";
   	 		frm.target = "findEmail";
   	 		frm.submit;
   	 	}
   	 </script>
</head>
<body>
	<form name="findemailf" method="POST" onsubmit="return findEmailCheck()">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">아이디 찾기</td>
 				</tr>
				<tr>
					<td width="150" class="m3">이름</td>
					<td class="m3">
						<input type="text" name="name" class="box" maxlength="20">
					</td>
				</tr>
				<tr>
					<td width = "150">주민등록번호</td>
      				<td class="m3">
						<input onkeypress="return numberOnly();" onkeyup="focusSsn2()" style="IME-MODE: disabled" maxlength="6" size="6" name="ssn1" /> - 
						<input onkeypress="return numberOnly();" style="IME-MODE: disabled" type="password" maxlength="7"size ="7" value="" name="ssn2" />
      				</td>
				</tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="아이디 찾기">
						<input type="button" value="취소" onclick="location.href='member_login'">
					</td>
  				</tr>
  			</table>
  			<br>
			<a href="member_index">메인페이지로 이동</a>
	</form>
</body>
</html>