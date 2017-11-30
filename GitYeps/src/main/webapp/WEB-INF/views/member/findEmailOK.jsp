<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>findID</title>
<script type="text/javascript">
	function closeForm(){
		self.close();
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${email==null}">
			<center>
				<b>회원정보가 존재하지 않습니다.</b><br /><br />
				<input type="button" value="확인" onclick="closeForm()">
			</center>
		</c:when>
		<c:otherwise>
			<center>
			<b>회원님의 ID는<br /> <font color="red">${email}</font><br />
			입니다. </b><br /><br />
			<input type="button" value="확인" onclick="closeForm()">
			</center>
		</c:otherwise>
	</c:choose>
</body>
</html>