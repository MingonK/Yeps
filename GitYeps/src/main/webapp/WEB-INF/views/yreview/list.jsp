<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>yeps_review yreviewList</title>
</head>
<body>
<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="yreview_write">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="600">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th>�ܷ�Ű1</th>
			<th>�ܷ�Ű2</th>
			<th>�ۼ���</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>����</th>
			<th>����</th>
			<th>IP</th>
		</tr>
	<c:if test="${empty yreviewList}">
		<tr>
			<td colspan="9">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>	
	</c:if> 	
	<c:forEach var="dto" items="${yreviewList}">
		<tr>
			<td>${dto.rvnum}</td>
			<td>${dto.no1}</td>
			<td>${dto.no2}</td>
			<td>${dto.writer}</td>
			<td>${dto.content}</td>
			<td>${dto.joindate}</td>
			<td>${dto.gradepoint}</td>
			<td>${dto.filenum}</td>
			<td>${dto.ip}</td>
		
		</tr>
	</c:forEach>		
	</table>
</div>
</body>
</html>

