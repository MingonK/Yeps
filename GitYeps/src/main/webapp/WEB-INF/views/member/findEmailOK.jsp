<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../style.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>findID</title>
</head>
<body>
	<c:choose>
		<c:when test="${emailList==null}">
			<center>
				<b>회원정보가 존재하지 않습니다.</b><br />
				<br /> <input type="button" value="확인" onclick='self.close()'>
			</center>
		</c:when>
		<c:otherwise>
			<center>
				<b>회원님의 ID는<br /> <c:forEach var="email" items="${emailList}">
						<tr>
							<td><font color="red">${email}</font><br /></td>
						</tr>
					</c:forEach> 총 ${fn:length(emailList)} 개 입니다.
				</b><br />
				<br /> <input type="button" value="확인" onclick='self.close()'>
			</center>
		</c:otherwise>
	</c:choose>
</body>
</html>