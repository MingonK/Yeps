<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.js">
	function uncheckAll() {
		for (i = 0; i < ch.length; i++) {
			ch[i].checked = false;
		}
	}
//선택된 체크박스의 값을 가져온 후 ...
	function deleteCheck() {
		$("input[name=ch]:checked").each(function() {
			var test = $(this).val();
		});
	}
	function select() {
		 var value = $("#message option:selected").val();
		alert("value");

	}
	
    function move(){
		  var value = $("#box option:selected").val(); 
		    alert('value');
	} 
</script>

<title>Message Locker</title>
<style>
input[id="ipt"]+label {
	display: inline-block;
	width: 14px;
	height: 14px;
	background-color: #bcbcbc;
	border-radius: 7px;
	cursor: pointer;
}

input[id="ipt"]:checked+label {
	background-color: blue;
}

input[id="ipt"] {
	display: none;
}
</style>
</head>
<body>
	<div align="center">

		<hr color="green" width="70%">
		<caption>
			<h2>쪽지 보관함</h2>
		</caption>
		<hr color="green" width="70%">
		<!-- 셀렉트박스 기능 구현시 아래 세 개의 버튼은 사라집니다. -->
		<tr>
			<td align="left"><input type="button" name="send" value="보낸 쪽지함"
				onclick="window.location='message_send?mode=send'"> <input
				type="button" name="receive" value="받은 쪽지함"
				onclick="window.location='message_receive?mode=receive'"> <input
				type="button" value="쪽지함" onclick="window.location='yeps_message'">
				<br></td>
		</tr>
		<br>
		<table border="1" width="80%" align="center">
			<tr valign="center">
				<td align="center" rowspan="2">전체선택<br> <input
					type="checkbox" value="" id="checkAll"
					onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
					<input type="checkbox" id="ipt" disabled> <label for="ipt"></label></td>
				<td align="left" colspan="5"><input type="button" value="전체해제"
					onclick="uncheckAll();"> <input type="button" value="선택삭제"
					onclick="deleteCheck();"> <input type="button" value="답장"
					onclick="window.location='message_reply'"> <input
					type="button" value="전체답장" onclick="allReply();"> <select
					name="filter" id="message" onchange="javascript:Onfunction select();">
						<option value="0">:: 필터 ::</option>
						<option value="1">모든 쪽지</option>
						<option value="2">안읽은 쪽지</option>
						<option value="3">중요 쪽지</option>
				</select><input type="button" name="button" value="이동"
					onclick="select();'"><select name="messageBox" id="box" onchange="move();">
						<option value="0">::필터::</option>
						<option value="1">쪽지함</option>
						<option value="2">받은 쪽지함</option>
						<option value="3">보낸 쪽지함</option>
				</select><input type="button" value="이동" onclick="move();"></td>

			</tr>
			<tr>
				<th bgcolor="green" width="10%"><label>번호</label></th>
				<th bgcolor="green" width="10%"><label>보낸이</label></th>
				<th bgcolor="green" width="40%"><label>제목</label></th>
				<th bgcolor="green" width="20%"><label>받은시각</label></th>
				<th bgcolor="green" width="10%"><label>파일</label></th>
			</tr>
			<c:if test="${empty messageList}">
				<tr>
					<td colspan="6" align="center">보관함이 비었습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${messageList}">
				<tr align="center">
					<td><input type="checkbox" name="ch" value="${dto.msgNum}"
						id="${dto.msgNum}"> <input type="checkbox" id="ipt">
						<label for="ipt"></label></td>
					<td>${dto.msgNum}</td>
					<td><a href="javascript:onfunction"><label>${dto.sender}</label></a></td>
					<td><a href="message_content?msgNum=${dto.msgNum}"><label>${dto.title }</label></a></td>
					<td><label>${dto.reg_date}</label></td>
					<td><label><img src="../img/folder.gif"></label></td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>