<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if> 
<html>
<head>
<title>Yeps Message</title>
  <script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
<%-- <%@ include file="../top.jsp"%> --%>
   <div id="messageContainer" align="center" >
      <div id="messageHeader"  >
	        <tr><td><label style=" color: #d32323;  font-weight: bold; font-family: cambria; font-size: 26px; position: relative; float: left;  "> Messages</label>
			<input type="button" id="write" value="Write New Message" data-popup-open="writeMessage" onclick="messageForm(' ');"></td></tr>
	 </div>
	 <div id="menu" style="float:left;">
	    <hr color="#EEEEEE" width="100%" size="1">
			<a href="message_action?filter=receive"><label style="cursor:pointer;">InBox </label></a><a href="#"><label> : ${count}  /  </label></a>
			<a href="message_action?filter=send"><label style="cursor:pointer;"> Sent </label></a><a href="#"><label> : ${sCount}  /  </label></a>
			<a href="message_action?filter=toLocker"><label style="cursor:pointer;"> locker  </label></a><a href="#"><label>: ${lCount}</label></a> 
     </div>
		<!-- Message sendform -->
		<div class="popup" align="left" id="writeMessage" data-popup="writeMessage" style="z-index: 1;">
		<form name="sendform" method="post">
		    <div class="popup-inner">
		        <h4 align="left" >To</h4>
		        <input type="text" id="sendformTo" name="receiver" style="width: 100%; font-weight:bold; font-size:21px; height:30; border-radius: 7px;"><br>
		        <h4 align="left" style="font-weight:bold; font-size:23px">Subject</h4>
		        <input type="text" name="title" id="sendformSubject" style="width: 100%; font-weight:bold; font-size:21px; height:30; border-radius: 7px;"><br>
		        <h4 align="left" style="font-weight:bold; font-size:23px">Message</h4>
		        <textarea rows="4" name="content" id="sendformMessage" style="font-weight:bold; width:100%; font-size:17px; border-radius: 7px;" placeholder="여기에 메시지를 입력하세요."></textarea><br><br>
		        <button type="button" data-popup-send="SendMessage" style="cursor:pointer; width: 170; height: 33;  
	        color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: cambria; font-size: 17px;" onclick="sendMessage()">SendMessage </button>&nbsp;&nbsp;&nbsp;
		        <a data-popup-close="writeMessage" style="cursor:pointer;" href="#" onclick="closeSendform()">  Close</a>
				<a class="popup-close" data-popup-close="writeMessage" href="#" >x</a>
		    </div>
		    </form>
		 </div> 
		 <!-- Message View  -->
              <div class="popup" align="left" id="popup" data-popup="popup-1" style="z-index: 1;">
				       <div class="popup-inner">
				       <h4 align="left" style="font-weight:bold; font-size:23px;">From</h4>
				       <label id="from" style="font-weight:bold; font-size:21px;"></label>
				       <h4 align="left" style="font-size:23px;">Subject</h4>
				       <label id="subject" style="font-weight:bold; font-size:21px;"></label>
				       <h4 align="left" style="font-size:23px;">Message</h4>
				       <textarea id="message" rows="4" style="font-weight:bold; font-size:21px; border-radius:5px; width:100%; bgcolor:#fff;" disabled></textarea>
					        <p><a data-popup-close="popup-1" href="#" onclick="readCheck();">Close</a></p>
					        <input type="hidden" id="readCheck" > 
					        <a class="popup-close" data-popup-close="popup-1" href="#" onclick="readCheck();">x</a>
				       </div>
			    </div> 
			<div id="messageList"  style="position:absolute; " >
                <form name="msgform" method="post" >
				<table border="0" id="table">
				    <tr>
						<th align="left" colspan="7 " style="left: 120px;" >
						<input type="button" style="cursor:pointer;" name="del" id="del" value="삭제"  onclick="deleteCheckMsg();"> 
						<button type="button" style="cursor:pointer;" id="reply"  >답장</button>
						<input type="button"style="cursor:pointer;"  name="locker" id="locker" value="보관" onclick="moveToLocker();"> 
						<select name="filter" style="border-radius: 4px; cursor:pointer;">
								<option value="0">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
								<option value="toLocker">보관함</option>
						</select> 
					    <input type="button" id="search" style="cursor:pointer;" value="검색" onclick="searching();"><br> 
					    <hr color="#EEEEEE" width="100%" size="1">
				  <tr><td></tr>
                    <tr align="center">
                    <td align="center"><input type="checkbox" style="cursor:pointer;" name="first"></td>
						<td width="90px"><label>읽음</label></td>
						<td width="90px"><label>번호</label></td>
						<td width="100px"><label>보낸이</label></td>
						<td width="430px"><label>제목</label></td>
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<td width="150px"><label>보낸 시각</label></td>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<td width="150px"><label>받은 시각</label></td>
							</c:when>
						</c:choose>
					  </tr>
					  <tr><td colspan="6"> <hr color="#EEEEEE" width="100%" size="1"></td></tr>
					  
			   <c:if test="${empty map.list}">
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
				<c:forEach var="dto" items="${map.list}">
					<tr align="center" id="list">
						<td><input type="checkbox" style="cursor:pointer;" name="check" value="${dto.msgNum}"></td>
						<td><c:choose>
								<c:when test="${dto.readNum == 1}">
										<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}" style="cursor:pointer;" onclick="readMessage();"></label>
								</c:when>
								<c:when test="${dto.readNum == 0}">
										<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}" style="cursor:pointer;" onclick="readMessage();"></label>
								</c:when>
							</c:choose></td>
						<td style="font-weight: bold;" >	
							<c:set var="num" value="${num-1}"/>
				            <c:out value="${num}"/></td>
						<td><button type="button"  id="sender" name="sender" data-popup-open="writeMessage" onclick="messageForm('${dto.sender}')"
						style="background: #00ff0000; border: 0; font-weight: bold; font-family: consolas; color:#0073bb; font-size:20px; cursor:pointer;" >${dto.sender}</button>
						<td><a class="btn" style="font-weight: bold; font-family: consolas; font-size:20px; cursor:pointer;" data-popup-open="popup-1" 
						onclick="getMessage('${dto.sender}','${dto.title}','${dto.content }','${dto.msgNum}');">${dto.title}</a></td>
					    <td><label>${dto.reg_date}</label></td>
					 </tr>
				</c:forEach>
				   </table></form> 
				<div id="page" style="margin: 10px;">
				<tr><td colspan="6"> <hr color="#EEEEEE" width="100%" size="1"></td></tr>
		        <tr>
			    <td colspan="7" align="center">
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.yepsPager.curBlock > 1}">
                 <ul class="pager">
                   <li> <a href="javascript:list('${map.yepsPager.prevPage}')">Previous</a></li></ul>
                 </c:if>
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.yepsPager.blockBegin}" end="${map.yepsPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.yepsPager.curPage}">
                         <span style="color: red">  [${num}]  </span>&nbsp;&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">  [${num}]  </a>&nbsp;&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.yepsPager.curBlock <= map.yepsPager.totBlock}">
                   <a href="javascript:list('${map.yepsPager.nextPage}')"> [next] </a>
                </c:if>
               </td></tr></div></div>
           <br>
	    </div>
	<script>
	
    $("#reply").click(function(){
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			if(checkVal==null){
	    		alert("선택된 쪽지가 없습니다. 다시 확인 하세요.");
	    	}
			alert(checkVal);
			
		for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_reply?box=msgBox";
	    document.msgform.submit()
	})
	
    function list(page){
        location.href="yeps_message?curPage=" + page;
    }
    
    function messageForm(sender){
    	$('#sendformTo').empty();
    	var sender = sender;
    	$('#sendformTo').val(' ' + sender);
    }
    
    function getMessage(sender,subject,message,msgnum){
    	 var msgnum = msgnum;
    	 var sender = sender;
    	 var subject = subject;
    	 var message = message;
    	 $('#readCheck').val(msgnum) 
    	 $('#from').append(sender);
         $('#subject').append(subject);
         $('#message').append(message);
    }   

    function sendMessage(){
    	if($('#sendformTo').val()==''){
    	alert("받는 사람을 입력해주세요");
    	$('#sendformTo').focus()
    	return false;
    	
    	}else if($('#sendformSubject').val()==''){
    	alert("제목를 입력해주세요");
    	$('#sendformSubject').focus()
    	return false;
    	
    	}else if($('#sendformMessage').val()==''){
    	alert("내용을 입력해주세요");
    	$('#sendformMessage').focus()
    	return false;
    	}
        document.sendform.action = "message_send";
        document.sendform.submit();
    } 
    
    function searching(){
	   var value1 = $("select[name=filter]").val();
	    if(value1==0){
	    	alert("검색키를 선택하세요.");
	        msgform.filter.focus()
	        return false
	    }
	    document.msgform.action = "message_action";
	    document.msgform.submit();
    }
    
    function moveToLocker(){
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			if(checkVal==null){
	    		alert("선택된 쪽지가 없습니다. 다시 확인 하세요.");
	    	}
			alert(checkVal);
			
		for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_moveToLocker";
    	document.msgform.submit();
    }
    
    function readMessage(){
        document.msgform.action = "message_read";
    	document.msgform.submit();
    }
    
    function readCheck(){
    	var msgnum = $('#readCheck').val();
    	var url = "message_read?msgnum=" + msgnum ;
        window.location = url;
    }
    
    function deleteMsg(){
    	var msgnum = $('#readCheck').val();
    	var url = "message_delete?msgNum=" + msgnum ;
        window.location = url;
    }
	  
    function deleteCheckMsg() {
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
	    for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_delete";
    	document.msgform.submit();
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
    
    jQuery.noConflict();
    $(function() {
          //----- OPEN
          $('[data-popup-open]').on('click', function(e)  {
              var targeted_popup_class = jQuery(this).attr('data-popup-open');
              $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
           e.preventDefault();
           e.stopPropagation();
          });
    
          //----- CLOSE
          $('[data-popup-close]').on('click', function(e)  {
              var targeted_popup_class = jQuery(this).attr('data-popup-close');
              $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
              $('#subject').empty();
              $('#from').empty(); 
              $('#message').empty();
              $('#sendformTo').empty();
              e.preventDefault();
              e.stopPropagation();
          });
      });
    
</script>
<%@ include file="../bottom.jsp"%>
