<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../top.jsp" %>
<html>
<head>
	<title>QnA</title>
	<script type="text/javascript">
		function deleteQnACheck(qnum){
			if(confirm("정말 삭제하시겠습니까?")){
				window.location='qna_delete?qnum='+qnum ;
			}else{
				return
			}
			return
		}
	</script>
</head>
<body>
<% 
	pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="15%">글번호</th>
			<td align="center" width="35%">${getQnA.qnum}</td>
			<th bgcolor="yellow" width="15%">조회수</th>
			<td align="center" width="35%">${getQnA.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">작성자</th>
			<td align="center" width="35%">${getQnA.writer}</td>
			<th bgcolor="yellow" width="15%">작성일</th>
			<td align="center" width="35%">${getQnA.regdate}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글제목</th>
			<td colspan="3">${getQnA.title}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글내용</th>
			<td colspan="3">${fn:replace(getQnA.content,crcn,br)}</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
		<c:choose>			
		<c:when test="${sessionScope.memberEmail == 'YEPSManager' || sessionScope.memberEmail == 'YEPSMaster'}">
			<input type="button" 
					onclick="window.location='qna_reply?qnum=${getQnA.qnum}'" value="답변달기">
				<input type="button" value="글삭제"
					onclick="deleteQnACheck('${getQnA.qnum}')">
		</c:when>
		<c:otherwise>
			<c:if test="${getQnA.writer != 'YEPSManager' && getQnA.writer != 'YEPSMaster'&& sessionScope.memberNum == getQnA.mnum && getQnA.answered == 'n'}">
				<input type="button" value="글수정"
					onclick="window.location='qna_update?qnum=${getQnA.qnum}'">
				<input type="button" value="글삭제"
					onclick="deleteQnACheck('${getQnA.qnum}')">
			</c:if>
		</c:otherwise>
		</c:choose>
				<input type="button" value="글목록" 
					onclick="window.location='qna_list'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>



















