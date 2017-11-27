<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js">
	function uncheckAll() {
		for (i = 0; i < ch.length; i++) {
			ch[i].checked = false;
		}
	}

	function checkAll() {
		if ($("#th_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
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
		<h2>���� ������</h2>
	<hr color="green" width="70%">
		<table border="1" width="80%" height="70%" align="center">
			<tr valign="center">
				<td align="center" rowspan="2">��ü����<br> 
					<input type="checkbox" value="" id="checkAll" onclik="checkAll();">
					<input type="checkbox" id="ipt1" disabled> <label for="ipt1"></label>
				</td>
				<td align="left" colspan="5">
					<input type="button" value="��ü����" onclick="uncheckAll();"> 
					<input type="button" value="���û���" onclick="deleteCheck();"> 
					<input type="button" value="����" onclick="reply();"> 
					<input type="button" value="��ü����" onclick="allReply();"> 
					<input type="button" value="������" onclick="window.location='yeps_message'"> 
					<select name="filter">
							<option value="">:: ���� ::</option>
							<option value="">��� ����</option>
							<option value="">������ ����</option>
							<option value="">�߿� ����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="10%">��ȣ</th>
				<th width="10%">������</th>
				<th width="40%">����</th>
				<th width="20%">�����ð�</th>
				<th width="10%">����</th>
			</tr>
			<tr align="center">
				<td>
					<input type="checkbox" name="ch">
					<input type="checkbox" id="ipt"><label for="ipt"></label>
				</td>
				<td>1</td>
				<td><a href="javascript:onfunction">sender</a></td>
				<td><a href="message_content">subject</a></td>
				<td>reg_time</td>
				<td><img src="../img/folder.gif"></td>
			</tr>
			<tr align="center">
				<td>
					<input type="checkbox" name="ch"> 
					<input type="checkbox" id="ipt"> <label for="ipt"></label>
				</td>
				<td>2</td>
				<td>sender</td>
				<td>subject</td>
				<td>reg_time</td>
				<td>file</td>
			</tr>
			<tr align="center">
				<td>
					<input type="checkbox" name="ch"> 
					<input type="checkbox" id="ipt"> <label for="ipt"></label>
				</td>
				<td>3</td>
				<td>sender</td>
				<td>subject</td>
				<td>reg_time</td>
				<td>file</td>
			</tr>
			<tr align="center">
				<td>
					<input type="checkbox" name="ch"> 
					<input type="checkbox" id="ipt"> <label for="ipt"></label>
				</td>
				<td>4</td>
				<td>sender</td>
				<td>subject</td>
				<td>reg_time</td>
				<td>file</td>
			</tr>
			<tr align="center">
				<td>
					<input type="checkbox" name="ch"> 
					<input type="checkbox" id="ipt"> <label for="ipt"></label>
				</td>
				<td>5</td>
				<td>sender</td>
				<td>subject</td>
				<td>reg_time</td>
				<td>file</td>
			</tr>
			</table>
			<%@ include file="../bottom.jsp"%>
		</div>
</body>
</html>