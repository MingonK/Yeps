<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>

<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>

<html>
<head>
<title>Yeps Message</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.js">
	function checkOn(form) {
		if (form.Button.disabled == true)
			form.Button.disabled = false
		else
			form.Button.disabled = true
	}

	function deleteCheck(){
	$("input[name=]:checked").each(function() {
		  var test = $(this).val();
		});
	alert(test)
	}
</script>
</head>
<body>
	<div align="center">
		<hr color="green" width="70%">
		<h2>받은 쪽지함(or 보낸 쪽지함)</h2>
		<hr color="green" width="70%">
		<br> <input type="radio" name="send">보낸 쪽지함 <input
			type="radio" name="receive">받은 쪽지함 <br> <br>
		<form name="form">
			<table border="1" width="80%" align="center" name="table">
				<table border="1" width="80%" height="70%" align="center"
					name="table">
					<tr valign="center">
						<td align="center" rowspan="2">전체선택<br> <input
							type="checkbox"
							onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
							<input type="checkbox" id="ipt"> <label for="ipt"></td>
						<td align="left" colspan="5"><input type="button" name="del"
							value="선택삭제" onclick="window.location=message_delete"> <input
							type="button" name="button" value="답장"
							onclick="window.location='message_reply'"> <input
							type="button" name="button" value="쪽지쓰기"
							onclick="window.location='message_sendForm'"> <input
							type="button" name="button" value="전체답장"
							onclick="window.location='message_allReply'"> <input
							type="button" name="button" value="보관함"
							onclick="window.location='message_locker'"> <select
							name="filter">
								<option type="button" value="">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
								<option value="impMsg">중요 쪽지</option>
						</select><input type="button" name="button" value="불러오기"
							onclick="message_move'"></td>

						<td align="center" rowspan="2">전체선택<br> <input
							type="checkbox"
							onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
							<input type="checkbox" id="ipt"> <label for="ipt"></label>
						</td>
						<td align="left" colspan="5"><input type="button"
							name="button" value="선택삭제"
							onclick="window.location=message_delete"> <input
							type="button" name="button" value="답장" onclick="reply();">
							<input type="button" name="button" value="전체답장"
							onclick="window.location='message_allReply'"> <input
							type="button" name="button" value="보관함"
							onclick="window.location='message_locker'"> <select
							name="filter">
								<option value="">:: 필터 ::</option>
								<option value="">모든 쪽지</option>
								<option value="">안읽은 쪽지</option>
								<option value="">중요 쪽지</option>
						</select></td>
					</tr>
					<tr>
						<th bgcolor="green" width="10%">번호</th>
						<th bgcolor="green" width="10%">보낸이</th>
						<th bgcolor="green" width="40%">제목</th>
						<th bgcolor="green" width="20%">받은시각</th>
						<th bgcolor="green" width="10%">파일</th>
					</tr>
					<c:if test="${empty messageList}">
						<tr>
							<td colspan="5" align="center">쪽지함이 비었습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${messageList}">
						<tr align="center">
							<td><input type="checkbox" name="ch" value="${dto.msgNum}"
								id="${dto.msgNum}"> <input type="checkbox" id="ipt">
								<label for="ipt"></label></td>
							<td>${dto.msgNum}</td>
							<td><a href="javascript:onfunction">${dto.sender}</a></td>
							<td><a href="message_content?msgNum=${dto.msgNum}">${dto.title }</a></td>
							<td>${dto.reg_date}</td>
							<td><img src="../img/folder.gif"></td>
						</tr>
</c:forEach>
</table>
</form>
<%@ include file="../bottom.jsp"%>
</div>
</body>
</html>
