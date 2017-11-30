<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findPassword</title>
<script type="text/javascript">
	function focusSsn2(){
		 if(findpasswdf.ssn1.value.length==6){
			 findpasswdf.ssn2.focus();
		 }
		 findpasswdf.ssn1.value=findpasswdf.ssn1.value.replace(/[^0-9]/g,'')
	 }
	 
	function numberOnly(){
		if(event.keyCode < 47 || event.keyCode > 58 || event.keyCode>=96 && event.keyCode<=105){
			return false; 
		}
	}

   	 function findPasswdCheck(){
   			if(findpasswdf.name.value==""){
	 			alert("이름을 입력해주세요.");
	 			findpasswdf.name.focus();
	 			return false;
	 		}
   			if (findpasswdf.ssn1.value.length != 6 || findpasswdf.ssn2.value.length != 7 || findpasswdf.ssn1.value.substring(0,2) < 20 || findpasswdf.ssn1.value.substring(2,4) < 1 || findpasswdf.ssn1.value.substring(2,4) > 12 || findpasswdf.ssn1.value.substring(4,6) < 0 || findpasswdf.ssn1.value.substring(4,6) > 31 || findpasswdf.ssn2.value.substring(0,1) > 2 || findpasswdf.ssn2.value.substring(0,1) < 1) {
        		  alert("주민등록번호를 정확히 입력해주세요.");
        		  findpasswdf.ssn1.value = findpasswdf.ssn2.value="";
        		  findpasswdf.ssn1.focus();
        		  return false;
        	}
   			if(findpasswdf.email.value==""){
	 			alert("아이디를 입력해주세요.");
	 			findpasswdf.email.focus();
	 			return false;
	 		}
   	 		window.open("", "findPasswd", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=180");
   	 		frm = document.findpasswdf;
   	 		frm.action = "member_findPasswd";
   	 		frm.target = "findPasswd";
   	 		frm.submit;
   	 	}
</script>
</head>
<body>
	<form name="findpasswdf" method="POST" onsubmit="return findPasswdCheck()">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">비밀번호 찾기</td>
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
					<td width="150" class="m3">아이디</td>
					<td class="m3">
						<input type="text" name="email" class="box" maxlength="50">
					</td>
				</tr>
				
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="비밀번호 찾기">
						<input type="button" value="취소" onclick="location.href='member_login'">
					</td>
  				</tr>
  			</table>
  			<br>
			<a href="member_index">메인페이지로 이동</a>
	</form>
</body>
</html>