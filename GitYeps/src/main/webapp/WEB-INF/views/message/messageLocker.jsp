<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>
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
	
	if(index == 1){
         document.lockerform.action = "message_delete";
	}
	if(index == 2){
	     document.lockerform.action = "message_reply";
	}
	document.lockerform.submit()
}
    
    $(document).ready(function(){
        var tbl = $("#table");
  
        $(":checkbox:first", tbl).click(function(){
           if( $(this).is(":checked") ){
                $(":checkbox", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl).removeAttr("checked");
            }
            $(":checkbox", tbl).trigger("change");
        });
         
        $(":checkbox:not(:first)", tbl).click(function(){
            var allCnt = $(":checkbox:not(:first)", tbl).length;
            var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
             
            if( allCnt==checkedCnt ){
                $(":checkbox:first", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox:first", tbl).removeAttr("checked");
            }
        }).change(function(){
            if( $(this).is(":checked") ){
                $(this).parent().parent().addClass("selected");
            }
            else{
                $(this).parent().parent().removeClass("selected");
            }
        });
    });
	
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
			<td align="left">
			<input type="button" name="send" value="보낸 쪽지함" onclick="window.location='message_send?mode=send'"> 
			<input type="button" name="receive" value="받은 쪽지함" onclick="window.location='message_receive?mode=receive'"> 
			<input type="button" value="쪽지함" onclick="window.location='yeps_message'"><br></td>
		</tr>
		<br>
		<form name="lockerform" method="post">
		<table border="1" width="80%" align="center">
			<tr valign="center">
				<td align="center" rowspan="2">전체선택<br> 
				<input type="checkbox" name="first" >
				<input type="checkbox" id="ipt" disabled> <label for="ipt"></label></td>
				<td align="left" colspan="5"> 
				<input type="button" value="선택삭제" onclick="lockerformSubmit(1);"> 
				<input type="button" value="답장" onclick="lockerformSubmit(2)">
				<input type="button" value="쪽지쓰기" onclick="window.location='message_sendForm'">  
				<select name="filter"  >
						<option value="0">:: 필터 ::</option>
						<option value="1">모든 쪽지</option>
						<option value="2">안읽은 쪽지</option>
						<option value="3">중요 쪽지</option>
				</select><input type="button" id="search" value="검색" >
				<select name="messageBox"  >
						<option value="0">::필터::</option>
						<option value="1">쪽지함</option>
						<option value="2">받은 쪽지함</option>
						<option value="3">보낸 쪽지함</option>
				</select><input type="button" id="move" value="이동" ></td>

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
					<td><a href="message_reply?receiver=${dto.sender}"><label>${dto.sender}</label></a></td>
					<td><a href="message_content?msgNum=${dto.msgNum}"><label>${dto.title}</label></a></td>
					<td><label>${dto.reg_date}</label></td>
					<td><c:choose>
							<c:when test="${ empty dto.filename}">
								<label><input type="image" src="resources/img/level.gif" name="file" value="${dto.msgNum}"
								onclick="readMessage();"></label>
							</c:when>
							<c:when test="${not empty dto.filename}">
								<label><input type="image" src="resources/img/folder.gif" name="file" value="${dto.msgNum}"
								onclick="readMessage();"></label>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>