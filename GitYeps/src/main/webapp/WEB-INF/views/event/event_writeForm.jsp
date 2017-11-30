<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<title>이벤트 등록 - yeps</title>
	<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	<script>
		$(function() {
			$("#datepicker").datepicker({
				minDate: 0,
				changeMonth: true,
				changeYear: true
			});
		});
		$(function () {
			$()
		})
	</script>
	<script type="text/javascript">
		function jusoPop() {
			var pop = window.open("event_jusoPopup","pop","width=300, height=300, scrollbars=yes, resizable=no");
		}
		function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, zipNo) {
			document.event_register.storeaddress.value = zipNo + roadAddrPart1 + addrDetail + roadAddrPart2
		}
	</script>
	<script type="text/javascript">
		function add_end_time() {
			var str = "";
			str += "<div style='float: left;'>";
			str += "to";
			str += "<input type='text' name='end_date' id='datepicker' onclick='" + "'" + "style='width: 150px; padding-left: 5px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px; vertical-align: middle;'>";
			str += "</div>";
			str += "<div style='float: left; margin-left: 5px;'>";
			str += "<select style='width: 90px; margin: 0; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;'>";
			str += "<option value='0.0'>오전 12:00</option>";
			str += "<option value='0.5'>오전 12:30</option>";
			str += "<option value='1.0'>오전 1:00</option>";
			str += "<option value='1.5'>오전 1:30</option>";
			str += "<option value='2.0'>오전 2:00</option>";
			str += "<option value='2.5'>오전 2:30</option>";
			str += "<option value='3.0'>오전 3:00</option>";
			str += "<option value='3.5'>오전 3:30</option>";
			str += "<option value='4.0'>오전 4:00</option>";
			str += "<option value='4.5'>오전 4:30</option>";
			str += "<option value='5.0'>오전 5:00</option>";
			str += "<option value='5.5'>오전 5:30</option>";
			str += "<option value='6.0'>오전 6:00</option>";
			str += "<option value='6.5'>오전 6:30</option>";
			str += "<option value='7.0' selected>오전 7:00</option>";
			str += "<option value='7.5'>오전 7:30</option>";
			str += "<option value='8.0'>오전 8:00</option>";
			str += "<option value='8.5'>오전 8:30</option>";
			str += "<option value='9.0'>오전 9:00</option>";
			str += "<option value='9.5'>오전 9:30</option>";
			str += "<option value='10.0'>오전 10:00</option>";
			str += "<option value='10.5'>오전 10:30</option>";
			str += "<option value='11.0'>오전 11:00</option>";
			str += "<option value='11.5'>오전 11:30</option>";
			str += "<option value='12.0'>오후 12:00</option>";
			str += "<option value='12.5'>오후 12:30</option>";
			str += "<option value='13.0'>오후 1:00</option>";
			str += "<option value='13.5'>오후 1:30</option>";
			str += "<option value='14.0'>오후 2:00</option>";
			str += "<option value='14.5'>오후 2:30</option>";
			str += "<option value='15.0'>오후 3:00</option>";
			str += "<option value='15.5'>오후 3:30</option>";
			str += "<option value='16.0'>오후 4:00</option>";
			str += "<option value='16.5'>오후 4:30</option>";
			str += "<option value='17.0'>오후 5:00</option>";
			str += "<option value='17.5'>오후 5:30</option>";
			str += "<option value='18.0'>오후 6:00</option>";
			str += "<option value='18.5'>오후 6:30</option>";
			str += "<option value='19.0'>오후 7:00</option>";
			str += "<option value='19.5'>오후 7:30</option>";
			str += "<option value='20.0'>오후 8:00</option>";
			str += "<option value='20.5'>오후 8:30</option>";
			str += "<option value='21.0'>오후 9:00</option>";
			str += "<option value='21.5'>오후 9:30</option>";
			str += "<option value='22.0'>오후 10:00</option>";
			str += "<option value='22.5'>오후 10:30</option>";
			str += "<option value='23.0'>오후 11:00</option>";
			str += "<option value='23.5'>오후 11:30</option>";
			str += "</select>";
			document.getElementById("addEndTime").innerHTML = str;
			document.getElementById("endtime").innerText = "마감일 삭제";
		}
	</script>
</head>
<body>
	<div id="super-container">
		<div id="Eventcontainer">
			<ul>
				<li class="return_event">
					<a href="event_list">Return to Events</a>
				</li>
			</ul>
			<div id="header">
				<h2>이벤트 등록</h2>
			</div>
			<div width="100%">
			<form name="event_register" method="post" action="event_insert">
				<div id="body">
					<label>이벤트 명칭</label><br>
					<input type="text" name="eventname" maxlength="128" style="width: 100%; border: 1px solid #999; border-radius: 3px; height: 30px; padding: 10px; font-size: 14px; margin: 5px 0 18px;">
					<label>기간</label>
					<div style="margin: 6px 0 18px; width: 100%; height: 30px;/* border: 1px solid red;  */display: block; vertical-align: middle;">
						 <!-- Start Event Periode -->
						 <div style="width: 42%; float: left; /* border: 1px solid gray; */">
						 	<div style="float: left; margin-right: 5px;">
								<input type="text" name="start_date" id="datepicker" onclick="value=''"
								style="width: 150px; padding-left: 5px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px; vertical-align: middle;">
							</div>
							<div style="float: left;">
								<select
								style="width: 90px; margin: 0; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;">
									<option value="0.0">오전 12:00</option>
									<option value="0.5">오전 12:30</option>
									<option value="1.0">오전 1:00</option>
									<option value="1.5">오전 1:30</option>
									<option value="2.0">오전 2:00</option>
									<option value="2.5">오전 2:30</option>
									<option value="3.0">오전 3:00</option>
									<option value="3.5">오전 3:30</option>
									<option value="4.0">오전 4:00</option>
									<option value="4.5">오전 4:30</option>
									<option value="5.0">오전 5:00</option>
									<option value="5.5">오전 5:30</option>
									<option value="6.0">오전 6:00</option>
									<option value="6.5">오전 6:30</option>
									<option value="7.0" selected>오전 7:00</option>
									<option value="7.5">오전 7:30</option>
									<option value="8.0">오전 8:00</option>
									<option value="8.5">오전 8:30</option>
									<option value="9.0">오전 9:00</option>
									<option value="9.5">오전 9:30</option>
									<option value="10.0">오전 10:00</option>
									<option value="10.5">오전 10:30</option>
									<option value="11.0">오전 11:00</option>
									<option value="11.5">오전 11:30</option>
									<option value="12.0">오후 12:00</option>
									<option value="12.5">오후 12:30</option>
									<option value="13.0">오후 1:00</option>
									<option value="13.5">오후 1:30</option>
									<option value="14.0">오후 2:00</option>
									<option value="14.5">오후 2:30</option>
									<option value="15.0">오후 3:00</option>
									<option value="15.5">오후 3:30</option>
									<option value="16.0">오후 4:00</option>
									<option value="16.5">오후 4:30</option>
									<option value="17.0">오후 5:00</option>
									<option value="17.5">오후 5:30</option>
									<option value="18.0">오후 6:00</option>
									<option value="18.5">오후 6:30</option>
									<option value="19.0">오후 7:00</option>
									<option value="19.5">오후 7:30</option>
									<option value="20.0">오후 8:00</option>
									<option value="20.5">오후 8:30</option>
									<option value="21.0">오후 9:00</option>
									<option value="21.5">오후 9:30</option>
									<option value="22.0">오후 10:00</option>
									<option value="22.5">오후 10:30</option>
									<option value="23.0">오후 11:00</option>
									<option value="23.5">오후 11:30</option>
								</select>
							</div>
						</div>
						<!-- End Event Periode -->
						<div id="addEndTime"style="display: inline; float: left; width: 42%; /* border: 1px solid yellow; */ vertical-align: middle;">
						</div>
						<a href="javascript:add_end_time()" id="endtime">마감일 설정</a>
					</div>


					<div style="width: 100%; border-bottom: 1px solid #e6e6e6; margin-bottom: 10px;">
						<label>매장 주소</label>
						<div style="margin: 6px 0 18px;">
							<input type="text" name="storeaddress" placeholder="주소를 입력하세요." onclick="javascript:jusoPop()"style="width: 100%; padding-left: 10px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;">
						</div>
					</div>
					
					
					<label>이벤트 내용</label>
					<div style="margin-top: 6px;">
						<textarea rows="5" cols="89" placeholder="이벤트의 내용을 상세하게 설명해주세요." style="border-radius: 3px; font-size: 14px; padding: 5px 10px 0 10px; border: 1px solid #999;"></textarea>
					</div>
					
					<div style="margin-top: 20px; margin-bottom: 20px">
						<label>할인율</label>
						<textarea rows="4" cols="89" placeholder="할인 내역을 상세하게 설명해주세요. &#10; &#10;예) 메인메뉴 30%할인, 디저트류 10%할인" style="margin-top: 6px; border-radius: 3px; font-size: 14px; padding: 5px 10px 0 10px; border: 1px solid #999;"></textarea>
					</div>
					
					<div style="margin-bottom: 18px;">
						<label>카테고리</label>
						<div style="width: 100%; margin-top: 6px;">
							<select
							style="width: 100%; margin: 0; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;">
								<c:if test="${empty categoryList}">
									<option value="cateEmpty">등록된 카테고리가 없습니다.</option>
								</c:if>
								<c:forEach var="dto" items="${categoryList}">
									<option value="${dto.cname}">${dto.cname}</option> 
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div>
						<input type="submit" value="이벤트 등록" style="width: 150px; height: 40px; margin-right: 10px;">
						<a href="event_list" style="font-size: 14px;">취소</a>
					</div>
	
				</div>
				</form>
			</div>	
		</div>			
	</div>			
<%@ include file="../bottom.jsp"%>					
					
					
					
					
					
					

