<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>

<title>Message View</title>
</head>
<body>
	<div align="center">
		<br>
		<table border="1" width="70%" align="center">
			<tr>
				<th bgcolor="green" width="20%">������</th>
				<td>${getContent.sender}</td>
				<th bgcolor="green" width="20%">�����ð�</th>
				<td>${getContent.reg_date}</td>
			<tr align="center">
				<th bgcolor="green" colspan="4">����</th>
			</tr>
			<tr>
				<td colspan="4" align="center">${getContent.title}</td>
			</tr>
			<tr align="center">
				<th bgcolor="green" colspan="4">����</th>
			</tr>
			<tr>
				<td height="40%" colspan="4" align="center"><textarea
						width="100%" cols="100%" rows="10" font-size="12" readOnly> ${getContent.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><input type="button"
					name="reply" value="����" onclick="window.location='message_reply?msgNum=${getContent.msgNum}'">
					<input type="button" name="delete" value="����"
					onclick="window.location='message_delete'"> <input
					type="button" value="������" onclick="window.location='yeps_message'">
				</td>
			</tr>


			<h2>����� �޽������� �Դϴ�.!!</h2>
		</table>

	</div>
	<%@ include file="../bottom.jsp"%>
</body>
</html>