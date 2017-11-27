<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>eventContent</title>
</head>
<body>
	<div align="center">
		<form name="f" action="event_update" method="post">
			<input type="hidden" name="evnum" value="${event.evnum}">
			<hr width="70%" color="blue" size="2">
			<h2>이벤트 보기</h2>
			<hr width="70%" color="blue" size="2">
			<table border="1" width="80%" align="center">
				<tr>
					<th width="25%" bgcolor="green">번호</th>
					<td>${event.evnum}</td>
					<th width="25%" bgcolor="green">제목</th>
					<td>${event.title}</td>
				</tr>
				<tr>
					<th width="25%" bgcolor="green">이벤트 기간</th>
					<td>${event.periode1}~${event.periode2}</td>
					<th width="25%" bgcolor="green">이벤트 장소</th>
					<td>${event.place}</td>
				</tr>
				<tr>
				<th width="25%" bgcolor="green">할인가격</th>
				<td>${event.discount}</td>
				<th width="25%" bgcolor="green">작성일자</th>
				<td>${event.reg_date}</td>
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
	</div>
</body>
</html>