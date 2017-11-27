<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <html>
    <head>
   	 <link rel="stylesheet" type="text/css" href="style.css"> 
   	 <script type="text/javascript">
   		
	function checkPw(){
		if(join.passwd.value == join.passwd2.value){
			join.result.value="��ġ�մϴ�"
		}else{
			join.result.value="��ġ�����ʽ��ϴ�"
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
 			alert("�̸����ּҸ� �Է����ּ���")
 			join.email1.focus()
 			return
 		}
		var email = join.email1.value+"@"+join.email2.value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(exptext.test(email)==false){
			//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��			
			alert("�̸��������� �ùٸ��� �ʽ��ϴ�.");
			document.join.email2.focus();
			return
		}
		url = "member_confirmEmail?email=" + email;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=180");
		
	}
   	 
	function inputEmailChk(){
		join.idDuplication.value="idUncheck"
	}
	
   	 function check(){
   			
   			if(join.name.value==""){
	 			alert("�̸��� �Է����ּ���")
	 			join.name.focus()
	 			return
	 		}
   			if(join.email1.value=="" || join.email2.value==""){
	 			alert("�̸����ּҸ� �Է����ּ���")
	 			join.email1.focus()
	 			return
	 		}
   			var email = join.email1.value+"@"+join.email2.value;
   			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
   			if(exptext.test(email)==false){
   				//�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��			
   				alert("�̸��������� �ùٸ��� �ʽ��ϴ�.");
   				document.join.email2.focus();
   				return
   			}
   			if(join.idDuplication.value!="idCheck"){
	 			alert("�̸��� �ߺ�üũ�� ���ּ���")
	 			join.email1.focus()
	 			return
	 		}
   	 		if(join.passwd.value==""){
   	 			alert("��й�ȣ�� �Է����ּ���")
   	 			join.passwd.focus()
   	 			return
   	 		}
   	 		if(join.passwd.value != join.passwd2.value)
   	 	  	 {
   	 	     	alert("�Է��Ͻ� ��й�ȣ�� ��й�ȣȮ���� ��ġ���� �ʽ��ϴ�")
   	 	    	return
   	 	   	}
   	 		if(join.passwd.value.length<6) {
  		    	alert("��й�ȣ�� ����,����,Ư������(!@$%^&* �� ���)�� ����Ͽ� 6~16�ڱ��� �Է����ּ���")
  		    	return
  		   	}
  			if(!join.passwd.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
  		    	alert("��й�ȣ�� ����,����,Ư������(!@$%^&* �� ���)�� ����Ͽ� 6~16�ڱ��� �Է����ּ���")
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
					<td colspan="2" align=center class="m2">ȸ������</td>
 				</tr>
				<tr>
					<td width="150" class="m3">*�̸�(�г���)</td>
					<td class="m3">
						<input type="text" name="name" class="box" maxlength="20">
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">*�̸���(���̵�)</td>
					<td class="m3">
						<input type="text" name="email1" class="box" maxlength="20" size="20" onkeydown="inputEmailChk()">@
						<input type="text" name="email2" maxlength="20" class="box" onkeydown="inputEmailChk()">
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
						</select>
						<input type="button" name="confirm_email" value="�ߺ�Ȯ��" onclick="openConfirmEmail(this.form)">
						<input type="hidden" name="idDuplication" value="idUncheck">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">*��й�ȣ</td>
					<td class="m3">
						<input type="password" name="passwd" class="box" maxlength="20" onkeyup="checkPw()">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">*��й�ȣ Ȯ��</td>
					<td class="m3">
						<input type="password" name="passwd2" class="box" maxlength="20" onkeyup="checkPw()">
						<input type="text" name="result" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">*�������</td>
					<td class="m3">
						<select name="year">
							<c:forEach var="i" begin="1930" end="2017" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>��
						<select name="month">
							<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>��
						<select name="day">
							<c:forEach var="i" begin="1" end="31" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>��
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[����]</a>
						<a href="#">[���]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>
	</html>