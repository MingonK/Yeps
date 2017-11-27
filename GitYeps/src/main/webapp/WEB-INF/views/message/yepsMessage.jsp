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
    /* function sel_open(e){ 
	��  $("#s_menu option").each(function(){ 
	����if(e==$(this).val()) $(this).attr("selected",true); 
	     ��}); 
	  } */

	
   //üũ�ڽ� ������ ��ư Ȱ��ȭ , ��Ȱ��ȭ ��� �����Ϸ� ������ ���� ����ȵ�
	function checkOn(form) {
		if (form.Button.disabled == true)
			form.Button.disabled = false
		else
			form.Button.disabled = true
	}
	//���û��� ��ư ������ üũ�� �� �������� ��� ������..���� �� ����..
	function deleteCheck() {
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
		<caption>
			<c:choose>
				<c:when test="${mode eq 'send'}">
					<h2>���� ������</h2>
				</c:when>
				<c:when test="${mode eq 'receive'}">
					<h2>���� ������</h2>
				</c:when>
			</c:choose>
		</caption>
		<hr color="green" width="70%">
		<!-- ����Ʈ�ڽ� ��� ������ �Ʒ� �� ���� ��ư�� ������ϴ�. -->
		<tr align="left">
			<td align="left"><input type="button" name="send" value="���� ������"
				onclick="window.location='message_send?mode=send'"> <input
				type="button" name="receive" value="���� ������"
				onclick="window.location='message_receive?mode=receive'"> <input
				type="button" name="" value="������"
				onclick="window.location='message_locker'"> <br></td>
		</tr>
		<br>
		<form name="form">
			<table border="1" width="80%" align="center" name="table">
				<tr valign="center">
					<td align="center" rowspan="2"><label>��ü����</label><br> <input
						type="checkbox"
						onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
						<input type="checkbox" id="ipt"> <label for="ipt"></label></td>
					<td align="left" colspan="5"><input type="button" name="del"
						value="���û���" onclick="window.location=message_delete"> <input
						type="button" name="button" value="����"
						onclick="window.location='message_reply'"> <input
						type="button" name="button" value="��������"
						onclick="window.location='message_sendForm'"> <input
						type="button" name="button" value="��ü����"
						onclick="window.location='message_allReply'"> <select
						name="filter">
							<option value="">:: ���� ::</option>
							<option value="allMsg">��� ����</option>
							<option value="noneMsg">������ ����</option>
							<option value="impMsg">�߿� ����</option>
						</select><input type="button" name="button" value="�˻�"
						onclick="searching();"> <select name="messageBox">
						    <option value="">::����::</option>
							<option value="">������</option>
							<option value="">���� ������</option>
							<option value="">���� ������</option>
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
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<td colspan="6" align="center">���� �������� ������ϴ�.</td>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<td colspan="6" align="center">���� �������� ������ϴ�.</td>
							</c:when>
						</c:choose>

					</tr>
				</c:if>
				<c:forEach var="dto" items="${messageList}">
					<tr align="center">
						<td><input type="checkbox" name="ch" value="${dto.msgNum}"
							id="${dto.msgNum}"> <input type="checkbox" id="ipt">
							<label for="ipt"></label></td>
						<td>${dto.msgNum}</td>
						<td><a href="sel_open();"><label>${dto.sender}</label></a></td>
						<!-- <select id="s_menu">
						<option value="1">���Ͼ���</option>
						<option value="2">�ּҷϿ� �߰�</option>
						<option value="3">���������� �̵�</option>
						<option value="4">���� ������� �˻�</option>
						<option value="5">���� ������� �˻�</option>
						<option value="6">�� ����� ���� ���� ��� �˻�</option>
						</select> -->
						<td><a href="message_content?msgNum=${dto.msgNum}"><label>${dto.title}</label></a></td>
						<td><label>${dto.reg_date}</label></td>
						<td><label><img src="../img/folder.gif"></label></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>
