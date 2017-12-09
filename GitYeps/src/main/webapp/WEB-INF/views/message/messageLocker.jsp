<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<title>Message Locker</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>

<style>
#table tr[id="list"].selected {
	background-color: yellow;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>
<body>
   <div id="container" style="height:80%;" align="center">
		<caption>
			<h1 style="font-family: consolas; color: #d32323;">yeps Message</h1>
		</caption>
		<hr color="green" width="70%">
		<br>
		<div id="menu" style="background-color: #ffffff; height: 60%; width: 25%; float: left; font-weight: bold; font-family: consolas; font-size:17px;">
			<h3 style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;">Menu</h3>
			<br> <input type="button" value="쪽지쓰기" style="width: 100; height: 40; color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="windowOpen();">
				 <input type="button" value="내게쓰기" style="width: 100; height: 40; color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="windowOpen();"><br> <br>
			<div align="center" id="tag">
				<a href="message_move?filter2=receive"><label>받은 쪽지 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="message_move?filter2=send"><label>보낸 쪽지 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="yeps_message"><label>쪽지함 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="message_move?filter2=trash"><label>휴지통 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
			</div>
		</div>
		<br><br>
		<div id="messageList"  align="left" style="height: 60%; width: 75%; float: left;  padding:1;">
			<form name="lockerform" id="lockerform" method="post">
				<table border="0" id="table">
					<tr valign="middle">
						<td width="60px" align="center" rowspan="3" valign="middle"><br> 
						<input type="checkbox" name="first"></td>
						<th align="left" colspan="6">
						<input type="button" name="del" value="삭제" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(1);"> 
						<input type="button" name="reply" value="답장" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(2);"> 
						<input type="button" name="locker" value="쪽지함" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="moveToMsgBox();"> 
						<select name="filter" style="border-radius: 4px;">
								<option value="0">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
						</select> 
						<input type="button" id="search" value="검색" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="searching();"> 
						<select name="filter2" style="border-radius: 4px;">
								<option value="0">:: 필터 ::</option>
								<option value="msgBox">쪽지함</option>
								<option value="receive">받은 쪽지</option>
								<option value="send">보낸 쪽지</option>
						</select> 
						<input type="button" id="move" value="이동" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="moving();"></th>
				</tr>
				<tr><td><br></tr>
                    <tr align="center">
						<td width="60px"><label>읽음</label></td>
						<td width="60px"><label>번호</label></td>
						<td width="60px"><label>보낸이</label></td>
						<td width="500px"><label>제목</label></td>
						<th width="120px"><label>받은시각</label></th>
						<td width="60px"><label>차단</label>
					</tr>
					<c:if test="${empty messageList}">
						<tr>
							<td colspan="6" align="center">보관함이 비었습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${messageList}">
						<tr align="center" id="list">
							<td><input type="checkbox" name="check" value="${dto.msgNum}"></td>
							<td><c:choose>
									<c:when test="${dto.readNum == 1}">
										<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}" onclick="readMessage();"></label>
									</c:when>
									<c:when test="${dto.readNum == 0}">
										<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}" onclick="readMessage();"></label>
									</c:when>
								</c:choose></td>
							<td style="font-weight: bold;">${dto.msgNum}</td>
							<td><a href="javascript:windowOpen();"><label>${dto.sender}</label></a>
								<input type="hidden" id="receiver" value="${dto.sender}"></td>
							<td><a
								href="message_content?msgNum=${dto.msgNum}&readDate=${dto.readDate}"><label>${dto.title}</label></a></td>
							<td><label>${dto.reg_date}</label></td>
							<td><a href="#">차단</a></td>
						</tr>
					</c:forEach>
				</table>
				<br>
			</form>
		</div>
		<br>
	</div>
	<script>
	function windowOpen() {
		var left1, top1;
		left1 = (screen.width - 300) / 2;
		top1 = (screen.height - 300) / 2;
		window.open("message_sendForm", "addr", "left=" + left1 + ", top="+ top1 + ",width=600,height=400,resizable=no,scrollbars=yes");
	}

	function searching() {
		var value1 = $("select[name=filter]").val();
		if (value1 == 0) {
			alert("검색키를 선택하세요.");
			lockerform.filter.focus()
			return false
		}
		document.lockerform.action = "message_search";
		document.lockerform.submit();
	}
	function moving() {
		var value2 = $("select[name=filter2]").val();
		if (value2 == 0) {
			alert("원하는 키를 선택하세요.");
			lockerform.messageBox.focus()
			return false
		}
		document.lockerform.action = "message_move";
		document.lockerform.submit();
	}

	function readMessage() {
		var msgNum = $("input[name=readed]").val();
		document.lockerform.action = "message_readLocker";
		document.lockerform.submit();
	}

	function moveToMsgBox() {
		$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
			for (var i = 0; i < checkVal.length; i++) {
				if (checkVal[i].checked) {
					txt += checkVal[i].value + " ";
				}
			}
			document.lockerform.action = "message_moveToMsgBox";
			document.lockerform.submit();
		});
	}

	function lockerformSubmit(index) {
		$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
			for (var i = 0; i < checkVal.length; i++) {
				if (checkVal[i].checked) {
					txt += checkVal[i].value + " ";
				}
			}
		});
		if (index == 1) {
			document.lockerform.action = "message_delete";
		}
		if (index == 2) {
			document.lockerform.action = "message_reply";
		}
		document.lockerform.submit()
	}

	$(document).ready(function() {
		var tbl = $("#table");
		// 테이블 헤더에 있는 checkbox 클릭시
		$(":checkbox:first", tbl).click(function() {
		    // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
			if ($(this).is(":checked")) {
				$(":checkbox", tbl).attr("checked", "checked");
			} else {
				$(":checkbox", tbl).removeAttr("checked");
			}
			// 모든 체크박스에 change 이벤트 발생시키기               
			    $(":checkbox", tbl).trigger("change");
			});

			// 헤더에 있는 체크박스외 다른 체크박스 클릭시
			$(":checkbox:not(:first)", tbl).click(function() {
				var allCnt = $(":checkbox:not(:first)",tbl).length;
				var checkedCnt = $(":checkbox:not(:first)",tbl).filter(":checked").length;

				// 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
				if (allCnt == checkedCnt) {
					$(":checkbox:first", tbl).attr("checked", "checked");
				} else {
					$(":checkbox:first", tbl).removeAttr("checked");
					
				}}).change(function() {
				if ($(this).is(":checked")) {
					
				// 체크박스의  부모 > 부모니까  tr이 되고 tr에  selected 라는  class 를 추가한다.
					$(this).parent().parent().addClass("selected");
				} else {$(this).parent().parent().removeClass("selected");
				}
			});
		});
</script>
	<%@ include file="../bottom.jsp"%>
	<script type="text/javascript" src="js\bootstrap.js"></script>
	
</body>

</html>
