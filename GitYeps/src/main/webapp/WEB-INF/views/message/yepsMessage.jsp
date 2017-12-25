<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Yeps Message</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${msg}")
	</script>
</c:if> 
</head>
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
<div class="popup" align="left" id="writeMessage" data-popup="writeMessage"  style="z-index: 1;">
    <form name="sendform" method="post">
	    <div class="popup-inner">
	        <h4 align="left"  style="color: #d32323;">Send Message To</h4><br>
	            <input type="text" id="sendformTo" name="receiver"><br>
	        <h4 align="left" style="color: #d32323;">Subject is</h4><br>
	            <input type="text" name="title" id="sendformSubject" ><br>
	        <h4 align="left" style="color: #d32323;">Content is</h4><br>
	            <textarea rows="4" name="content" id="sendformMessage"  placeholder="여기에 메시지를 입력하세요."></textarea><br><br>
	                <button class="popup-send" id="sendMessage" type="button" data-popup-send="SendMessage" onclick="sendMessage()">SendMessage </button>
			        <a data-popup-close="writeMessage" style="cursor:pointer;" href="#">  Close</a>
					<a class="popup-close" data-popup-close="writeMessage" href="#" >X</a>
	    </div>
	</form>
</div> 
	<!-- Message View  -->
        <div class="popup" align="left" id="popup" data-popup="popup-1" style="z-index: 1;">
		    <div class="popup-inner">
			  <h4 align="left"  style="color: #d32323;">Message From</h4><br>
			     <input type="text" id="from" readOnly>
			  <h4 align="left"  style="color: #d32323;">Subject is</h4><br>
			     <input type="text" id="subject" readOnly>
			  <h4 align="left"  style="color: #d32323;">Content is</h4><br>
			     <textarea id="message" rows="4" readOnly></textarea><br><br>
			        <button class="popup-reply" id="replyMessage" type="button" data-popup-close="popup-1" data-popup-open="writeMessage" style="cursor:pointer;">reply </button>
			           <a data-popup-close="popup-1" href="#" style="cursor:pointer;" onclick="readCheck('${map.lMode}');">Close</a>
				           <input type="hidden" id="readCheck" > <input type="hidden" id="pageMode">
				           <button class="popup-delete" id="deleteMessage" type="button" data-popup-close="popup-1" style="cursor:pointer;" onclick="deleteMsg('${map.lMode}');">delete </button>&nbsp;
				       <a class="popup-close" style="cursor:pointer;" data-popup-close="popup-1" href="#" onclick="readCheck('${map.lMode}');">x</a>
		       </div>
	      </div> 
	          <div id="messageContainer"  >
	              <div id="messageHeader"  >
		              <label> Messages</label>
				          <input type="button" id="write" value="Write New Message" data-popup-open="writeMessage" onclick="messageForm();">
		          </div>
		      <div id="menu" >
	             <a href="message_action?filter=msgBoxList"><label style="cursor:pointer;">InBox </label></a><label>  :  ${mCount} </label>
			     <a href="message_action?filter=sender"><label style="cursor:pointer;"> Sent </label></a><label>  :  ${sCount} </label>
			     <a href="message_action?filter=allLocker"><label style="cursor:pointer;"> locker  </label></a><label>  :  ${lCount} </label>
			   
			     <c:choose>
			         <c:when test="${ key eq 'almighty' }">
			             <label style="float:right;">  :  ${aCount} </label><a href="message_alert"><label style="cursor:pointer; float:right;">alertBox</label></a>
			             </c:when>
			         <c:otherwise>
			             <label style="float:right; color: #blue; font-size: 14px; font-family: cambria;"><span style="color:#ff00ff">오늘도 행복한 하루 되세요.</span>  </label>
			         </c:otherwise>
			      </c:choose>
			  </div>
		  <div id="messageList"  style="position:absolute; " >
	         <form name="msgform" method="post" >
				  <table  id="table" style="width: 100%;">
					   <tr>
						   <th align="left" colspan="7 " style="left: 120px; border-bottom: 1px solid #e6e6e6; height: 40px; padding:10px;" >
						   <input type="button" style="cursor:pointer;" name="delete" id="delete" value="delete"  onclick="deleteCheckMsg('${map.lMode}');"> 
						<!-- 	<button type="button" style="cursor:pointer;" id="reply"  >reply</button> -->
						   <input type="button"style="cursor:pointer;"  name="locker" id="locker" value="locker" onclick="moveToLocker();"> 
						   <select  id="select" name="filter" >
									<option value="0"></option>
									<option value="allMsg">모든 쪽지</option>
									<option value="readMsg">읽은 쪽지</option>
									<option value="noneMsg">안읽은 쪽지</option>
									<option value="allLocker">보관함</option>
							</select> 
						    <input type="button" id="search" style="cursor: pointer;" value="select" onclick="searching();">
						    <input type="button" id="issue" style="cursor: pointer; color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; 
	                        font-family: cambria; float: right;" data-popup-open="writeIssue" value="issue" > <br> 
						   
					        </tr>
	                        <tr align="center" >
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
							<tr><td colspan="7" style=" border-bottom: 1px solid #e6e6e6;"> </td></tr> 
						        <c:if test="${empty map.list}">
					        <tr >
							    <c:choose>
								    <c:when test="${mode eq 'send' or mode eq ''}">
									    <td colspan="6" align="center" height="60px">보낸 쪽지가 없습니다.</td>
								    </c:when>
								    <c:when test="${mode eq 'receive'}">
									    <td colspan="6" align="center" height="60px">받은 쪽지가 없습니다.</td>
								    </c:when>
							   </c:choose>
							   
						    </tr>
					            </c:if> 
					        <c:forEach var="dto" items="${map.list}">
					            <input type="hidden" id="readVal" value="readVal">
					        <tr align="center" id="list">
							    <td><input type="checkbox" style="cursor:pointer;" name="check" value="${dto.msgNum}"></td>
							    <td><c:choose>
									    <c:when test="${dto.readNum == 1}">
											<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}" style="cursor:pointer;" onclick="readMessage('${map.lMode}');"></label>
									    </c:when>
									    <c:when test="${dto.readNum == 0}">
											<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}" style="cursor:pointer;" onclick="readMessage('${map.lMode}');"></label>
									    </c:when>
								    </c:choose></td>
							    <td style="font-weight: bold;" >	
								    <c:set var="num" value="${num-1}"/>
					                <c:out value="${num}"/></td>
							    <td><a class="btn" data-popup-open="writeMessage" id="sender" name="sender" onclick="messageForm('${dto.sender}')">${dto.sender}</a>
							    <td><a class="btn" data-popup-open="popup-1" onclick="getMessage('${dto.sender}','${dto.title}','${dto.content }','${dto.msgNum}','${map.lMode}');">${dto.title}</a></td>
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
	                     <!--  페이징 처리!! 현재페이지는 span이 되고 나머지는 a로    -->
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
	
//     (ReadCheck = function(lMode) {
//      var msgnum = $('#readCheck').val();
//      var url = "message_read?msgnum=" + msgnum + "&lMode=" + lMode ;
//         $.ajax({
//            url: url,
//            method: 'post',
//            data: data,
//            dataType: 'json',
//            processData: false,
//            contentType: false,
//            success: function(responseData) {
//               if(responseData.failed) {
//                  alert("잠시후 다시 시도해주세요.");
//                  return false;
//               }
              
//               $('#result_photo_status_text').hide();
//               $('#sucess_file_upload_header').show();
//               $('#user_photo_edit_cotainer').show();
//               $('#filenum').val(responseData.filenum);
//               $('#photoname').val(responseData.filename);
//               var url = "getImage/" + responseData.filename;
//               $('#photo_box_img').attr('src', url);
//            }
//         });
//      });
//      F_FileMultiUpload(files[0], objDragAndDrop);
	
	
	$('#issue').click(function(){
		$('#sendIssueSubject').val('Issue : ');
	}) 
	
 	$('#sendIssue').click(function(){
 	    var issue = $('#issueValue').val();
 	    document.sendIssueform.action = "message_send?issue=" + issue;
 	    document.sendIssueform.submit();
	});
	
    function list(page,lMode){
        location.href="yeps_message?curPage=" + page + "&lMode=" + lMode;
    }
    
    function messageForm(sender){
    	$('#sendformTo').empty();
    	var sender = sender;
    	$('#sendformTo').val(sender);
    }
    
    function getMessage(sender,subject,message,msgnum,lmode){
    	 var msgnum = msgnum;
    	 var sender = sender;
    	 var subject = subject;
    	 var message = message;
    	 var lmode = lmode;
    	 $('#pageMode').val(lmode)
    	 $('#readCheck').val(msgnum) 
    	 $('#from').val(sender);
         $('#subject').val(subject);
         $('#message').val(message);
    }   

   $('#sendMessage').click(function(){
    	
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
    });
    
    function searching(){
	   var selectValue = $("select[name=filter]").val();
	    if(selectValue ==0){
	    	alert("검색키를 선택하세요.");
	        msgform.filter.focus()
	        return false
	    }
	    document.msgform.action = "message_action";
	    document.msgform.submit();
    }
    
    function readMessage(lMode){
        document.msgform.action = "message_read?lMode=" + lMode;
    	document.msgform.submit();
    }
    
    function readCheck(){
    	var lMode = $('#pageMode').val();
    	var msgnum = $('#readCheck').val();
    	alert(lMode)
    	alert(msgnum)
    	var url = "message_read?msgnum=" + msgnum + "&lMode=" + lMode ;
        window.location = url;
    }
    
    function deleteMsg(lMode){
    	var msgnum = $('#readCheck').val();
    	var lMode = lMode;
    	var url = "message_delete?msgNum=" + msgnum + "&lMode=" + lMode;
        window.location = url;
    }
	  
    function deleteCheckMsg(lMode) {
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			var lMode = lMode;
	    for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_delete?lMode="+ lMode;
    	document.msgform.submit();
		}
    
    function moveToLocker(){
    	$("input[name=check]:checked").each(function() {
			var checkVal = $(this).val();
			
		for (var i = 0; i < checkVal.length; i++) {
		         if (checkVal[i].checked) {
		            txt += checkVal[i].value + " ";
	    }}});
    	document.msgform.action = "message_moveToLocker";
    	document.msgform.submit();
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
              e.preventDefault();
              e.stopPropagation();
          });
      });
    
</script>
<%@ include file="../bottom.jsp"%>
