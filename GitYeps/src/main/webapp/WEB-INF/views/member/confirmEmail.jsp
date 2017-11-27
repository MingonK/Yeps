<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Email �ߺ�Ȯ��</title>
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
 			alert("�̸����ּҸ� �Է����ּ���")
 			checkForm.email1.focus()
 			return false;
 		}
		var email = checkForm.email1.value+"@"+checkForm.email2.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email)==false){
			//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��			
			alert("�̸��������� �ùٸ��� �ʽ��ϴ�.");
			document.checkForm.email2.focus();
			return false;
		}
		return true;
	}
	
	function setEmail(email1,email2){
		opener.document.join.email1.value=email1;
		opener.document.join.email2.value=email2;
		opener.document.join.idDuplication.value="idCheck";
		self.close();
	}
	
	function resetEmail(){
		opener.document.join.email1.value="";
		opener.document.join.email2.value="";
		self.close();
	}
</script>
</head>
<body>
<c:choose>
		<c:when test="${isMember==1}">
			<b><font color="red">${email}</font>�� �̹� ������� �̸����Դϴ�.</b>
			<form name="checkForm" action="member_confirmEmail" onsubmit="return confirmEmail()">
				<b>�ٸ� �̸����� �Է����ּ���.</b><br /><br />
				<input type="text" name="email1" class="box" maxlength="15" size="20">@
						<input type="text" name="email2" maxlength="20" class="box">
						<select name="email3" onchange="change_email()">
							<option value="0">�����Է�</option>
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
					<input type="submit" name="confirm_email" value="�ߺ�Ȯ��" >
			</form>
		</c:when>
		<c:otherwise>
			<center>
			<b>�Է��Ͻ� <font color="red">${email}</font>��<br />
			����Ͻ� �� �ִ� Email�Դϴ�. </b><br /><br />
			<input type="button" value="�����ϱ�" onclick="setEmail('${email1}','${email2}')">
			<input type="button" value="���" onclick="resetEmail()"></center>
		</c:otherwise>
	</c:choose>	
</body>
</html>