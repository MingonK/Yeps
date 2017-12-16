<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>Yeps 이벤트 리스트</title>
	<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=2"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	<style>
		.event_list_main_content_wrap {
			min-width: 1020px;
		}
		
		.event_list_main_content_wrap_full {
			background: white;
		}
		
		.event_list_main_content_wrap_full .event_list_main_super_container {
			padding-top: 15px;
    		padding-bottom: 36px;
    		width: 960px;
   			margin: 0 auto;
    		padding: 0 15px;
		}
		
		.event_list_main_section_header {
			margin-bottom: 11px;
    		border-bottom: 1px solid #e6e6e6;
		}
		
		.event_list_section_header_location_bar_inner, .popular_cities {
			margin-left: -12px;
    		margin-right: -12px;
    		border-collapse: separate;
    		border-spacing: 12px 0;
    		display: table;
    		min-width: 100%;
    		table-layout: auto;
		}
		
		.event_list_section_header_location_left {
			margin-left: 6px;
    		margin-right: 6px;
    		border-collapse: collapse;
    		border-spacing: 0 0;
    		vertical-align: middle;
    		width: 100%;
    		box-sizing: border-box;
    		display: table-cell;
		}
		
		.event_list_section_header_location_left h1 {
			color: #333;
			padding-top: 0;
			word-wrap: break-word !important;
    		word-break: break-word !important;
    		overflow-wrap: break-word !important;
    		font-weight: bold;
    		margin-bottom: 6px;
    		font-size: 16px;
    		line-height: 1.3125em;
    		margin: 0 0 6px;
		}
		
		.event_list_section_header_location_bar_inner .event_list_section_header_location_nowrap,
		.popular_citie .popular_cities_left, .popular_citie .popular_cities_right {
			margin-left: 6px;
    		margin-right: 6px;
    		border-collapse: collapse;
    		border-spacing: 0 0;
    		vertical-align: middle;
    		box-sizing: border-box;
    		display: table-cell;
    		white-space: nowrap;
		}
		
		.location_city_list_toggle {
			border-left: 1px solid #ccc;
    		padding-left: 6px;
    		margin-left: -6px;
    		cursor: pointer;
		}
		
		.event_list_main_content_wrap_full a {
			color: #0073bb;
    		text-decoration: none;
		}
		
		.event_list_main_content_wrap_full a:hover {
			text-decoration: underline;
		}
		
		.location_city_list_toggle .icon:before,
		.search_different_city_button span .icon:before {
			background: none;
			content: '';
			position: absolute;
    		display: block;
    		left: 0;
		}
		
		.location_city_list_toggle .icon:after,
		.search_different_city_button span .icon:after {
			content: '';
    		display: block;
    		position: absolute;
    		left: 0;
    		right: 0;
    		top: 0;
    		bottom: 0;
		}
		
		.location_more_cities_island {
			padding: 11px;
    		background: #f5f5f5;
    		border: 1px solid #e6e6e6;
    		border-radius: 4px;
    		margin-bottom: 12px;
    		margin-top: 12px;
		}
		
		.more_cities_island_wrap {
			margin-left: -15px;
    		margin-right: -15px;
    		margin-bottom: 18px;
    		display: flex;
    		border-collapse: separate;
    		border-spacing: 30px 0;
    		min-width: 100%;
    		table-layout: auto;
		}
		
		.more_cities_island_wrap .more_cities_island_section {
			-webkit-box-flex: 1;
			flex: 1;
    		min-width: 0;
    		min-height: 0;
    		display: block;	
    		margin-left: 15px;
    		margin-right: 15px;
    		border-collapse: collapse;
    		border-spacing: 0 0;
    		box-sizing: border-box;
    		vertical-align: top;
		}
		
		.more_cities_island_wrap .more_cities_island_section h4 {
			word-wrap: break-word !important;
    		word-break: break-word !important;
    		overflow-wrap: break-word !important;
    		font-weight: bold;
    		margin-bottom: 6px;
    		font-size: 14px;
    		line-height: 1.28571em;
    		color: #333;
    		margin: 0 0 3px;
		}
		
		.more_cities_island_bottom, #search_different_location {
			display: table;
    		min-width: 100%;
    		table-layout: auto;
		}
		
		.more_cities_island_bottom .more_cities_island_bottom_left,
		.more_cities_island_bottom .more_cities_island_bottom_right {
			vertical-align: bottom;
			box-sizing: border-box;
    		display: table-cell;
		}
		
		.search_different_city {
			width: 382px;
		}
		
		.search_different_city_input_wrap {
			box-sizing: border-box;
    		display: table-cell;
    		vertical-align: top;
		}
		
		.search_different_city_button {
			position: relative;
    		left: -4px;
    		width: calc(100% + 4px);
    		border-radius: 0 3px 3px 0;
    		box-shadow: none;
    		padding: 5px 8px;
    		font-size: 12px;
    		line-height: 1.5em;
    		color: white;
    		background-color: #d90007;
    		display: inline-block;
    		vertical-align: middle;
    		margin: 0;
    		cursor: pointer;
    		border: 1px solid #8d0005;
    		font-weight: bold;
    		text-align: center;
    		user-select: none;
    		overflow: visible;
		}
	</style>
</head>
<%@ include file="../top.jsp"%>
<div class="event_list_main_content_wrap event_list_main_content_wrap_full">
	<div class="event_list_main_super_container">
		<div class="event_list_main_section_header">
			<div class="event_list_main_section_location_bar">
				<div class="event_list_section_header_location_bar_inner">
					<div class="event_list_section_header_location_left">
						<h1>현재 검색한 위치가 나타나야 함.</h1>
					</div>
					<!-- 반복문 돌면서 최대 5개 까지 출력 -->
					<div class="event_list_section_header_location_nowrap">
						<a href="#">인근 추천 지역</a>
					</div>
					<div class="event_list_section_header_location_nowrap">
						<a href="#" class="location_city_list_toggle">
							<span class="icon icon_14x14_triangle_right" style="width: 14px; height: 14px; fill: currentColor;">
								<svg class="icon_svg" id="14x14_triangle_right" weight="100%" height="100%" viewbox="0 0 14 14">
									<path d="M9 7l-4 3.5v-7L9 7z"></path>
								</svg>
							</span>
							<span class="icon icon_14x14_triangle_down" style="display: none; width: 14px; height: 14px; fill: currentColor;">
								<svg class="icon_svg" id="14x14_triangle_down" weight="100%" height="100%" viewbox="0 0 14 14">
									<path d="M7 9L3.5 5h7L7 9z"></path>
								</svg>
							</span>
							More Cities
						</a>
					</div>
				</div>
				
				<div class="location_more_cities_island" style="display: none;">
					<div class="more_cities_island_wrap">
						<div class="more_cities_island_section">
							<h4>저장된 위치</h4>
							<ul>
								<li style="margin-bottom: 6px !important;">
									<a href="#">
										<strong style="font-weight: bold;">Home</strong>
									</a>
									<br>
									<a href="#">계정에 등록 된 집 주소를 보여주세요.</a>
								</li>
							</ul>
							<a href="#">저장된 집 주소 바꾸기 »</a>
						</div>
						
						<div class="more_cities_island_section">
							<h4>최근 검색한 위치</h4>
							<ul>
								<!-- 반복문으로 최대 10개까지 -->
								<li style="margin-bottom: 12px;">
									<a href="#">최근 검색한 기록이 없습니다.</a>
								</li>
								<li style="margin-bottom: 12px;">
									<a href="#">최근 검색한 기록1~10</a>
								</li>
							</ul>
							<a href="#" class="clear-location-toggle">최근 검색위치 초기화 »</a>
						</div>
						
						<div class="more_cities_island_section">
							<h4>유명 도시</h4>
							<div class="popular_cities">
								<div class="popular_cities_left" style="vertical-align: top;">
									<!-- 반복문으로 16개 도시 출력 -->
									<a href="#" style="margin-bottom: 6px !important; display: block !important;">도시이름</a>
								</div>
								
								<div class="popular_cities_right" style="vertical-align: top;">
									<!-- 반복문으로 16개 도시 출력 -->
									<a href="#" style="margin-bottom: 6px !important; display: block !important;">도시이름</a>
									<strong style="font-weight: bold;">
										<a href="#">더 많은 도시보기 »</a>
									</strong>
								</div>
							</div>
						</div>
					</div>
					
					<div class="more_cities_island_bottom">
						<div class="more_cities_island_bottom_left">
							<p style="margin-bottom: 6px !important;">
								원하는 지역을 검색하세요: 
							</p>
							
							<div class="search_different_city">
								<form name="search_different_city" action="#" method="post" id="search_different_location" style="margin-bottom: 18px;">
									<div class="search_different_city_input_wrap" style="width: 100%;">
										<input type="text" placeholder name="search_location" value>
									</div>
									
									<div class="search_different_city_input_wrap">
										<button type="submit" value="submit" class="search_different_city_button">
											<span>
												<span class="icon" style="width: 18px; height: 18px; margin: -9px 0; fill: #fff;">
													<svg class="icon_svg">
														<path d="M15.913 14.224a1.324 1.324 0 0 0-.3-.466h.01l-3.378-3.376a5.49 5.49 0 0 0 .802-2.857 5.523 5.523 0 1 0-5.522 5.52 5.49 5.49 0 0 0 2.856-.8l3.37 3.368.006.003a1.364 1.364 0 0 0 .93.384C15.41 16 16 15.41 16 14.684c0-.163-.032-.317-.086-.46zM7.525 10.94a3.422 3.422 0 0 1-3.418-3.416 3.422 3.422 0 0 1 3.418-3.417 3.422 3.422 0 0 1 3.416 3.417 3.42 3.42 0 0 1-3.413 3.416z"></path>
													</svg>
												</span>
											</span>
										</button> 
									</div>
								</form>
							</div>
						</div>
						
						<div class="more_cities_island_bottom_right">
							<a id="hide_location_box" href="#" style="text-align: right !important; display: block !important;">
								Hide
							</a>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</div>

<a href="event_write">이벤트 등록</a> <br><br>
<c:forEach var="dto" items="${eventList}">
<a href="event_content?evnum=${dto.evnum}">${dto.eventname}</a><br>
</c:forEach>


<script>
	$(document).on('click', '.location_city_list_toggle', function() {
		if($('.icon_14x14_triangle_down').css('display') == 'none') {
			$('.icon_14x14_triangle_right').hide();
			$('.icon_14x14_triangle_down').show();
			$('.location_more_cities_island').show();
		} else {
			$('.icon_14x14_triangle_right').show();
			$('.icon_14x14_triangle_down').hide();
			$('.location_more_cities_island').hide();
		}		
	});
	
	$(document).on('click', '#hide_location_box', function() {
		$('.icon_14x14_triangle_right').show();
		$('.icon_14x14_triangle_down').hide();
		$('.location_more_cities_island').hide();
	})
</script>




<!-- <div align="center"> -->
<!-- 	<table border="1" width="100%"> -->
<%-- 		<caption>이 벤 트 목 록</caption> --%>
<!-- 		<tr bgcolor="yellow"> -->
<!-- 			<td align="right" colspan="17"><a href="event_write">이벤트 등록</a></td> -->
<!-- 		</tr> -->
<!-- 		<tr bgcolor="green"> -->
<!-- 			<th align="center">번호</th> -->
<!-- 			<th align="center">eventname</th> -->
<!-- 			<th align="center">start_date</th> -->
<!-- 			<th align="center">start_time</th> -->
<!-- 			<th align="center">end_date</th> -->
<!-- 			<th align="center">end_time</th> -->
<!-- 			<th align="center">store_address</th> -->
<!-- 			<th align="center">event_content</th> -->
<!-- 			<th align="center">discount</th> -->
<!-- 			<th align="center">event_category</th> -->
<!-- 			<th align="center">IP</th> -->
<!-- 			<th align="center">filenum</th> -->
<!-- 			<th align="center">zipNo</th> -->
<!-- 			<th align="center">roadAddrPart1</th> -->
<!-- 			<th align="center">roadAddrPart2</th> -->
<!-- 			<th align="center">addrDetail</th> -->
<!-- 			<th align="center">register_date</th> -->
<!-- 		</tr> -->
<%-- 	<c:if test="${empty eventList}"> --%>
<!-- 		<tr> -->
<!-- 			<td colspan="16">등록된 게시글이 없습니다.</td> -->
<!-- 		</tr>	 -->
<%-- 	</c:if> 	 --%>
<%-- 	<c:forEach var="dto" items="${eventList}"> --%>
<!-- 		<tr> -->
<%-- 			<td>${dto.evnum}</td> --%>
<%-- 			<td><a href="event_content?evnum=${dto.evnum}">${dto.eventname}</a></td> --%>
<%-- 			<td>${dto.start_date}</td> --%>
<%-- 			<td>${dto.start_time}</td> --%>
<%-- 			<td>${dto.end_date}</td> --%>
<%-- 			<td>${dto.end_time}</td> --%>
<%-- 			<td>${dto.store_address}</td> --%>
<%-- 			<td>${dto.event_content}</td> --%>
<%-- 			<td>${dto.discount}</td> --%>
<%-- 			<td>${dto.event_category}</td> --%>
<%-- 			<td>${dto.ip}</td> --%>
<%-- 			<td>${dto.filenum}</td> --%>
<%-- 			<td>${dto.zipNo}</td> --%>
<%-- 			<td>${dto.roadAddrPart1}</td> --%>
<%-- 			<td>${dto.roadAddrPart2}</td> --%>
<%-- 			<td>${dto.addrDetail}</td> --%>
<%-- 			<td>${dto.event_register_date}</td> --%>
<!-- 		</tr> -->
<%-- 	</c:forEach>		 --%>
<!-- 	</table> -->
<!-- </div> -->
<%@ include file="../bottom.jsp"%>
