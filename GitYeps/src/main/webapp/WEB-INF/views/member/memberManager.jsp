<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>mvc���</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
 <body>
	<div align="center">
		<hr color="green" width="300">
		<h2>ȸ �� �� ��</h2>
		
		<form name="f" method="post">
		<select name="search">
			<option value="email">�̸���</option>
			<option value="name">�̸�</option>
		</select>
		<input type="text" name="searchString" class="box">
		<input type="submit" value="�˻�">
		</form>
		<hr color="green" width="300">
		<table width="100%" class="outline">
			<tr>
				<th class="m3">ȸ����ȣ</th>
				<th class="m3">�̸�</th>
				<th class="m3">�̸���</th>
				<th class="m3">��й�ȣ</th>
				<th class="m3">�������</th>
				<th class="m3">������</th>
				<th class="m3">���䰹��</th>
				<th class="m3">��������</th>
				<th class="m3">������</th>
				<th class="m3">ī�װ���������</th>
				<th class="m3">�̺�Ʈ��������</th>
				<th class="m3">������������</th>
				<th class="m3">���԰�������</th>
				<th class="m3">�����������</th>
				<th class="m3">����</th>
			</tr>
	<c:choose>
		<c:when test="${listMember==null}">
			<tr>
				<td colspan="15">��ϵ� ȸ���� �����ϴ�.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listMember}">
				<tr>
				<td align="center">${dto.mnum}</td>
				<td align="center">${dto.name}</td>
				<td align="center">${dto.email}</td>
				<td align="center">${dto.passwd}</td>
				<td align="center">${dto.birth}</td>
				<td align="center">${dto.joindate}</td>
				<td align="center">${dto.reviewcount}</td>
				<td align="center">${dto.imagecount}</td>
				<td align="center">${dto.ismanager}</td>
				<td align="center">${dto.controlcate}</td>
				<td align="center">${dto.controlevent}</td>
				<td align="center">${dto.controlmember}</td>
				<td align="center">${dto.controlstore}</td>
				<td align="center">${dto.controlreview}</td>
				<td><a href="member_delete?num=${dto.mnum}">ȸ������</a></td>
			</tr>	
			</c:forEach>
		</c:otherwise>
	</c:choose>	
		</table>
		<br>
		<a href="member_manager">ȸ�������������� �̵�</a>
	</div>
</body>
</html>