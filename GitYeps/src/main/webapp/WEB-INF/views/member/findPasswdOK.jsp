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
		<c:when test="${temporaryPw==1}">
			<center>
			<b>회원님의 가입된 E-MAIL로 임시 비밀번호가 발송되었습니다.<br />
			로그인 후 비밀번호를 변경해주시기 바랍니다.<br /></b><br /><br />
			<input type="button" value="확인" onclick="closeForm()">
			</center>
			
		</c:when>
		<c:when test="${temporaryPw==-1}">
			<center>
				<b>회원정보가 존재하지 않습니다.</b><br /><br />
				<input type="button" value="확인" onclick="closeForm()">
			</center>
		</c:when>
		<c:otherwise>
			<center>
				<b>잠시후 다시 시도해주세요.</b><br /><br />
				<input type="button" value="확인" onclick="closeForm()">
			</center>
		</c:otherwise>
	</c:choose>
</body>
</html>