<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%>
<html>
<head>
<title>eventContent</title>
</head>
<body>
	<div align="center">
		<form name="eventContentform" action="event_update" method="post">
			<input type="hidden" name="evnum" value="${event.evnum}">
			<hr width="70%" color="blue" size="2">
			<h2>이벤트 보기</h2>
			<hr width="70%" color="blue" size="2"><br>
			<br>
			<table border="1" width="80%" align="center">
				<tr>
					<th width="20%" bgcolor="green">번호</th>
					<td>${event.evnum}</td>
					<th width="20%" bgcolor="green">제목</th>
					<td>${event.title}SUBJECT</td>
				</tr>
				<tr>
					<th width="20%" bgcolor="green">이벤트 기간</th>
					<td>${event.periode1}~${event.periode2}</td>
					<th width="20%" bgcolor="green">이벤트 장소</th>
					<td>${event.place}PLACE</td>
				</tr>
				<tr>
				<th width="20%" bgcolor="green">할인가격</th>
				<td>${event.discount}</td>
				<th width="20%" bgcolor="green">작성일자</th>
				<td>${event.reg_date}REG_DATE</td>
				</tr>
				<tr>
			<%-- 	<td colspan="4" height="400"><input type="image" src="${uploadPath}"> --%>
				</td></tr>
				<tr>
					<th colspan="4" bgcolor="green">이벤트 내용</th>
				</tr>
				<tr>
					<td colspan="4"><textarea style="width: 100%" rows="10">${event.content}</textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="4"><input type="submit" value="수정">
						<input type="button" value="삭제"
						onclick="window.location='event_delete?evnum=${event.evnum}'">
						<input type="reset" value="취소"><input type="button"
						value="이벤트목록" onclick="window.location='event_list'"></td>
				</tr>
			</table>
		</form>
		<%@ include file="../bottom.jsp"%>
	</div>
</body>
</html>