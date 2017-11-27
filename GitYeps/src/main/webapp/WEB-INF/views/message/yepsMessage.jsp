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
	function checkOn(frm) {
		if (frm.Button.disabled == true)
			frm.Button.disabled = false
		else
			frm.Button.disabled = true
	}
</script>    
</head>
<body>
	<div align="center">
		<hr color="green" width="70%">
			<h2>���� ������(or ���� ������)</h2>
		<hr color="green" width="70%"><br>
		<input type="radio" name="send">���� ������
		<input type="radio" name="receive">���� ������
		<br><br>
		<form name="form">
			<table border="1" width="80%" height="70%" align="center" name="table">
				<tr valign="center">
					<td align="center" rowspan="2">��ü����<br> 
						<input type="checkbox" onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);"> 
						<input type="checkbox" id="ipt"> <label for="ipt"></label>
					</td>
					<td align="left" colspan="5">
						<input type="button" name="button" value="���û���" onclick="window.location=message_delete"> 
						<input type="button" name="button" value="����" onclick="reply();">
						<input type="button" name="button" value="��ü����" onclick="window.location='message_allReply'"> 
						<input type="button" name="button" value="������" onclick="window.location='message_locker'"> 
						<select name="filter">
							<option value="">:: ���� ::</option>
							<option value="">��� ����</option>
							<option value="">������ ����</option>
							<option value="">�߿� ����</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="10%">��ȣ</th>
					<th width="10%">������</th>
					<th width="40%">����</th>
					<th width="20%">�����ð�</th>
					<th width="10%">����</th>
				</tr>
				<tr align="center">
					<td>
						<input type="checkbox" name="ch[]" value="1"> 
						<input type="checkbox" id="ipt"> <label for="ipt"></label>
					</td>
					<td>1</td>
					<td><a href="javascript:onfunction">sender</a></td>
					<td><a href="message_content">subject</a></td>
					<td>reg_time</td>
					<td><img src="../img/folder.gif"></td>
				</tr>
				<tr align="center">
					<td>
						<input type="checkbox" name="ch[]" value="2"> 
						<input type="checkbox" id="ipt"> <label for="ipt"></label></td>
					<td>2</td>
					<td>sender</td>
					<td>subject</td>
					<td>reg_time</td>
					<td>file</td>
				</tr>
				<tr align="center">
					<td><input type="checkbox" name="ch[]" value="3"> <input
						type="checkbox" id="ipt"> <label for="ipt"></label>
					</td>
					<td>3</td>
					<td>sender</td>
					<td>subject</td>
					<td>reg_time</td>
					<td>file</td>
				</tr>
				<tr align="center">
					<td>
						<input type="checkbox" name="ch[]" value="4"> 
						<input type="checkbox" id="ipt"> <label for="ipt"></label>
					</td>
					<td>4</td>
					<td>sender</td>
					<td>subject</td>
					<td>reg_time</td>
					<td>file</td>
				</tr>
				<tr align="center">
					<td>
						<input type="checkbox" name="ch[]" value="5"> 
						<input type="checkbox" id="ipt"> <label for="ipt"></label>
					</td>
					<td>5</td>
					<td>sender</td>
					<td>subject</td>
					<td>reg_time</td>
					<td>file</td>
				</tr>
			</table>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>
