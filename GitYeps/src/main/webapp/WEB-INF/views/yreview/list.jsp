<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>yeps �̺�Ʈ ����Ʈ</title>
</head>
<body>
<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="event_write">�̺�Ʈ ���</a></td>
		</tr>
	</table>
	<table border="1" width="600">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th>rnum</th>
			<th>�̺�Ʈ �̸�</th>
			<th>���۳�¥</th>
			<th>���ᳯ¥</th>
			<th>���Ը�</th>
			<th>����</th>
			<th>������</th>
			<th>IP</th>
		</tr>
	<c:if test="${empty EventList}">
		<tr>
			<td colspan="9">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${eventList}">
		<tr>
			<td>${dto.evnum}</td>
			<td>${dto.rnum}</td>
			<td>${dto.eventname}</td>
			<td>${dto.start_time}</td>
			<td>${dto.end_time}</td>
			<td>${dto.storename}</td>
			<td>${dto.content}</td>
			<td>${dto.discount}</td>
			<td>${dto.ip}</td>
		</tr>
	</c:forEach>		
	</table>
</div>
</body>
</html>

