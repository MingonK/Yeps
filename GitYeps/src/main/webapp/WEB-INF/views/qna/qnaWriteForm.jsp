<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp" %>
<html>
<head>
	<title>QnA</title>
	<script type="text/javascript">
		function qna_writeCheck(){
			if (qnawritef.subject.value==""){
				alert("제목을 입력해 주세요!!")
				qnawritef.subject.focus()
				return false
			}
			if (qnawritef.content.value==""){
				alert("내용을 입력해 주세요!!")
				qnawritef.content.focus()
				return false
			}
			return true
		}
	</script>
</head>	
<body>

<div align="center">
	<form name="qnawritef" action="qna_write" method="post" onsubmit="return qna_writeCheck()">
	<input type="hidden" name="mnum" value="${sessionScope.memberNum}"/>
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">Question</th>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">작 성 자</th>
			<td>${sessionScope.memberEmail}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">제 목</th>
			<td><input type="text" name="title" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">내 용</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr>
			<td bgcolor="yellow" colspan="2" align="center">
				<input type="checkbox" name="secret" value="y">비밀글
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="window.location='qna_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>












