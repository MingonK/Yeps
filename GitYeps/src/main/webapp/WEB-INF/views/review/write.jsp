<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>타이틀을 입력해주세요.</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/styles/style.css?ver=4"/>" />
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=3"/>"/> --%>
<script src="//code.jquery.com/jquery.min.js"></script>


<script type="text/javascript">
	var star = '${star}';
	
	$(document).ready(function() {	
		show(star)
		document.review_writeF.gradepoint.value = star;
	});

	function ContentAndGradepointCheck() {
		if (document.review_writeF.gradepoint.value == ""
				|| document.review_writeF.content.value == "") {
			alert("평점과 내용을 제대로 기입하세요!!")
			return false;
		}
		alert("식당리뷰 등록성공!!")
		return true;
	}

	function openwindow() {
		window.open("guidelines","guideview","channelmode=no, directoryies=no, width=500, height=520, status=no, scrollbars=yes, location=no, toolbar=no, menubar=no, resizable=no")
	}


	function show(gradepoint) {
		var i;
		var image;
		var el;

			for (i = 1; i <= 5; i++) {
				image = 'image' + i;
				el = document.getElementById(image);
				el.src = "resources/img/gradepoint_no_color.png";
			}

			var e = document.getElementById('gradepointText');
			var stateMsg;

			for (i = 1; i <= gradepoint; i++) {
				image = 'image' + i;
				el = document.getElementById(image);
				el.src = "resources/img/gradepoint_yes_color.png";
			}

			switch (gradepoint) {
			case '1':
				stateMsg = "Eek! Methinks not.";
				break;
			case '2':
				stateMsg = "Meh. I've experienced better.";
				break;
			case '3':
				stateMsg = "A-OK.";
				break;
			case '4':
				stateMsg = "Yay! I'm a fan.";
				break;
			case '5':
				stateMsg = "Woohoo! As good as it gets!";
				break;
			default:
				stateMsg = "";
			}
			e.innerHTML = stateMsg;
	}

	function noshow(gradepoint) {
		show(star)
		document.review_writeF.gradepoint.value = gradepoint;
		/* if (locked == 1)
			return;
		var i;
		var image;
		var el;

		for (i = 1; i <= gradepoint; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "resources/img/gradepoint_no_color.png";
		}
		
		var e = document.getElementById('gradepointText');
		e.innerHTML = ""; */
	}
	
	function mark(gradepoint) {
		star = gradepoint;
		show(star)
		document.review_writeF.gradepoint.value = gradepoint;
	}
</script>

</head>
<body>
	<%@ include file="../top.jsp"%>

	<!-- 전체 div -->
	<div class="review_write_Big_div">
		<!-- write부분 전체 div -->
		<div class="review_write_BigInner_div">

			<form name="review_writeF" action="review_insert" method="post"
				onsubmit="return ContentAndGradepointCheck()">

				<!-- 식당명 -->
				<div class="review_write_Top_div">
					<h1>
						<a href="review_selectedres?rnum=${rnum}"
							class="review_write_Rname_font">${rname}</a>
					</h1>
					<br>
				</div>

				<!-- 가운데 박스칸  -->
				<div class="review_write_Textarea_div"
					style="border: 1px solid gray;">
					<div class="review_write_Gradepoint_div">
						<span> <img id="image1" onmouseover="javascript:show('1')" onclick="javascript:mark('1')" onmouseout="javascript:noshow('1')" src="resources/img/gradepoint_no_color.png"> 
							<img id="image2" onmouseover="javascript:show('2')" onclick="javascript:mark('2')" onmouseout="javascript:noshow('2')" src="resources/img/gradepoint_no_color.png"> 
							<img id="image3" onmouseover="javascript:show('3')" onclick="javascript:mark('3')" onmouseout="javascript:noshow('3')" src="resources/img/gradepoint_no_color.png"> 
							<img id="image4" onmouseover="javascript:show('4')" onclick="javascript:mark('4')" onmouseout="javascript:noshow('4')" src="resources/img/gradepoint_no_color.png"> 
							<img id="image5" onmouseover="javascript:show('5')" onclick="javascript:mark('5')" onmouseout="javascript:noshow('5')" src="resources/img/gradepoint_no_color.png">
						</span> <span id="gradepointText">Select rating to get started</span> <input
							type="hidden" name="gradepoint">
					</div>

					<textarea name="content" rows="18" cols="82"
						style="overflow: hidden; resize: none; margin-left:10px;" placeholder="Your review helps others learn about great local businesses.&#13;&#10; Please don't review this business if you received a freebie for writing this review, or if you're connected in any way to the owner or employees."></textarea>
					<p>
				</div>


				<!-- post부분 -->
				<div class="review_write_Bottom_div">
					<div class="review_write_ButtonSet_div">
						<input class="review_write_Button" type="submit" value="Post Review"> 
						<input class="review_write_Button" type="button" value="ReviewList" onclick="window.location='review_list'">
					</div>
					<div class="review_write_Guide_div">
						<a href="javascript:openwindow()">Read our review guidelines</a>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>