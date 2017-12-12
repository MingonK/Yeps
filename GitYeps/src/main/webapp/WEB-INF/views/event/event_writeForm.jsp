<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
	<title>이벤트 등록 - yeps</title>
	<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
	<%@ include file="../top.jsp"%>
	<div id="super-container">
		<div id="Eventcontainer">
			<ul>
				<li>
					<a href="event_list" class="return_event">Return to Events</a>
				</li>
			</ul>
			<div id="header">
				<h2>이벤트 등록</h2>
			</div>
			<div width="100%">
			<form name="event_register" method="post" action="event_insert" onsubmit="return check()" enctype="multipart/form-data">
				<div id="body">
					<label>이벤트 명칭</label><br>
					<input type="text" name="eventname" maxlength="50" style="width: 100%; border: 1px solid #999; border-radius: 3px; height: 30px; padding: 10px; font-size: 14px; margin: 5px 0 18px;">
					
					<!-- <label>사진 선택</label>
					<div class="filebox bs3-primary preview-image" style="margin: 6px 0 18px; width: 100%; height: 30px; display: block; text-align:left;">
						<label for="input_file" id="input_file_label"style="width: 80px; color: black; display: inline-block; padding: .5em .75em; font-size: 14px; vertical-align: middle; text-align: center; cursor: pointer; border: 1px solid #999; border-radius: 3px;">사진 올리기</label>
						<input type="file" id="input_file" class="upload-hidden" style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0); border: 0;">
						<input name="filename" class="upload-name" value="선택된 파일 없음" readonly style="width: 490px; height: 30px; display: inline-block; padding: 10px; font-size: 14px; line-height: normal; vertical-align: middle; background-color: #white; border: 1px solid #999; border-radius: 3px; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
						<input type="button" value="취소" id="input_file_cancel" style="padding: .5em .75em; background-color: white; display: inline-block; font-size: 14px; vertical-align: middle; text-align: center; cursor: pointer; border: 1px solid #999; border-radius: 3px; font-weight: bold;"> 
					</div> -->
				
					<label>기간</label>
					<div style="margin: 6px 0 18px; width: 100%; height: 30px; display: block; text-align: left;">
						 <!-- Start Event Periode -->
						 <div id="start_time" style="width: 38%; float: left;">
						 	<div class="start_date" style="float: left; margin-right: 5px; vertical-align: middle;">
						 	<span class="start_icon" aria-hidden="true" style="position: relative; text-indent: -999em; cursor: pointer; vertical-align: middle;">
								<svg class="icon_svg" viewBox="0 0 18 18" style="margin: 7px 0 0 10px; diplay: block; width: 18px; height: 18px; position: absolute;">
									<path d="M13.6 16H4.4C3.077 16 2 14.88 2 13.5v-9C2 3.12 3.077 2 4.4 2H5a1 1 0 0 1 2 0h4a1 1 0 0 1 2 0h.6C14.923 2 16 3.12 16 4.5v9c0 1.38-1.077 2.5-2.4 2.5zM15 7H3v6.5c0 .828.627 1.5 1.4 1.5h9.2c.773 0 1.4-.672 1.4-1.5V7zm-5 3h3v3h-3v-3z"></path>
								</svg>
							</span>
								<input type="text" id="start_date" name="start_date"
								style="width: 150px; padding-left: 30px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px; vertical-align: middle; ">
							</div>
							<div style="float: left;">
								<select name="start_time"
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
						<div id="addEndTime"style="float: left; width: 45%;">
							<div class="to" style="display: none; float: left; margin-right: 5px; height: 30px; text-align:inherit;">
								<h4 style="margin: 0; padding: 5px;">to</h4>
							</div>
							<div class="end_date" style="display: none; float: left; margin-right: 5px; display: none;">
							<span class="end_icon" aria-hidden="true" style="position: relative; text-indent: -999em; cursor: pointer; vertical-align: middle;">
								<svg class="icon_svg" viewBox="0 0 18 18" style="margin: 7px 0 0 10px; diplay: block; width: 18px; height: 18px; position: absolute;">
									<path d="M13.6 16H4.4C3.077 16 2 14.88 2 13.5v-9C2 3.12 3.077 2 4.4 2H5a1 1 0 0 1 2 0h4a1 1 0 0 1 2 0h.6C14.923 2 16 3.12 16 4.5v9c0 1.38-1.077 2.5-2.4 2.5zM15 7H3v6.5c0 .828.627 1.5 1.4 1.5h9.2c.773 0 1.4-.672 1.4-1.5V7zm-5 3h3v3h-3v-3z"></path>
								</svg>
							</span>
								<input type="text" name="end_date" id="end_date"
								style="width: 150px; padding-left: 30px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px; vertical-align: middle;">
							</div>
							<div class="select_end_time" style="display: none; float: left; display: none;">
								<select name="end_time"
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
						<a class="endtime">마감일 등록</a>
					</div>


					<div style="width: 100%; border-bottom: 1px solid #e6e6e6; margin-bottom: 10px;">
						<label>매장 주소</label>
						<div style="margin: 6px 0 18px;">
							<input type="text" name="store_address" placeholder="주소를 입력하세요." onclick="javascript:jusoPop()"style="width: 100%; padding-left: 10px; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;">
						</div>
					</div>
					
					<label>이벤트 내용</label>
					<div style="margin-top: 6px;">
						<textarea name="content" rows="7" cols="89" maxlength="1200" placeholder="이벤트의 내용을 상세하게 설명해주세요." style="border-radius: 3px; font-size: 14px; padding: 5px 10px 0 10px; border: 1px solid #999; resize: vertical;"></textarea>
					</div>
					
					<div style="margin-top: 20px; margin-bottom: 20px">
						<label>할인율</label>
						<textarea name="discount" rows="5" cols="89" maxlength="650" placeholder="할인 내역을 상세하게 설명해주세요. &#10; &#10;예) 메인메뉴 30%할인, 디저트류 10%할인" style="margin-top: 6px; border-radius: 3px; font-size: 14px; padding: 5px 10px 0 10px; border: 1px solid #999; resize: vertical;"></textarea>
					</div>
					
					<div style="margin-bottom: 18px;">
						<label>카테고리</label>
						<div style="width: 100%; margin-top: 6px;">
							<select name="categorySet"
							style="width: 100%; margin: 0; height: 30px; border: 1px solid #999; border-radius: 3px; font-size: 14px;">
								<c:if test="${empty categoryList}">
									<option value="cateEmpty">등록된 카테고리가 없습니다.</option>
								</c:if>
								<c:forEach var="dto" items="${categoryList}">
									<option value="${dto.cname}+${dto.cnum}">${dto.cname}</option> 
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div>
						<button type="submit" id="event_send" style="box-shadow: 0 1px 1px rgba(0,0,0,0.3); cursor: pointer; border: 1px solid #8d0005; background: #d90007; width: 120px; height: 40px; margin-right: 10px; border-radius: 3px;">
							<span style="color: white; font-weight: bold; ">이벤트 등록</span>
						</button>
						<a href="event_list" style="font-size: 14px;">취소</a>
					</div>
				</div>
				</form>
			</div>	
		</div>			
	</div>
	<script>
		$(function() {
			$.datepicker.regional['ko'] = {
				closeText: '닫기',
				prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showMonthAfterYear: true,
		        showOn: 'focus',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        yearRange: 'c-0:c+30'
			};
			$.datepicker._gotoToday = function(id) { 
			    $(id).datepicker('setDate', new Date()).datepicker('hide').blur(); 
			};
			$.datepicker.setDefaults($.datepicker.regional['ko']);
			$('#start_date').datepicker();
			$('#start_date').datepicker('setDate', new Date());
			$('#start_date').datepicker("option", "maxDate", $("#end_date").val());
			$('#start_date').datepicker("option", "onClose", function (selectedDate) {
				$("#end_date").datepicker("option", "minDate", selectedDate);
			});
			
			$("#end_date").datepicker();
			$("#end_date").datepicker('setDate', new Date());
			$('#end_date').datepicker("option", "minDate", $("#start_date").val());
			$('#end_date').datepicker("option", "onClose");
			
		});
		
		$(document).on('click', '.start_icon', function(event) {
			var iconclick = $(event.target).parents('.start_date');
			var c = iconclick.children('#start_date');
			c.datepicker().datepicker('show');
		});
		$(document).on('click', '.end_icon', function(event) {
			var iconclick = $(event.target).parents('.end_date');
			var c = iconclick.children('#end_date');
			c.datepicker().datepicker('show');
		});

		
		$(document).ready(function() {
			$('.endtime').hover(function() {
				$(this).css('cursor', 'pointer');
				$(this).css('text-decoration', 'underline');
			})
			$('.endtime').mouseleave(function() {
				$(this).css('text-decoration', 'none');
			})
			$('.endtime').click(function() {
				if($(this).html() == '마감일 등록') {
					$(this).html('마감일 삭제');
				} else {
					$(this).html('마감일 등록');
				}
				$('.to').toggle();
				$('.end_date').toggle();
				$('.select_end_time').toggle();
			})

			$('#event_send').hover(function() {
				$(this).css('background-color', 'red');
			})
			$('#event_send').mouseleave(function() {
				$(this).css('background-color', '#d32323');
			})
		});
	
	</script>
	<script type="text/javascript">
		function jusoPop() {
			var pop = window.open("event_jusoPopup","pop","width=300, height=300, scrollbars=yes, resizable=no");
		}
		
		function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, zipNo) {
			document.event_register.store_address.value = zipNo + roadAddrPart1 + addrDetail + roadAddrPart2
		}
		
		function check() {
			if(event_register.eventname.value=="") {
				alert("이벤트 제목을 입력해주세요.")
				event_register.eventname.focus()
				return false
			}
			if(event_register.start_date.value=="") {
				alert("이벤트 시작일을 설정해주세요.")
				event_register.start_date.focus()
				return false
			}
			if(event_register.store_address.value=="") {
				alert("주소를 입력해주세요.")
				event_register.store_address.focus()
				return false
			}
			if(event_register.store_address.value.length >= 65) {
				alert("입력한 주소가 너무 깁니다.")
				event_register.store_address.focus()
				return false
			}
			if(event_register.content.value=="") {
				alert("이벤트 내용을 상세하게 작성해주세요.")
				event_register.content.focus()
				return false
			}
	
			var content = event_register.content.value;
			var content_len = content.length;
			var one_char = "";
			var content_byte = 0;
			for(i = 0; i < content_len; i++) {
				one_char = content.charAt(i);
				if(escape(one_char).length > 4) {
					content_byte += 2;
				} else {
					content_byte ++;
				}
			}
			if(content_byte > 4000) {
				alert("글자수를 초과할 수 없습니다.");
				return false;
			}
			if(content_byte < 60) {
				alert("이벤트 내용을 상세하게 작성해주세요.");
				return false;
			}
			
			if(event_register.discount.value=="") {
				alert("할인율을 입력해주세요.")
				event_register.discount.focus()
				return false
			}
			
			var discount = event_register.discount.value;
			var discount_len = discount.length;
			var discount_byte = 0;
			for(i = 0; i < discount_len; i++) {
				one_char = discount.charAt(i);
				if(escape(one_char).length > 4) {
					discount_byte += 2;
				} else {
					discount_byte ++;
				}
			}
			if(discount_byte > 4000) {
				alert("글자수를 초과할 수 없습니다.");
				return false;
			}
			if(discount_byte < 30) {
				alert("할인 내용을 상세하게 작성해주세요.");
				return false;
			}
			return true
		}

	</script>
<%@ include file="../bottom.jsp"%>