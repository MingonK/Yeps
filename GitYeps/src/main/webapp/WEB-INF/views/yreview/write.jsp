<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
	<title>Ÿ��Ʋ�� �Է����ּ���.</title>
</head>
<body>
	<h3>Write a Review</h3> 
	<hr>
		�Ĵ��̹��� + ����,��ġ��� ���� �����ͼ� ����ִ°� <br>
		<h4>Your review</h4><a href="">Read our review guidelines</a><br>
		<form name="f" action="yreview_insert" method="post">
		<textarea onclick="this.value='';" name="content" rows="13" cols="50">
			input content~! 
		</textarea><p>
		<input type="submit" value="Sign Up and Post">
		<input type="reset" value="Cancel"><p>
			*You can always edit or remove reviews later.
	</form>
</body>
</html>