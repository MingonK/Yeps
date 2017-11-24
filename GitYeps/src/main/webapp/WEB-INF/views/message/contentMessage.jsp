<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>

<title>Message View</title>
</head>
<body>
	<div align="center">
	<table border="1" width="80%" align="center" height="600">
	<tr>
	<th width="20%">보낸이</th><td></td>
    <th width="20%">받은시각</th><td></td>
    <tr align="center">
    <th colspan="4">제목</th>
    </tr>
    <tr><td bgcolor="yellow" colspan="4" align="center">subject</td></tr>
    <tr align="center">
    <th colspan="4">내용</th>
    </tr>
    <tr>
    <td bgcolor="blue" height="50%" colspan="4" align="center"> content</td>
    </tr>
    
	<h2>여기는 메시지보기 입니다.!!</h2>
	</table>
		
	</div>
	<%@ include file="../bottom.jsp"%>
</body>
</html>