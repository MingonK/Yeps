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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
    
  /* function check(){
		
		if (msgform.receiver.value==""){
			alert("받는 사람을 입력하세요")
			msgform.receiver.focus()
			return
		}
		
		if (msgform.title.value==""){
			alert("제목을 입력하세요")
			msgform.title.focus()
			return
		}
		if (msgform.content.value==""){
			alert("내용을 입력하세요")
			msgform.content.focus()
			return
		}
		document.msgform.action = "message_send?mode=send";
		document.msgform.submit()
		}; */
		window.onload(windowOpen);
    function windowOpen(){
			window.open("message_sendForm","addr", "left="+left1+", top="+top1+",width=600,height=400,resizable=yes,scrollbars=yes")
			
		}

    function searching(){
	   var value1 = $("select[name=filter]").val();
	    if(value1==0){
	    	alert("검색키를 선택하세요.");
	        msgform.filter.focus()
	        return false
	    }
	    document.msgform.action = "message_search";
	    document.msgform.submit();
    }
		  
    function moving(){
	    var value2 = $("select[name=filter2]").val(); 
	    if(value2==0){
	    	alert("원하는 키를 선택하세요.");
	        msgform.filter2.focus()
	        return false
	    }
	    document.msgform.action = "message_move";
	    document.msgform.submit();
    }
    
    function moveToLocker(){
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
		for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_moveToLocker";
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
			 var left1,top1;
	         left1=(screen.width-300)/2;
	         top1=(screen.height-300)/2;
	          window.open("message_reply","addr", "left="+left1+", location=no, toolbar=no, resizable=no, menubar=no,  top="+top1+",width=600,height=400,resizable=yes,scrollbars=yes");
	         /* openWin.document.getElementById("msgNum").value()=document.getElementById("msgNum").value(); */
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

#table tr[id="list"].selected {
	background-color: navy;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>
	<div align="center">
		<caption>
			<h1 style="font-family: consolas; color: #d32323;">yeps Message</h1>
		</caption>
		<hr color="green" width="70%">
		<br>
		<div id="menu"
			style="background-color: #ffffff; height: 70%; width: 25%; float: left;">
			<h3>Menu</h3>
			<br> <input type="button" id="write" value="쪽지쓰기"
				style="width: 100; height: 40; color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;"
				 data-target="#layerpop"> <input type="button"
				id="popbutton" value="내게쓰기"
				style="width: 100; height: 40; color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;"
				onclick="windowOpen();"><br> <br>
			<div align="center" id="tag">
				<a href="message_move?filter2=receive"><label>받은 쪽지 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="message_move?filter2=send"><label>보낸 쪽지 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="message_move?filter2=locker"><label>쪽지보관함 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
				<a href="message_move?filter2=trash"><label>휴지통 </label></a><a href="#"><label> ${count}</label></a><br> <br> 
			</div>
		</div>
		<br>
		<br>
		<div id="messageList" style="height: 70%; width: 75%; float: left;">
			<form name="msgform" id="msgform" method="post">
				<table border="0" id="table">
					<tr valign="middle">
						<th align="center" rowspan="2" valign="middle"><br> 
						<input type="checkbox" name="first"></th>
						<th align="left" colspan="6">
						<input type="button" name="del" value="삭제" style="color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(1);"> 
						<input type="button" name="reply" value="답장" style="color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(2);"> 
						<input type="button" name="locker" value="보관" style="color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="moveToLocker();"> 
						<select name="filter" style="border-radius: 7px;">
								<option value="0">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
								<option value="impMsg">중요 쪽지</option>
						</select> 
						<input type="button" id="search" value="검색" style="color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="searching();"> 
						<select name="filter2" style="border-radius: 7px;">
								<option value="0">:: 필터 ::</option>
								<option value="locker">보관함</option>
								<option value="receive">받은 쪽지</option>
								<option value="send">보낸 쪽지</option>
						</select> 
						<input type="button" id="move" value="이동" style="color: #ffffff; background: #d32323; border-radius: 9px; font-weight: bold; font-family: consolas;" onclick="moving();"></th>
					</tr>
                    <tr>
						<th width="7%"><label>읽음</label></th>
						<th width="7%"><label>번호</label></th>
						<th width="9%"><label>보낸이</label></th>
						<th width="42%"><label>제목</label></th>
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<th width="18%"><label>보낸시간</label></th>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<th width="18%"><label>받은시간</label></th>
							</c:when>
						</c:choose>
						<th width="7%"><label>차단</label>
					</tr>
					<c:if test="${empty messageList}">
						<tr>
							<c:choose>
								<c:when test="${mode eq 'send'}">
									<td colspan="6" align="center">보낸 쪽지가 없습니다.</td>
								</c:when>
								<c:when test="${mode eq 'receive'}">
									<td colspan="6" align="center">받은 쪽지가 없습니다.</td>
								</c:when>
							</c:choose>
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
</body>
</html>


<div class="modal fade" id="layerpop">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<button type="button" class="close" data-dismiss="modal">×</button>
								<!-- header title -->
								<h3 class="modal-title">To</h3>
								<input type="text" name="receiver" id="receiver"
									style="width: 100%; height: 25; border-radius: 7px;"
									value="${receiver }">
							</div>
							<!-- body -->
							<div class="modal-body">
								<h3>Subject</h3>
								<input type="text" name="title"
									style="width: 100%; height: 25; border-radius: 7px;">
							</div>
							<!-- Footer -->
							<div class="modal-footer">
								<h3 align="left">Message</h3>
								<textarea style="width: 100%; border-radius: 7px;" cols="100%"
									rows="5" name="content" placeholder="           여기에 내용을 입력하세요."></textarea>
								<br>
							    <button name="submit" class="btn btn-danger" value="sendMessage" onclick="javascript:check();">sendMessage</button> 
							    <input type="reset" name="cancel" value="cancel" style="background: #00ff0000; border: 0;">
							</div>
						</div>
					</div>
				</div>