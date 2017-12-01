<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
   function addressInput(){
	   document.addrform.submit();
	   
   }</script>
<html>
<head>
<title>Address List</title>
</head>
<body>
	<div align="center">
		<form name="addrform" action="input_addr" method="post">
		<input type="hidden" name="msgnum" value="1">
			<hr width="60%" color="red">
			<h2>주소록</h2>
			<hr width="60%" color="red">
			<table border="1" id="address" width="400">
				<tr bgcolor="green">
					<th>이름</th>
					<th>이메일</th>
					<th>아이디</th>
				</tr>
			<%-- 	<c:forEach var="dto" items="${address}"> --%>
					<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
						<tr align="center">
						<td><a href="#" onclick="addressInput(); return false">${dto.name}유승지</a></td>
						<td>${dto.email}yousji76@gmail.com</td>
						<td>${dto.id}seunGjr</td>
						</tr>
			<%-- 	</c:forEach>     --%>
			</table>
		</form>
	</div>
</body>
</html>