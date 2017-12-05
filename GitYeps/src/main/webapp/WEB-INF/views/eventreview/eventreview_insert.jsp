<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Yeps 이벤트리뷰 작성</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function check() {
			if(f.content.value=="") {
				alert("내용을 입력해주세요.")
				f.content.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
<c:set var="evnum" value="0"/>
<form name="f" method="post" action="board_write.do" onsubmit="return check()" enctype="multipart/form-data">
<input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
<input type="hidden" name="evnum" value="${evnum}"/>
<input type="hidden" name="mnum" value="${mnum}"/>
	<table border="1" width="100%">
		<tr bgcolor="yellow" height="5">
			<td colspan="2" align="center"><b>글 쓰 기</b></td>
		</tr>
		<tr height="10">
			<td align="center" width="70" bgcolor="yellow">*글쓴이</td>
			<td><input type="text" name="writer" size="20" class="box"/></td>
		</tr>
		<tr height="10">
			<td align="center" width="70" bgcolor="yellow">*제 목</td>
			<td><input type="text" name="subject" size="50" class="box"/></td>
		</tr>
		<tr height="10">
			<td align="center" width="70" bgcolor="yellow">Email</td>
			<td><input type="text" name="email" size="50" class="box"/></td>
		</tr>
		<tr height="10">
			<td align="center" width="70" bgcolor="yellow">파일명</td>
			<td><input type="file" name="filename" class="box" size="50"/></td>
		</tr>
		<tr height="50">
			<td align="center" width="70" bgcolor="yellow">*내 용</td>
			<td> <textarea name="content" rows="10" cols="70" class="box"></textarea></td>
		</tr>
		<tr height="5">
			<td align="center" width="70" bgcolor="yellow">*비밀번호</td>
			<td><input type="password" name="passwd" size="12" class="box"/></td>
		</tr>
		<tr bgcolor="yellow" height="10">
			<td></td>
			<td align="left"><input type="submit" value="글쓰기">
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기" onclick="window.location='board_list.do'"/></td>
		</tr>
	</table>
</form>
</body>
</html>