<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>QnA</title>
<script type="text/javascript">		
	function chked(){
		var secret = "${getQnA.secret}";
		if(secret == 'y'){
			document.qnaupdatef.secret.checked = true;
		}
	}
	window.onload = chked;
		function updateCheck(){
			if (qnaupdatef.title.value==""){
				alert("제목을 입력해 주세요!!")
				qnaupdatef.title.focus()
				return false
			}
			if (qnaupdatef.content.value==""){
				alert("내용을 입력해 주세요!!")
				qnaupdatef.content.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
<div align="center">
	<form name="qnaupdatef" action="qna_update" method="post" onsubmit="return updateCheck()">
	<h3>글수정</h3>
	<input type="hidden" name="qnum" value="${getQnA.qnum}"/>
	<input type="hidden" name="writer" value="${getQnA.writer}"/>
	<input type="hidden" name="answered" value="${getQnA.answered}"/>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">작 성 자</th>
			<td>${getQnA.writer}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">제 목</th>
			<td><input type="text" name="title" class="box" size="50" value="${getQnA.title}"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">내 용</th>
			<td><textarea name="content" rows="13" cols="50" class="box">${getQnA.content}</textarea></td>
		</tr>
		<tr>
			<td bgcolor="yellow" colspan="2" align="center">
				<input type="checkbox" name="secret" value="y">비밀글
			</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onclick="window.location='qna_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>