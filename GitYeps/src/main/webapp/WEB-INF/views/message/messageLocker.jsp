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
//���õ� üũ�ڽ��� ���� ������ �� ...
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
			<h2>���� ������</h2>
		</caption>
		<hr color="green" width="70%">
		<!-- ����Ʈ�ڽ� ��� ������ �Ʒ� �� ���� ��ư�� ������ϴ�. -->
		<tr>
			<td align="left"><input type="button" name="send" value="���� ������"
				onclick="window.location='message_send?mode=send'"> <input
				type="button" name="receive" value="���� ������"
				onclick="window.location='message_receive?mode=receive'"> <input
				type="button" value="������" onclick="window.location='yeps_message'">
				<br></td>
		</tr>
		<br>
		<table border="1" width="80%" align="center">
			<tr valign="center">
				<td align="center" rowspan="2">��ü����<br> <input
					type="checkbox" value="" id="checkAll"
					onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
					<input type="checkbox" id="ipt" disabled> <label for="ipt"></label></td>
				<td align="left" colspan="5"><input type="button" value="��ü����"
					onclick="uncheckAll();"> <input type="button" value="���û���"
					onclick="deleteCheck();"> <input type="button" value="����"
					onclick="window.location='message_reply'"> <input
					type="button" value="��ü����" onclick="allReply();"> <select
					name="filter" id="message" onchange="javascript:Onfunction select();">
						<option value="0">:: ���� ::</option>
						<option value="1">��� ����</option>
						<option value="2">������ ����</option>
						<option value="3">�߿� ����</option>
				</select><input type="button" name="button" value="�̵�"
					onclick="select();'"><select name="messageBox" id="box" onchange="move();">
						<option value="0">::����::</option>
						<option value="1">������</option>
						<option value="2">���� ������</option>
						<option value="3">���� ������</option>
				</select><input type="button" value="�̵�" onclick="move();"></td>

			</tr>
			<tr>
				<th bgcolor="green" width="10%"><label>��ȣ</label></th>
				<th bgcolor="green" width="10%"><label>������</label></th>
				<th bgcolor="green" width="40%"><label>����</label></th>
				<th bgcolor="green" width="20%"><label>�����ð�</label></th>
				<th bgcolor="green" width="10%"><label>����</label></th>
			</tr>
			<c:if test="${empty messageList}">
				<tr>
					<td colspan="6" align="center">�������� ������ϴ�.</td>
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