<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>타이틀을 입력해주세요.</title>
	
	<script type="text/javascript">
		function openwindow(){
			window.open("Guidelines","guideview","channelmode=no, directoryies=no, width=500, height=520, status=no, scrollbars=yes, location=no, toolbar=no, menubar=no, resizable=no")
		}
	</script>
	
	<style>
		#wrap {
			width: 650px;
			text-align: center;
			overflow:hidden;
		}
		
		#button {
			float: left;
			left: 10px;
		}
		
		#tag {
			float: right;
			right: 10px;
		}
	
	</style>
</head>
<body>
	<h3>Write a Review</h3> 
	<hr>
		<h1><a href="review_selectedres?rnum=${rnum}">내가 누른 사진의 식당으로 바로가기(rnum가지고가기)</a></h1> <br>
		<form name="f" action="review_insert" method="post">
		<textarea onclick="this.value='';" name="content" rows="13" cols="80">
		별점 - 별점갯수에따른 내용출력 
		Your review helps others learn about great local businesses.
		
		Plase don't review this business if you received a freebie for writing this
		review, or if you're connected in any way to the owner or employees.
		
		</textarea><p>
		<div id="wrap">
			<div id="button">
				<input type="submit" value="Post Review">
				<input type="reset" value="ContentDellete">
				<input type="button" value="ReviewList" onclick="window.location='review_list'">
			</div>
			<div id="tag">
				<a href="javascript:openwindow()">Read our review guidelines</a>
			</div>
		</div>
	</form>
</body>
</html>