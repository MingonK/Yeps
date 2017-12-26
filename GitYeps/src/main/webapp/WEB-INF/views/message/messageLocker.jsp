<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Message Locker</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>
<body>
<%@ include file="../top.jsp"%>
<!--  issueform  -->
<div class="popup" align="left" id="writeIssue" data-popup="writeIssue"  style="z-index: 1;">
    <form name="sendIssueform" method="post">
	     <div class="popup-inner">
	         <h4 align="left"  style="color: #d32323;"> Send Issue To Manager</h4>
	             <input type="hidden" id="issueValue" value="issue">
	         <h4 align="left" style="color: #d32323;">Subject is</h4><br>
	             <input type="text" name="title" id="sendIssueSubject" ><br>
	         <h4 align="left" style="color: #d32323;">Content is</h4><br>
	             <textarea rows="4" name="content" id="sendIssueContent"  placeholder="여기에 메시지를 입력하세요."></textarea><br><br>
	                 <button class="popup-send" id="sendIssue" type="button" data-popup-send="SendIssue" >SendIssue </button>&nbsp;&nbsp;
			         <a data-popup-close="writeIssue" style="cursor:pointer;" href="#">  Close</a>
					 <a class="popup-close" data-popup-close="writeIssue" href="#" >x</a>
		  </div>
	 </form>
</div> 
<!-- Message sendform -->
<div class="popup" align="left" id="writeMessage" data-popup="writeMessage" style="z-index: 1;">
<form name="sendform" method="post">
    <div class="popup-inner">
        <h4 align="left" style="color: #d32323;">Send Message To</h4>
            <input type="text" id="sendformTo" name="receiver"><br>
        <h4 align="left" style="color: #d32323;">Subject is</h4>
            <input type="text" name="title" id="sendformSubject" ><br>
        <h4 align="left" style="color: #d32323;">Content is</h4>
            <textarea rows="4" name="content" id="sendformMessage"  placeholder="여기에 메시지를 입력하세요."></textarea><br>
            <button class="popup-send" id="sendMessage" type="button" data-popup-send="SendMessage" onclick="sendMessage()">SendMessage </button>&nbsp;&nbsp;
            <a data-popup-close="writeMessage" style="cursor:pointer;" href="#">  Close</a>
		    <a class="popup-close" data-popup-close="writeMessage" href="#" >x</a>
         </div>
     </form>
 </div> 
 <!-- Message View  -->
 <div class="popup" align="left" id="popup" data-popup="popup-1" style="z-index: 1;">
      <div class="popup-inner">
      <h4 align="left" style="color: #d32323;" >Message From</h4>
      <input type="text" id="from" readOnly>
      <h4 align="left" style="color: #d32323;">Subject is</h4>
      <input type="text" id="subject" readOnly>
      <h4 align="left" style="color: #d32323;">Content is</h4>
      <textarea id="message" rows="4" readOnly></textarea>
        <p><a data-popup-close="popup-1" href="#" onclick="readCheck();">Close</a></p>
        <input type="hidden" id="readCheck" > 
        <a class="popup-close" data-popup-close="popup-1" href="#" onclick="readCheck();">x</a>
      </div>
 </div> 
 <div id="lockerContainer" style="height: 80% ; position: relative; top: 30px; min-width: 800px; margin: 0 auto; padding: 0px; width: 900px" >
	 <div id="messageHeader">
	 <label>Locker Messages</label>
	 	<input type="button" id="write" value="Write new Message" data-popup-open="writeMessage" onclick="messageForm(' ');">
	 </div>
	<div id="menu">	
		<a href="message_action?filter=receive"><label style="cursor:pointer;">locker</label></a><label>: ${lCount}</label>
		<a href="message_action?filter=sender"><label style="cursor:pointer;">Sent </label></a><label>: ${sCount}</label>
		<a href="message_action?filter=msgBoxList"><label style="cursor:pointer;">msgBox </label></a><label>: ${mCount}</label>
		<a href="message_alert"><label style="cursor:pointer; ">alertBox</label></a><label>: ${aCount}</label>
	</div>
	<div id="messageList" style="position:absolute; " >
		<form name="lockerform"  method="post">
			<table border="0" id="table" style="width: 100%;">
				<tr>
					<th align="left" colspan="7 " style="left: 120px; border-bottom: 1px solid #e6e6e6; height: 40px; padding: 10px;" >
					<input type="button" name="del" id="delete" value="delete" style="cursor:pointer;" onclick="deleteCheckMsg();"> 
<!-- 						<input type="button" name="reply" id="reply" value="reply" style="cursor:pointer;" >  -->
					<input type="button" name="msgBox" id="msgBox" value="msgBox"  onclick="lockerToMsgBox();"> 
					<select id="select" name="filter" >
						<option value="0"></option>
						<option value="allLocker">모든 쪽지</option>
						<option value="readLocker">읽은 쪽지</option>
						<option value="noneLocker">안읽은 쪽지</option>
						<option value="msgBoxList">쪽지함</option>
					</select> 
					<input type="button" id="search" value="select" style="cursor:pointer;" onclick="searching();">
					<input type="button" id="issue"  data-popup-open="writeIssue" value="issue" onclick="issueToManager();"> <br>  
					
			    </tr>
			    <tr align="center"  >
                   <td align="center"><input type="checkbox" style="cursor:pointer;" name="first"></td>
					<td width="90px"><label>읽음</label></td>
					<td width="90px"><label>번호</label></td>
					<td width="100px"><label>보낸이</label></td>
					<td width="430px"><label>제목</label></td>
					<td width="150px"><label>받은시각</label></th>
				</tr>
				<tr><td colspan="7" style=" border-bottom: 1px solid #e6e6e6;"> </td></tr> 
				<c:if test="${empty map.list}">
					<tr>
						<td colspan="6" align="center" height="60px">보관함이 비었습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${map.list}">
					<tr align="center" id="list">
						<td><input type="checkbox" name="check" value="${dto.msgNum}"></td>
						<td><c:choose>
								<c:when test="${dto.readNum == 1}">
									<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}" onclick="readMessage('${map.lMode}');"></label>
								</c:when>
								<c:when test="${dto.readNum == 0}">
									<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}" onclick="readMessage('${map.lMode}');"></label>
								</c:when>
							</c:choose></td>
					<td style="font-weight: bold;" >	
						<c:set var="num" value="${num-1}"/>
			            <c:out value="${num}"/></td>
						<td><button type="button" data-popup-open="writeMessage" id="sender" name="sender" onclick="messageForm('${dto.sender}')">${dto.sender}</button>
					    <td><a class="btn" data-popup-open="popup-1" onclick="getMessage('${dto.sender}','${dto.title}','${dto.content }','${dto.msgNum}');">${dto.title}</a></td>
				    <td><label>${dto.reg_date}</label></td>
					</tr>
				</c:forEach>
				</table>
		    </form>
		<div class="yeps_message_section" style="font-size: 14px; ">
		   <div class="yeps_message_pagination_block">
		       <div class="yeps_message_pagination_wrap">
		           <div class="yeps_message_page_of_pages" >
		                <c:if test="${map.yepsPager.blockEnd == 0}">
		                     Page ${map.yepsPager.curPage} of 1
		                </c:if>
		                <c:if test="${map.yepsPager.blockEnd != 0}">
		                     Page ${map.yepsPager.curPage} of ${map.yepsPager.blockEnd}
		                </c:if>
		           </div>
		<!--                페이징 처리!! 현재페이지는 span이 되고 나머지는 a로 -->
		           <c:if test="${map.yepsPager.blockEnd != 1}">
		           <div class="yeps_message_page_link_wrapper">
		               <div class="yeps_message_page_link_wrap">
		                    <c:if test="${map.yepsPager.curBlock > 1}">
		                    <div class="yeps_message_next_block">
		                       <a class="yeps_message_next_block_action" href="javascript:list('1')">
		                          <span>Start</span>
		                       </a>
		                    </div>
		                 </c:if>
		
		                 <c:if test="${map.yepsPager.curBlock > 1}">
		                    <div class="yeps_message_next_block">
		                       <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.prevPage}','${map.lMode}')">
		                          <span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
		                             <svg class="icon_svg">
		                                <path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>
		                             </svg>
		                          </span>
		                          <span>Previous</span>
		                       </a>
		                    </div>
		                 </c:if>
		                 <c:forEach var="num" begin="${map.yepsPager.blockBegin}" end="${map.yepsPager.blockEnd}">
		                          <div class="yeps_message_page_link_option">
		                             <c:choose>
		                                 <c:when test="${num == map.yepsPager.curPage}">
		                                     <span class="yeps_message_page_option_action">
		                                          ${num}
		                                     </span>
		                                 </c:when>
		                              <c:otherwise>
		                                      <a href="javascript:list('${num}','${map.lMode}')" class="yeps_message_page_option_link_action">
		                                          ${num}
		                                      </a>
		                                  </c:otherwise>
		                              </c:choose>
		                           </div>
		                        </c:forEach>
		                    <c:if test="${map.yepsPager.curBlock <= map.yepsPager.totBlock}">
		                         <div class="yeps_message_next_block">
		                              <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.nextPage}','${map.lMode}')">
		                                   <span>Next</span>
		                                   <span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
		                                       <svg class="icon_svg">
		                                           <path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
		                                       </svg>
		                                   </span>
		                               </a>
		                           </div>
		                       </c:if>
		                   <c:if test="${map.yepsPager.curPage <= map.yepsPager.totPage}">
		                       <div class="yeps_message_next_block">
		                           <a class="yeps_message_next_block_action" href="javascript:list('${map.yepsPager.totPage}','${map.lMode}')">
		                                <span>End</span>
		                                </a>
		                             </div>
		                          </c:if>
		                       </div>
		                   </div>
		               </c:if>
		            </div>
		        </div>
		    </div>
        </div>
    </div>
<script>
	
	function list(page,lMode){
	        location.href="yeps_message?curPage=" + page + "&lMode=" + lMode;
	    }
    
    function messageForm(sender){
    	$('#sendformTo').empty();
    	var sender = sender;
    	$('#sendformTo').val(sender);
    }
    
    function getMessage(sender,subject,message,msgnum){
   	 var msgnum = msgnum;
   	 var sender = sender;
   	 var subject = subject;
   	 var message = message;
   	 $('#readCheck').val(msgnum) 
   	 $('#from').val(sender);
     $('#subject').val(subject);
     $('#message').val(message);
   }   

	 jQuery.noConflict();
	 
	 $('#sendIssue').click(function(){
// 		  if($('#sendformSubject').val()==''){
// 	    	alert("제목을 입력해주세요");
// 	    	$('#sendformSubject').focus()
// 	    	return false;
	    	
// 	    	}else if($('#sendformMessage').val()==''){
// 	    	alert("내용을 입력해주세요");
// 	    	$('#sendformMessage').focus()
// 	    	return false; 
		    	
		 var issue = $('#issueValue').val();
	 	    document.sendIssueform.action = "message_send?issue=" + issue;
	 	    document.sendIssueform.submit();
	 })
	
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
	
	function searching() {
		var value1 = $("select[name=filter]").val();
		if (value1 == 0) {
			alert("검색키를 선택하세요.");
			lockerform.filter.focus()
			return false
		}
		document.lockerform.action = "message_action";
		document.lockerform.submit();
	}

	function readMessage(lMode) {
		document.lockerform.action = "message_read?lMode=" + lMode;
		document.lockerform.submit();
	}
	
	function readCheck(lMode){
    	var msgnum = $('#readCheck').val();
    	var url = "message_read?msgnum=" + msgnum + "&lMode=" + lMode ;
        window.location = url;
    }

	function lockerToMsgBox() {
		$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
			for (var i = 0; i < checkVal.length; i++) {
				if (checkVal[i].checked) {
					txt += checkVal[i].value + " ";
				}
			}
			document.lockerform.action = "message_lockerToMsgBox";
			document.lockerform.submit();
		});
	}

	function deleteCheckMsg() {
		$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			alert(checkVal);
			for (var i = 0; i < checkVal.length; i++) {
				if (checkVal[i].checked) {
					txt += checkVal[i].value + " ";
				}
			}
		});
		document.lockerform.action = "message_delete?box=locker";
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
				} else {
					$(this).parent().parent().removeClass("selected");
				}
			});
		});
	
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
             e.preventDefault();
             e.stopPropagation();
         });
     });
	</script>
<%@ include file="../bottom.jsp"%>

