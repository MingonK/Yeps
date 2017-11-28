<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>

<title>Message View</title>
</head>
<body>
	<div align="center">
		<br>
		<form name="contentForm" action="message_delete" method="post">
			<input type="hidden" name="msgNum" value="${getContent.msgNum }">
			<table border="1" width="70%" align="center">
				<tr>
					<th bgcolor="green" width="20%">보낸이</th>
					<td>${getContent.sender}</td>
					<th bgcolor="green" width="20%">받은시각</th>
					<td>${getContent.reg_date}</td>
				<tr align="center">
					<th bgcolor="green" colspan="4">제목</th>
				</tr>
				<tr>
					<td colspan="4" align="center">${getContent.title}</td>
				</tr>
				<tr align="center">
					<th bgcolor="green" colspan="4">내용</th>
				</tr>
				<tr>
					<td height="40%" colspan="4" align="center"><textarea
							width="100%" cols="100%" rows="10" font-size="12" readOnly> ${getContent.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button"
						name="reply" value="답장"
						onclick="window.location='message_reply?msgNum=${getContent.msgNum}'">
						<input type="submit" name="delete" value="삭제"> <input
						type="button" value="쪽지함" onclick="window.location='yeps_message'">
					</td>
				</tr>
				<h2>여기는 메시지보기 입니다.!!</h2>
			</table>
		</form>
	</div>
	<%@ include file="../bottom.jsp"%>
</body>
</html>