<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>

<html>
<head>
<title>Message View</title>
</head>
<body>
	<div id="content" align="center" style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;">
		<br>
		<form name="contentForm" action="message_delete" method="post">
			<input type="hidden" name="msgNum" value="${getContent.msgNum }">
			<table border="0" width="60%" >
				<tr>
					<td style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323; align="left" width="17%">from</td>
					<td style="font-family: consolas; font-weight: bold; font-size: 23px;" width="19%">${getContent.sender}<br></td>
					<td style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323; align="left" width="17%">open time</td>
					<td style="font-family: consolas; font-weight: bold; font-size: 23px;" width="20%">${getContent.readDate}</td>
				<tr align="center">
					<th align="left" style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;" colspan="4">subject<br></th>
				</tr>
				<tr>
					<td colspan="4" align="left" style="font-family: consolas; font-weight: bold; font-size: 23px;">${getContent.title}</td>
				</tr>
				<tr align="center">
					<th style="font-family: consolas; font-weight: bold; font-size: 26px; color: #d32323;" align="left" colspan="4">Content</th>
				</tr>
				<tr>
					<td height="40%" colspan="4" align="center">
					<textarea style="border-radius:7px;" width="100%" cols="100%" rows="5" font-size="12" readOnly> ${getContent.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="left">
					<input type="button" style="width:120; height:40; background:#d32323; color:#ffffff; font:20; font-size:17; font-weith:bold; border-radius:7px;" name="reply" value="reply" onclick="windowOpen();">
					<input type="submit" style="background:#00ff0000; border:0;" name="delete" value="delete"> 
					<input type="button" style="width:100; height:30; background:#d32323; color:#ffffff; font:20; font-size:15; font-weith:bold; border-radius:7px;" value="MsgBox" onclick="window.location='yeps_message'">
					</td>
				</tr>
			
			</table>
		</form>
	</div>
	<script>
function windowOpen(){
        var left1,top1;
            left1=(screen.width-300)/2;
            top1=(screen.height-300)/2;
        window.open("message_sendForm","addr", "left="+left1+", top="+top1+",width=600,height=400,resizable=no,scrollbars=yes");
    }
    </script>
</body>
</html>