<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	　  $("#s_menu option").each(function(){ 
	　　if(e==$(this).val()) $(this).attr("selected",true); 
	     　}); 
	  } */

	
   //체크박스 누를시 버튼 활성화 , 비활성화 기능 구현하려 했으나 현재 적용안됨
	function checkOn(form) {
		if (form.Button.disabled == true)
			form.Button.disabled = false
		else
			form.Button.disabled = true
	}
	//선택삭제 버튼 누를시 체크된 값 가져오는 기능 구현중..아직 미 구현..
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
					<h2>보낸 쪽지함</h2>
				</c:when>
				<c:when test="${mode eq 'receive'}">
					<h2>받은 쪽지함</h2>
				</c:when>
			</c:choose>
		</caption>
		<hr color="green" width="70%">
		<!-- 셀렉트박스 기능 구현시 아래 세 개의 버튼은 사라집니다. -->
		<tr align="left">
			<td align="left"><input type="button" name="send" value="보낸 쪽지함"
				onclick="window.location='message_send?mode=send'"> <input
				type="button" name="receive" value="받은 쪽지함"
				onclick="window.location='message_receive?mode=receive'"> <input
				type="button" name="" value="보관함"
				onclick="window.location='message_locker'"> <br></td>
		</tr>
		<br>
		<form name="form">
			<table border="1" width="80%" align="center" name="table">
				<tr valign="center">
					<td align="center" rowspan="2"><label>전체선택</label><br> <input
						type="checkbox"
						onclick="$('[name=table] [type=checkbox]:gt(0)').prop('checked', $(this).is(':checked'));checkOn(this.form);">
						<input type="checkbox" id="ipt"> <label for="ipt"></label></td>
					<td align="left" colspan="5"><input type="button" name="del"
						value="선택삭제" onclick="window.location=message_delete"> <input
						type="button" name="button" value="답장"
						onclick="window.location='message_reply'"> <input
						type="button" name="button" value="쪽지쓰기"
						onclick="window.location='message_sendForm'"> <input
						type="button" name="button" value="전체답장"
						onclick="window.location='message_allReply'"> <select
						name="filter">
							<option value="">:: 필터 ::</option>
							<option value="allMsg">모든 쪽지</option>
							<option value="noneMsg">안읽은 쪽지</option>
							<option value="impMsg">중요 쪽지</option>
						</select><input type="button" name="button" value="검색"
						onclick="searching();"> <select name="messageBox">
						    <option value="">::필터::</option>
							<option value="">보관함</option>
							<option value="">받은 쪽지함</option>
							<option value="">보낸 쪽지함</option>
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
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<td colspan="6" align="center">보낸 쪽지함이 비었습니다.</td>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<td colspan="6" align="center">받은 쪽지함이 비었습니다.</td>
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
						<option value="1">메일쓰기</option>
						<option value="2">주소록에 추가</option>
						<option value="3">보관함으로 이동</option>
						<option value="4">보낸 사람으로 검색</option>
						<option value="5">받은 사람으로 검색</option>
						<option value="6">이 사람이 보낸 메일 모두 검색</option>
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
