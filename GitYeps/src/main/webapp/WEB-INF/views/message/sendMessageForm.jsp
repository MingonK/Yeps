<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>

<title>send MessageForm</title>
</head>
<body>
	<div align="center">
		<hr width="70%" color="green">
		<h2>쪽지 쓰기</h2>
		<hr width="70%" color="green">

		<form name="f" action="message_send?mode=send" method="post">
			<table border="1" width="60%" height="300">
				<tr>
					<th width="30%" bgcolor="yellow" height="10">받는사람</th>
					<td><c:if test="${not empty receiver}">
					<input type="text" name="receiver" style="width:100%;" value="${receiver}">
					</c:if></td>
					<td width="30%"><input  type="button" value="주소록" style="width:100%;" 
						onclick="readAddress();"></td></tr>
				<tr>
					<th width="20%" bgcolor="yellow" height="10">보내는 사람</th>
					<td colspan="2"><input type="text" name="sender" style="width:100%;">
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow" height="10">제목 입력</th>
					<td colspan="2"><input type="text" name="title" style="width:100%;"></td>
				</tr>
				<tr>
					<th colspan="3" align="center" bgcolor="yellow" height="10">내용 입력</th>
				</tr>
				<tr>
					<td colspan="3" width="100%" height="50%"><textarea  style="width:100%;" cols="100%" rows="10" name="content"
						placeholder="여기에 내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
				<td colspan=3" align="center"><input type="submit" value="보내기">
				<input type="reset" name="cancel" value="취소">
				<input type="button" value="쪽지함" name="memo" onclick="window.location='yeps_message'"> 

			</table>
		</form>
	</div>

</body>
</html>