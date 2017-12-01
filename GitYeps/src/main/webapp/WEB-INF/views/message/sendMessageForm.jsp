<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>

function check(){
		
		if (sendform.receiver.value==""){
			alert("받는 사람을 입력하세요")
			sendform.receiver.focus()
			return
		}
		if (sendform.sender.value==""){
			alert("보내는 사람을 입력하세요")
			sendform.sender.focus()
			return
		}
		if (sendform.title.value==""){
			alert("제목을 입력하세요")
			sendform.title.focus()
			return
		}
		if (sendform.content.value==""){
			alert("내용을 입력하세요")
			sendform.content.focus()
			return
		}
		document.sendform.submit()
	}
	
	function windowOpen(){
	    var left1,top1;
	        left1=(screen.width-300)/2;
	        top1=(screen.height-300)/2;
	window.open("message_address","addr", "left="+left1+", top="+top1+",width=500,height=600,resizable=yes,scrollbars=yes");
    }
	
</script>
<html>
<head>
<title>send MessageForm</title>
</head>
<body>
	<div align="center">
		<hr width="70%" color="green">
		<h2>쪽지 쓰기</h2>
		<hr width="70%" color="green">
		<p>
			<br>
		<form name="sendform" action="message_send?mode=send" method="post" enctype="multipart/form-data">
			<table border="1" width="60%" height="300">
				<tr>
					<th width="30%" bgcolor="yellow" height="10">받는사람</th>
					<td><input type="text" name="receiver" style="width: 100%;" value="${receiver }"></td>
					<td width="30%"><input type="button" value="주소록" style="width: 100%;" onclick="windowOpen();"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow" height="10">보내는 사람</th>
					<td colspan="2"><input type="text" name="sender" style="width: 100%;">
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow" height="10">제목 입력</th>
					<td colspan="2"><input type="text" name="title" style="width: 100%;"></td>
				</tr>
				<tr>
				<th width="20%" bgcolor="yellow">파일첨부</th> 
				<td colspan="2"><input type="file" name="filename" value="파일 첨부" style="width: 100%;"></td></tr>
				<tr>
					<th colspan="3" align="center" bgcolor="yellow" height="10">내용 입력</th>
				</tr>
				<tr>
					<td colspan="3" width="100%" height="50%">
					<textarea style="width: 100%;" cols="100%" rows="10" name="content" placeholder="여기에 내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<td colspan=3 " align="center">
					<input type="button" value="보내기" onclick="javascript:check();"> 
					<input type="reset" name="cancel" value="취소"> 
					<input type="button" value="쪽지함" name="memo" onclick="window.location='yeps_message'">
			</table>
		</form>
	</div>

</body>
</html>