<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<title>Yeps Message</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
		<br>
        <div class="btn group" align="left">
		<button class="btn btn-default" data-target="#sendform" data-toggle="modal" id="write"
		style="width:120px; height: 40px; border-radius: 7px; color: #ffffff; background: #d32323;font-weight: bold; font-family: consolas; font-size:17px;">쪽지쓰기</button>
		<button class="btn btn-default" data-target="#sendform" data-toggle="modal" id="writeToMe"
		style="width:120px; height: 40px; border-radius: 7px; color: #ffffff; background: #d32323;font-weight: bold; font-family: consolas; font-size:17px;">내게쓰기</button>
        </div><br><br>
			<div align="center" id="tag">
				<a href="message_move?filter2=receive"><label>받은 쪽지 </label></a><a href="#"><label>:: ${count}</label></a><br> <br> 
				<a href="message_move?filter2=send"><label>보낸 쪽지 </label></a><a href="#"><label>:: ${sCount}</label></a><br> <br> 
				<a href="message_move?filter2=locker"><label>쪽지보관함 </label></a><a href="#"><label>:: ${lCount}</label></a><br> <br> 
				<a href="message_move?filter2=trash"><label>휴지통 </label></a><a href="#"><label>:: ${0}</label></a><br> <br> 
			</div>
		</div>
		
		<div id="messageList"  align="left" style="height: 70%; width: 75%; float: left;  padding:1;">
			<form name="msgform" id="msgform" method="post">
			 <div class="modal fade" id="sendform" >
               <div class="modal-dialog">
                  <div class="modal-content">
                   <!-- header -->
                   <div class="modal-header">
                     <!-- 닫기(x) 버튼 -->
                     <button type="button" class="close" data-dismiss="modal">×</button>
                     <!-- header title -->
                     <h3 class="modal-title" align="left">To</h3>
                     <input type="text" style="width: 100%; height: 40; border-radius: 7px; font-family: consolas;" name="receiver" id="receiver">    
                   </div>
                   <!-- body -->
                   <div class="modal-body">
                       <h3 align="left">Subject</h3>
                       <input type="text" style="width: 100%; height: 40; border-radius: 7px; font-family: consolas;" name="title" id="title"> 
                   </div>
                   <!-- Footer -->
                   <div class="modal-footer" align="left">
                    <h3 align="left" style="font-weitht: bold;">Message</h3>
                    <textarea style="width: 100%; border-radius: 7px; font-size:16px;" cols="100%"
									rows="5" name="content" id="content" placeholder=" 여기에 내용을 입력하세요."></textarea>
								<br><br>
				    <button type="button" class="btn btn-danger" onclick="check()">SendMessage</button>
				     <button type="reset" name="cancel" value="cancel" style="background: #00ff0000; border: 0;">cancel</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                   </div>
                  </div>
                 </div>
                </div>
                <div class="modal fade" id="messageView" >
               <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header" >
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3 style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;" >from</h3>
					<h4 style="font-family: consolas; font-weight: bold; font-size: 23px;" >${getContent.sender}</h4><br><br>
					<h3 style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;">open time</h3>
					<h4 style="font-family: consolas; font-weight: bold; font-size: 23px;" >${getContent.readDate}</h4><br>
                    </div>
                  <div class="modal-body">
                   <h3 style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;" >subject</h3><br>
                   <h4 style="font-family: consolas; font-weight: bold; font-size: 23px;">${getContent.title}</h4>   
                   </div>
                   <div class="modal-footer">
                    <h3 align="left" style="font-weitht: bold; font-size: 26px; font-family: consolas;">Message</h3>
                    <textarea style="width: 100%; border-radius: 9px; font-weitht: bold; font-size: 20px; color:000000; font-family: consolas;" 
                    cols="100%" rows="6" name="content"  disabled >여기로 내용을 불러온다.</textarea><br><br>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" style="background: #00ff0000; border: 0; color:000000;">close</button>
                   </div>
                  </div>
                 </div>
                </div>
				<table border="0" id="table">
					<tr valign="middle">
						<td width="60px" align="center" rowspan="3" valign="middle"> 
						<input type="checkbox" name="first"></td>
						<th align="left" colspan="6">
						<input type="button" name="del" value="삭제" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(1);"> 
						<button type="button" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="msgformSubmit(2)">답장</button>
						<input type="button" name="locker" value="보관" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="moveToLocker();"> 
						<select name="filter" style="border-radius: 4px;">
								<option value="0">:: 필터 ::</option>
								<option value="allMsg">모든 쪽지</option>
								<option value="noneMsg">안읽은 쪽지</option>
						</select> 
						<input type="button" id="search" value="검색" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="searching();"> 
						<select name="filter2" style="border-radius: 4px;">
								<option value="0">:: 필터 ::</option>
								<option value="locker">보관함</option>
								<option value="trash">휴지통</option>
						</select> 
						<input type="button" id="move" value="이동" style="color: #ffffff; background: #d32323; border-radius: 5px; font-weight: bold; font-family: consolas;" onclick="moving();"></th>
				</tr>
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
						
					<br></tr>
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
				            <!--  보낸이 클릭시 답장 보낼 수 있도록 창 열리며 받는이에  바로 보낸이 추가 . 
				                                    원래 a태그 사용하였으나  부트스트랩 적용을 용이하게 하기위해 부트스트랩 버튼 형식으로 바꿈. 
				                  'title' 클릭시 내용바로 보기 부트스트랩 이용하여 구현하기 위해 역시 버튼 형식 적용 -->
						    <td><button type="button" name="sender" value="${dto.sender}" class="btn btn-default" data-target="#sendform" data-toggle="modal" 
						    style="background: #00ff0000; border: 0; font-weight: bold; font-family: consolas; color:#0073bb; font-size:17px;" >${dto.sender}</button>
						    <td><button type="button" name="title" value="${dto.msgNum}" class="btn btn-default" data-target="#messageView" data-toggle="modal" 
						    style="background: #00ff0000; border: 0; font-weight: bold; font-family: consolas; color:#0073bb; font-size:17px;" >${dto.title}</button></td>
							<td><label>${dto.reg_date}</label></td>
							
						</tr>
					</c:forEach>
					<tr>
					<td colspan="7" align="center">
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">  [${num}]  </span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">  [${num}] </a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
               <%--  <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if> --%>
				   </td></tr>
                  </table>
				<br>
			</form>
		</div>
		<br>
	</div>
	<script>
	
    function list(page){
        location.href="yeps_message?curPage=" + page;
    }

   /*  function windowOpen(){
        document.msgform.action = "message_send";
        document.msgform.submit();
    } */
    
    function reply(){
    	document.msgform.action = "message_reply";
    	document.msgform.submit();
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
    	var msgNum = $("input[name=readed]").val();
    	document.msgform.action = "message_read";
    	document.msgform.submit();
    }
	  
    function msgformSubmit(index) {
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
    	
    	if(index == 1){
	         document.msgform.action = "message_delete";
		}
		if(index == 2){
			document.msgform.action = "message_reply";
			/* $("#sendform").modal(); */
		}
		document.msgform.submit();
    }
    
    $(document).ready(function(){
        $("#reply").click(function(){
            $("#sendform").modal();
        });
    });
    
    function check(){
		
		if (("#sendform #receiver").value()==""){
			alert("받는 사람을 입력하세요")
			("#reciever").focus()
			return
		}
		
		if ($("input[name=title]").val()==""){
			alert("제목을 입력하세요")
			("#title").focus()
			return
		}
		if ((".modal-footer #content").val()==""){
			alert("내용을 입력하세요")
			("#content").focus()
			return
		}
		 document.msgform.action = "message_send?mode=send";
		 document.msgform.submit();
		 self.close();
	    };

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
<%@ include file="../bottom.jsp"%>
