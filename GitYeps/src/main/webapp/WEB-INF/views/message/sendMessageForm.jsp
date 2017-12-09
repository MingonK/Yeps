<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty requestScope.msg}">
	<script type="text/javascript">
		alert("${requestScope.msg}")
	</script>
</c:if>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<html>
<head>
<title>send MessageForm</title>
</head>
<body>

<%--  부트스트랩 코드 아직 미적용 <div class="modal fade" id="layerpop">
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
				</div> --%>
<div align="center">
		<h3 align="left" style="color:#d32323; font-family:consolas; font-size:20;">New Message</h3>
	
		 <form name="sendform" method="post" >
			<table border="0" width="90%" height="300">
				<tr>
				<th width="100%" height="1" align="left" style="color:#d32323; font-family:consolas; font-size:17;"><label>To</label></th>
				</tr>
				<tr>
				<td><input type="text" name="receiver"  id="receiver" style="width: 100%; height:30; border-radius:7px;" value="${receiver }"></td>
				</tr>
				<tr>
					<th width="100%" height="10" align="left" style="color:#d32323; font-family:consolas; font-size:17;">Subject</th></tr>
					<tr>
					<td ><input type="text" name="title"style="width: 100%; height:30; border-radius:7px;"></td>
				</tr>
				<tr>
					<th width="100%" height="10" align="left" style="color:#d32323; font-family:consolas; font-size:17;">Message</th>
				</tr>
				<tr>
					<td  width="100%" height="50%">
					<textarea style="width: 100%; border-radius:7px;" cols="100%" rows="10" name="content" placeholder="           
    여기에 내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<td  align="left">
					<input type="button" style="width:120; height:40; background:#d32323; color:#ffffff; font:20; font-size:15; font-weith:bold; border-radius:9px;" value="SendMessage" onclick="javascript:check();"> 
					<input type="reset" name="cancel" value="cancel" style="background:#00ff0000; border:0;"> 
				</table>
		</form>
	</div> 
	<script>

    function check(){
		
		if (sendform.receiver.value==""){
			alert("받는 사람을 입력하세요")
			sendform.receiver.focus()
			return
		}
		
		if (sendform.title.value==""){
			alert("제목을 입력하세요")
			sendform.title.focus()
			return
		}
		if (sendform.content.value==""){
			alert("내용을 입력하세요")
			sendform.content.focus()
			return
		}
		 document.sendform.target = "message_form";
		 document.sendform.action = "message_send?mode=send";
		 document.sendform.submit();
		 self.close();
	    };
	
</script>
</body>
</html>