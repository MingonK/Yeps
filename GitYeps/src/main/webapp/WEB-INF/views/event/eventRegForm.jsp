<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>이벤트 등록 페이지</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="70%">
		<h2>이벤트 등록하기</h2>
		<hr color="green" width="70%">
		<br>
		<form name="form" action="event_insert" method="post"
			enctype="multipart/form-data" onsubmit="return check()">
			<table border="1" width="80%" name="regTable" align="center">
				<tr>
					<th bgcolor="green">이벤트 제목</th>
					<td bgcolor="green"><input type="text"
						name="subject" style="width: 100%;"></td>
						<th bgcolor="green">할인가격</th><td><input type="text"
						name="discount" style="width: 100%;"></td> 
				</tr>
				<tr>
					<th colspan="2" bgcolor="green" >이벤트 기간</th>
					<td colspan="2" bgcolor="green"><input type="text"
						name="periode1" style="width:45%">  ~  <input type="text" name="periode2" style="width:45%"></td>
				</tr>
				<tr>
					<th bgcolor="green" width="20%">이벤트 장소</th>
					<td><input type="text" name="restaurant" style="width: 100%;"></td>
					<th bgcolor="green" width="20%">사진</th>
					<td><input type="file" name="filename" style="width: 100%;"></td>
				</tr>
				<tr>
					<th colspan="4" bgcolor="green">이벤트 내용(4000자 이내)</th>
				</tr>
				<tr>
					<td colspan="4" width="100%" align="center"><textarea
							style="width: 100%;" cols="100%" rows="10" name="content"
							placeholder="여기에 내용을 입력하세요"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="4"><label>패스워드:</label><input type="password" name="passwd">
					<input type="submit" value="등록하기"> <input type="reset" value="취소">
					<input type="button" value="목록으로" onclick="window.location='event_list'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>