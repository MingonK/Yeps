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
 <!-- Latest compiled and minified CSS 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
Optional theme
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> 
Latest compiled and minified JavaScript
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<style>
.popup {
         width:100%;
          height:100%;
          display:none;
          position:fixed;
          top:0px;
          left:0px;
          background:rgba(0,0,0,0.75);
      }
    
   /* Inner */
      .popup-inner {
          max-width:700px;
          width:90%;
          padding:40px;
          position:absolute;
          top:50%;
          left:50%;
          -webkit-transform:translate(-50%, -50%);
          transform:translate(-50%, -50%);
          box-shadow:0px 2px 6px rgba(0,0,0,1);
          border-radius:3px;
          background:#fff;
      }
    
   /* Close Button */
      .popup-close {
          width:30px;
          height:30px;
          padding-top:4px;
          display:inline-block;
          position:absolute;
          top:0px;
          right:0px;
          transition:ease 0.25s all;
          -webkit-transform:translate(50%, -50%);
          transform:translate(50%, -50%);
          border-radius:1000px;
          background:rgba(0,0,0,0.8);
          font-family:Arial, Sans-Serif;
          font-size:20px;
          text-align:center;
          line-height:100%;
          color:#fff;
      }
    
      .popup-close:hover {
          -webkit-transform:translate(50%, -50%) rotate(180deg);
          transform:translate(50%, -50%) rotate(180deg);
          background:rgba(0,0,0,1);
          text-decoration:none;
      }
      </style>

<body>
<%-- <%@ include file="../top.jsp"%> --%>
   <div id="messageContainer" align="center">
		<caption>
			<h1>yeps Message</h1>
			<a class="btn" data-popup-open="popup-1" href="#">Open Popup #1</a>
		</caption>
		<hr color="green" width="70%">
		<br>
		<div id="menu" >
			<h3>Menu</h3>
		<br>
        <div class="btn group" align="center">
		<button class="btn btn-default" data-target="#sendform" data-toggle="modal" data-receiver=" " id="write">쪽지쓰기</button>
		<button class="btn btn-default" data-target="#sendform" data-toggle="modal" data-receiver="Me" id="writeToMe">내게쓰기</button>
        </div><br><br>
			<div align="center" id="tag">
				<a href="message_action?filter=receive"><label>받은 쪽지 </label></a><a href="#"><label>:: ${count}</label></a><br> <br> 
				<a href="message_action?filter=send"><label>보낸 쪽지 </label></a><a href="#"><label>:: ${sCount}</label></a><br> <br> 
				<a href="message_action?filter=toLocker"><label>쪽지보관함 </label></a><a href="#"><label>:: ${lCount}</label></a><br> <br> 
			</div>
		</div><br>
    
	    <div id="messageList"  align="left" >
		 <!--	<!--    message input 모달창     
			 <div class="modal fade" id="sendform" >
			    <div class="modal-dialog">
                  <div class="modal-content">
                  <form name="msgform" id="msgform" method="post">
                  <!-- header
                   <div class="modal-header">
                     <!--   닫기(x) 버튼    
                     <button type="button" class="close" data-dismiss="modal">×</button>
                     header title
                     <h3 class="modal-receiver" align="left">To</h3>
                     <input type="text" name="receiver" id="receiver">  
                   </div>
                   body
                   <div class="modal-body">
                       <h3 align="left">Subject</h3><br>
                       <input type="text" name="title" id="title"> 
                   </div>
                   Footer
                   <div class="modal-footer" align="left">
                    <h3 align="left">Message</h3>
                    <textarea style="width: 100%; border-radius: 7px; font-size:20px;" cols="100%"
									rows="5" name="content" id="content" placeholder=" 여기에 내용을 입력하세요."></textarea>
								<br><br>
				    <button type="button" class="btn btn-danger" onclick="sendMsg()">SendMessage</button>
				     <button type="reset" name="cancel" value="cancel" style="background: #00ff0000; border: 0;">cancel</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                   </div>
                   </form>
                  </div>
                 </div>
                </div>
              <div class="modal fade" id="messageView" >
                 <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header" >
                        <button type="button" class="close" data-dismiss="modal">×</button>
                         <h3>from</h3>
					     <label id="sender" ></label>
                      </div>
                      <div class="modal-body">
                         <h3>subject</h3><br>
                         <h4></h4>   
                      </div>
                      <div class="modal-footer">
                         <h3 align="left">Message</h3>
                         <textarea style="width: 100%; border-radius: 9px; font-weitht: bold; font-size: 22px; color:000000; font-family: consolas;" 
                           cols="100%" rows="6" name="content"  disabled >여기로 내용을 불러온다.</textarea><br><br>
                         <button type="button" id="close" class="btn btn-default" data-dismiss="modal" onclick="readCheck()">close</button>
                         <input type="hidden" id="readCheck" >
                         <button type="button" id="delete" class="btn btn-danger" data-dismiss="modal" onclick="deleteMsg()">delete</button>
                      </div>
                     </div>
                   </div>
                  </div>-->
                   <div class="popup" data-popup="popup-1">
				       <div class="popup-inner">
				       <h3 align="left">From</h3><br>
				       <label id="from">${dto.sender }</label>
				       <h3 align="left">Subject</h3><br>
				       <label id="subject">${dto.title }</label>
				       <h3 align="left">Message</h3><br><br>
				       <label id="message">${dto.content }</label>
					        <h2>Wow! This is Awesome! (Popup #1)</h2>
					        <p>Donec in volutpat nisi. In quam lectus, aliquet rhoncus cursus a, 
					        congue et arcu. Vestibulum tincidunt neque id nisi pulvinar aliquam. 
					        Nulla luctus luctus ipsum at ultricies. Nullam nec velit dui. 
					        Nullam sem eros, pulvinar sed pellentesque ac, feugiat et turpis. 
					        Donec gravida ipsum cursus massa malesuada tincidunt. 
					        Nullam finibus nunc mauris, quis semper neque ultrices in. 
					        Ut ac risus eget eros imperdiet posuere nec eu lectus.</p> 
					        <p><a data-popup-close="popup-1" href="#">Close</a></p>
					        <a class="popup-close" data-popup-close="popup-1" href="#">x</a>
				       </div>
				    </div> 
                <form name="msgform2" method="post" >
				<table border="0" id="table">
				    <tr valign="middle">
						<td width="60px" align="center" rowspan="3" valign="middle"> 
						<input type="checkbox" name="first"></td>
						<th align="left" colspan="6">
						<input type="button" name="del" id="del" value="삭제"  onclick="deleteCheckMsg();"> 
						<button type="button" id="reply"  >답장</button>
						<input type="button" name="locker" id="locker" value="보관" onclick="moveToLocker();"> 
						<select name="filter" style="border-radius: 4px;">
								<option value="0">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
								<option value="toLocker">보관함</option>
						</select> 
					    <input type="button" id="search" value="검색" onclick="searching();"> 
				  <tr><td><br></tr>
                    <tr align="center">
						<td width="60px"><label>읽음</label></td>
						<td width="60px"><label>번호</label></td>
						<td width="60px"><label>보낸이</label></td>
						<td width="450px"><label>제목</label></td>
						<c:choose>
							<c:when test="${mode eq 'send'}">
								<td width="130px"><label>보낸 시각</label></td>
							</c:when>
							<c:when test="${mode eq 'receive'}">
								<td width="130px"><label>받은 시각</label></td>
							</c:when>
						</c:choose>
					  </tr>
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
						<td><input type="checkbox" name="check" value="${dto.msgNum}"></td>
						<td><c:choose>
								<c:when test="${dto.readNum == 1}">
										<label><input type="image" src="resources/img/open.jpg" name="read" value="${dto.msgNum}" onclick="readMessage();"></label>
								</c:when>
								<c:when test="${dto.readNum == 0}">
										<label><input type="image" src="resources/img/close.jpg" name="read" value="${dto.msgNum}" onclick="readMessage();"></label>
								</c:when>
							</c:choose></td>
						<td style="font-weight: bold;" >	
							<c:set var="num" value="${num-1}"/>
				            <c:out value="${num}"/></td>
						<td><button type="button"  id="sender" name="sender" class="btn btn-default" data-target="#sendform" data-toggle="modal" data-receiver="${dto.sender}"
						    style="background: #00ff0000; border: 0; font-weight: bold; font-family: consolas; color:#0073bb; font-size:17px;" >${dto.sender}</button>
						<td> <button type="button" id="title" class="btn btn-default" data-target="#messageView" data-toggle="modal" data-content="${dto.content}" data-sender="${dto.sender}"
	                    value="${dto.title}" data-num="${dto.msgNum}" style="background: #00ff0000; border: 0; font-weight: bold; font-family: consolas; color:#0073bb; font-size:17px;"  data-popup-open="popup-1" onclick="getMessage('${dto}');">${dto.title}</button>
	                 <%--    <a class="btn" data-popup-open="popup-1" href="#">${dto.title}</a></td> --%>
					    <td><label>${dto.reg_date}</label></td>			
					</tr>
				</c:forEach>
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
                         <span style="color: red"> [${num}] </span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')"> [${num}] </a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.yepsPager.curBlock <= map.yepsPager.totBlock}">
                    <ul class="pager">
                   <li> <a href="javascript:list('${map.yepsPager.nextPage}')">Next</a></li></ul>
                </c:if>
               </td></tr>
               </table></form>
			</div><br>
	    </div>
	<script>
	
    $("#reply").click(function(){
	    document.msgform2.action = "message_reply";
	    document.msgform2.submit()
	})
	
    function list(page){
        location.href="yeps_message?curPage=" + page;
    }
    
    /* function getMessage(msgnum){
    	var msgnum = msgnum;
    	url = "message_getMsg?msgNum="+ msgnum;
    	window.location = url;
    } */

    function sendMsg(){
    	if($('#receiver').val()==''){
    	alert("받는 사람을 입력해주세요");
    	$('#receiver').focus()
    	return false;
    	
    	}else if($('#title').val()==''){
    	alert("제목를 입력해주세요");
    	$('#title').focus()
    	return false;
    	
    	}else if($('#content').val()==''){
    	alert("내용을 입력해주세요");
    	$('#content').focus()
    	return false;
    	}
        document.msgform.action = "message_send";
        document.msgform.submit();
    } 
    
    function searching(){
	   var value1 = $("select[name=filter]").val();
	    if(value1==0){
	    	alert("검색키를 선택하세요.");
	        msgform.filter.focus()
	        return false
	    }
	    document.msgform2.action = "message_action";
	    document.msgform2.submit();
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
    	document.msgform2.action = "message_moveToLocker";
    	document.msgform2.submit();
    }
    
    function readMessage(){
        document.msgform2.action = "message_read";
    	document.msgform2.submit();
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
    	document.msgform2.action = "message_delete";
    	document.msgform2.submit();
		
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
//      $('#sendform').on('show.bs.modal', function (event) {
//     	var button = $(event.relatedTarget); // Button that triggered the modal
//     	var recipient = button.data('receiver'); // Extract info from data-* attributes
//     	var modal = $(this);
//     	modal.find('.modal-header input').val("  " + recipient);
//     	});
   
//     $('#messageView').on('show.bs.modal', function (e) { 
//     	//  윈도우가 오픈할때 아래의 옵션을 적용
//         var button = $(e.relatedTarget) // 모달 윈도우를 오픈하는 버튼
//         var content = button.data('content') // 버튼에서 data-contnet 값을 content 변수에 저장
//         var sender = button.data('sender')
//         var title = button.data('title')
//         var msgNum = button.data('num')
//         var modal = $(this)
//         modal.find('.modal-footer textarea').val('Content : ' + content) // 모달위도우에서 .modal-footer에 textarea를  찾아 content 값을 넣어줌
//         modal.find('.modal-header #sender').text('  ' + sender)
//         modal.find('.modal-body h4').text(' ' + title)
//         modal.find('.modal-footer #readCheck').val(msgNum) 
       
//      }) 
     
      $(function() {
            //----- OPEN
          $('[data-popup-open]').on('click', function(e)  {
              var targeted_popup_class = jQuery(this).attr('data-popup-open');
              $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
        
              var content =$('#title').val()// 버튼에서 data-contnet 값을 content 변수에 저장
            
              alert(content)
              modal.find('#message').val('Content : ' + content)
              e.preventDefault();
          });
    
       //----- CLOSE
          $('[data-popup-close]').on('click', function(e)  {
              var targeted_popup_class = jQuery(this).attr('data-popup-close');
              $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
    
              e.preventDefault();
          });
      });
    
    
 /*  $('#messageView').modal({backdrop: 'static'});
     $("#popbutton").click(function(){*/
</script>
<%@ include file="../bottom.jsp"%>
