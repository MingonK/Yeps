<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<form name="f" method="POST" action="member_login">
			<table width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">�α���</td>
 				</tr>
				<tr>
					<td width="150" class="m3">�̸���</td>
					<td class="m3">
						<input type="text" name="email" class="box" maxlength="40">
					</td>
  				</tr>
  				<tr>
					<td width="150" class="m3">��й�ȣ</td>
					<td class="m3">
						<input type="password" name="passwd" class="box" maxlength="20">
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="member_login" value="�α���" >
						<input type="button" name="member_join" value="ȸ������" onclick="window.location='member_join'">
					</td>
  				</tr>
  				<tr>
  					<td align="center">
  						<a href="board_findEmail">
						�̸��� ã��
						</a>
  					</td>
  					<td align="center">
  						<a href="board_findpassWd">
						��й�ȣ ã��
						</a>
  					</td>
  				</tr>
  			</table>
		</form>
</body>
</html>