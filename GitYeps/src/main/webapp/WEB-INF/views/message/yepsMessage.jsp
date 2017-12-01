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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
    function searching(){
	   var value1 = $("select[name=filter]").val();
	    alert(value1);
	    document.msgform.action = "message_search";
	    document.msgform.submit();
    }
    function moving(){
	    var value2 = $("select[name=messageBox]").val(); 
	    alert(value2);
	    document.msgform.action = "message_move";
	    document.msgform.submit();
    }
    
    function readMessage(){
    	var msgNum = $("input[name=readed]").val();
    	document.msgform.action = "message_read";
    	document.msgform.submit();
    }
	  
    function msgformSubmit(index) {
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
		for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	
		if(index == 1){
	         document.msgform.action = "message_delete";
		}
		if(index == 2){
		     document.msgform.action = "message_reply";
		}
		document.msgform.submit()
    }
	 
    $(document).ready(function(){
        var tbl = $("#table");
       // 테이블 헤더에 있는 checkbox 클릭시
        $(":checkbox:first", tbl).click(function(){
            // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
            if( $(this).is(":checked") ){
                $(":checkbox", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl).removeAttr("checked");
            }
            // 모든 체크박스에 change 이벤트 발생시키기               
            $(":checkbox", tbl).trigger("change");
        });
         
        // 헤더에 있는 체크박스외 다른 체크박스 클릭시
        $(":checkbox:not(:first)", tbl).click(function(){
            var allCnt = $(":checkbox:not(:first)", tbl).length;
            var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
             
            // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
            if( allCnt==checkedCnt ){
                $(":checkbox:first", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox:first", tbl).removeAttr("checked");
            }
        }).change(function(){
            if( $(this).is(":checked") ){
                // 체크박스의  부모 > 부모니까  tr이 되고 tr에  selected 라는  class 를 추가한다.
                $(this).parent().parent().addClass("selected");
            }
            else{
                $(this).parent().parent().removeClass("selected");
            }
        });
    });
    
</script>
<style>
#table th {
	background-color: #ccc;
}

#table tr.selected {
	background-color: pink;
	color: #fff;
	font-weight: bold;
}

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
		<br>
		<form name="msgform" id="msgform" method="post">
            <table border="1" width="80%" align="center" id="table">
				<tr valign="center">
					<th align="center" rowspan="2"><label>전체선택</label><br> 
					<input type="checkbox" name="first"> <input type="checkbox" id="ipt"> 
					<label for="ipt"></label></th>
					<th align="left" colspan="6">
					<input type="button" name="del" value="선택삭제" onclick="msgformSubmit(1);"> 
					<input type="button" name="reply" value="답장" onclick="msgformSubmit(2);">
					<input type="button" name="write" value="쪽지쓰기" onclick="window.location='message_sendForm'"> 
					<select name="filter">
							<option value="">:: 필터 ::</option>
							<option value="allMsg">모든 쪽지</option>
							<option value="noneMsg">안읽은 쪽지</option>
							<option value="impMsg">중요 쪽지</option>
					</select><input type="button" id="search" value="검색" onclick="searching();">
					<select name="messageBox">
							<option value="">:: 필터 ::</option>
							<option value="locker">보관함</option>
							<option value="receive">받은 쪽지함</option>
							<option value="send">보낸 쪽지함</option>
					</select><input type="button" id="move" value="이동" onclick="moving();"></th>
				</tr>
				<tr>
					<th width="7%"><label>읽음</label></th>
					<th width="7%"><label>번호</label></th>
					<th width="10%"><label>보낸이</label></th>
					<th width="43%"><label>제목</label></th>
					<c:choose>
						<c:when test="${mode eq 'send'}">
							<th width="18%"><label>보낸시간</label></th>
						</c:when>
						<c:when test="${mode eq 'receive'}">
							<th width="18%"><label>받은시간</label></th>
						</c:when>
					</c:choose>
                    <th width="6%"><label>파일</label></th>
				</tr>
				<c:if test="${empty messageList}">
					<tr>
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<td colspan="7" align="center">보낸 쪽지함이 비었습니다.</td>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<td colspan="7" align="center">받은 쪽지함이 비었습니다.</td>
							</c:when>
						</c:choose>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${messageList}">
					<tr align="center" >
						<td><input type="checkbox" name="check" value="${dto.msgNum}">
							<input type="checkbox" id="ipt" name="impt" value="${dto.msgNum}"><label
							for="ipt"></label></td>
						<!--  중요메일 표시하기위해 작업중 -->
						<td>
						<c:choose>
							<c:when test="${dto.readNum == 1}">
								<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}"
								onclick="readMessage();"></label>
							</c:when>
							<c:when test="${dto.readNum == 0}">
								<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}"
								onclick="readMessage();"></label>
							</c:when>
						</c:choose></td>
						<td>${dto.msgNum}</td>
						<td><a href="message_reply?receiver=${dto.sender}"><label>${dto.sender}</label></a></td>
						<td><a href="message_content?msgNum=${dto.msgNum}&readDate=${dto.readDate}"><label>${dto.title}</label></a></td>
						<td><label>${dto.reg_date}</label></td>
						<td>
						<c:choose>
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
