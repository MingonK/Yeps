<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>

<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>

<html>
<head>
<title>Yeps Message</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.js">
	function checkOn(form) {
		if (form.Button.disabled == true)
			form.Button.disabled = false
		else
			form.Button.disabled = true
	}

	function deleteCheck(){
	$("input[name=]:checked").each(function() {
		  var test = $(this).val();
		});
	alert(test)
	}
</script>
</head>
<body>
	<div align="center">
		<hr color="green" width="70%">
		<h2>���� ������(or ���� ������)</h2>
		<hr color="green" width="70%">
		<br> <input type="radio" name="send">���� ������ <input
			type="radio" name="receive">���� ������ <br> <br>
		<form name="form">
			<table border="1" width="80%" align="center" name="table">
				<table border="1" width="80%" height="70%" align="center"
					name="table">
					<tr valign="center">
						<td align="center" rowspan="2">��ü����<br> <input
							type="checkbox"
							onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
							<input type="checkbox" id="ipt"> <label for="ipt"></td>
						<td align="left" colspan="5"><input type="button" name="del"
							value="���û���" onclick="window.location=message_delete"> <input
							type="button" name="button" value="����"
							onclick="window.location='message_reply'"> <input
							type="button" name="button" value="��������"
							onclick="window.location='message_sendForm'"> <input
							type="button" name="button" value="��ü����"
							onclick="window.location='message_allReply'"> <input
							type="button" name="button" value="������"
							onclick="window.location='message_locker'"> <select
							name="filter">
								<option type="button" value="">:: ���� ::</option>
								<option value="allMsg">��� ����</option>
								<option value="noneMsg">������ ����</option>
								<option value="impMsg">�߿� ����</option>
						</select><input type="button" name="button" value="�ҷ�����"
							onclick="message_move'"></td>

						<td align="center" rowspan="2">��ü����<br> <input
							type="checkbox"
							onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
							<input type="checkbox" id="ipt"> <label for="ipt"></label>
						</td>
						<td align="left" colspan="5"><input type="button"
							name="button" value="���û���"
							onclick="window.location=message_delete"> <input
							type="button" name="button" value="����" onclick="reply();">
							<input type="button" name="button" value="��ü����"
							onclick="window.location='message_allReply'"> <input
							type="button" name="button" value="������"
							onclick="window.location='message_locker'"> <select
							name="filter">
								<option value="">:: ���� ::</option>
								<option value="">��� ����</option>
								<option value="">������ ����</option>
								<option value="">�߿� ����</option>
						</select></td>
					</tr>
					<tr>
						<th bgcolor="green" width="10%">��ȣ</th>
						<th bgcolor="green" width="10%">������</th>
						<th bgcolor="green" width="40%">����</th>
						<th bgcolor="green" width="20%">�����ð�</th>
						<th bgcolor="green" width="10%">����</th>
					</tr>
					<c:if test="${empty messageList}">
						<tr>
							<td colspan="5" align="center">�������� ������ϴ�.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${messageList}">
						<tr align="center">
							<td><input type="checkbox" name="ch" value="${dto.msgNum}"
								id="${dto.msgNum}"> <input type="checkbox" id="ipt">
								<label for="ipt"></label></td>
							<td>${dto.msgNum}</td>
							<td><a href="javascript:onfunction">${dto.sender}</a></td>
							<td><a href="message_content?msgNum=${dto.msgNum}">${dto.title }</a></td>
							<td>${dto.reg_date}</td>
							<td><img src="../img/folder.gif"></td>
						</tr>
</c:forEach>
</table>
</form>
<%@ include file="../bottom.jsp"%>
</div>
</body>
</html>
