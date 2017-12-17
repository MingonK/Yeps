<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Yeps!</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=1"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/mainPage.css"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
<style>
.under_review_container {
	background-color: #fff;
    min-width: 1020px;   
}

.under_review_content_container {
	max-width: 960px;
    margin: 0 auto;
    padding: 0 15px;
}

.mainpage_review_of_the_day {
	width: 66.66667%;
	float: left;
    padding: 0 15px;
    min-height: 1px;
    box-sizing: border-box;

}

.review_of_the_day_title {
	margin-bottom: 12px;
	text-align: center;
	word-wrap: break-word!important;
    word-break: break-word!important;
    overflow-wrap: break-word!important;
    font-weight: 700;
    font-size: 16px;
    line-height: 1.3125em;
    color: #d32323;
}

.review_of_the_day_content {
	min-height: 288px;
    margin-bottom: 12px;
    box-sizing: border-box;
    background: #fff;
    padding: 11px;
    border: 1px solid #e6e6e6;
    border-radius: 4px;
    
}

.review_of_the_day_writer_container {
	margin-bottom: 18px!important;
	font-size: 12px;
    line-height: 1.5em;
    margin-left: -12px;
    margin-right: -12px;
    border-collapse: separate;
    border-spacing: 12px 0;
    display: table;
    min-width: 100%;
    table-layout: auto;
}

.review_of_the_day_writer_photo_box, .review_of_the_day_writer_inf {
	border-collapse: collapse;
    border-spacing: 0 0;
    margin-left: 6px;
    margin-right: 6px;
    box-sizing: border-box;
    display: table-cell;
    vertical-align: top;
}

.review_of_the_day_writer_info {
	width: 100%;
}

.review_of_the_day_writer {
	font-size: 14px;
    line-height: 1.28571em;
    font-weight: 700;
}

.review_of_the_day_writer_status {
	margin: 3px 0;
}

.review_of_the_day_writer_friend_count {
	color: #666;
	display: inline;
    margin-right: 6px;
}

.review_of_the_day_writer_is_elite {
	display: inline;
	margin-right: 6px;
}

.review_of_the_day_writer_is_elite a {
	color: #f15c00;
    font-weight: 700;
}

.where_write_review {
	font-size: 14px;
    line-height: 1.28571em;
}
</style>
</head>
<body>
	<div class="mainpage_header_container" style="background-image: url(https://s3-media1.fl.yelpcdn.com/assets/srv0/yelp_large_assets/8a6cc705477a/assets/img/home/hero_photos/uteUmycsbh0UibXk-At-3A.jpg);">
		<div class="mainpage_header_content_container">
			<div class="mainpage_header_top" style="height: 40px;">
				<div class="mainpage_header_top_wrap">
					<div class="mainpage_header_top_left_wrap">
						<div style="white-space: nowrap;">
							<ul class="mainpage_header_top_left">
								<li class="mainpage_header_write_review mainpage_header_top_items">
									<a href="#" class="mainpage_header_link">
										Write a Review
									</a>
								</li>
								<li class="mainpage_header_events mainpage_header_top_items">
									<a href="event_list" class="mainpage_header_link">
										Events
									</a>
								</li>
								<li class="mainpage_header_message mainpage_header_top_items">
									<a href="event_list" class="mainpage_header_link">
										Message
									</a>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="mainpage_header_top_right_wrap">
						<ul class="mainpage_header_top_right" style="float: right">
							<li class="mainpage_header_login mainpage_header_top_items">
								<a href="member_login" class="mainpage_header_link">
									Log In
								</a>
							</li>
							<li class="mainpage_header_signup">
								<a href="member_login?mode=signup" class="mainpage_header_signup_button">
									Sign Up
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<div class="mainpage_header_inner">
				<div class="mainpage_header_inner_mainlogo" style="text-align: center!important;">
					<h1 id="mainpage_header_mainlogo">
						<a href="#">Yeps</a>
					</h1>
				</div>
				<form method="post" action="#" class="mainpage_find_form" >
					<div class="mainpage_search_arrange">
						<div id="yeps_search_arrange">
							<label id="find_label" class="mainpage_search">
								<span id="label_span">Find</span>
								<span id="label_input_span">
									<input type="text" maxlength="64" id="page_header_inputs" class="page_header_inputs" autocomplete="on" value placeholder="분야별 검색" aria-autocomplete="list" tabindex="1" data-component-bound="true">
									<input type="hidden" maxlength="64" data-component-bound="true" name="find_input" value>		
								</span>
							</label>
							
							<div id="main_search_suggestion_container">
								<ul id="suggestion_container_list">
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('fork_knife_icon')" onmouseout="javascript:outMouse('fork_knife_icon')" onclick="javascript:clickMouse('Restaurants')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="fork_knife">
												<span id="fork_knife_icon">
													<svg id="24x24_food" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M17.22 22a1.78 1.78 0 0 1-1.74-2.167l1.298-4.98L14 13l1.756-9.657A1.635 1.635 0 0 1 19 3.635V20.22A1.78 1.78 0 0 1 17.22 22zm-7.138-9.156l.697 7.168a1.79 1.79 0 1 1-3.56 0l.7-7.178A3.985 3.985 0 0 1 5 9V3a1 1 0 0 1 2 0v5.5c0 .28.22.5.5.5s.5-.22.5-.5V3a1 1 0 0 1 2 0v5.5c0 .28.22.5.5.5s.5-.22.5-.5V3a1 1 0 0 1 2 0v5.83c0 1.85-1.2 3.518-2.918 4.014z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Restaurants
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('Bars_icon')" onmouseout="javascript:outMouse('Bars_icon')" onclick="javascript:clickMouse('Bars')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="Bars">
												<span id="Bars_icon" >
													<svg id="24x24_nightlife" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M19.215 3H4.785C3.095 3 2.29 5.08 3.54 6.22L11 13v6H8a1 1 0 0 0 0 2h8a1 1 0 0 0 0-2h-3v-6l7.46-6.78C21.71 5.08 20.905 3 19.214 3zM15 4.5a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Bars
												</span>
											</div>
										</div>
									</li> 
									
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('food_icon')" onmouseout="javascript:outMouse('food_icon')" onclick="javascript:clickMouse('Food')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="food">
												<span id="food_icon">
													<svg id="24x24_ice_cream" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M17.5 7.27l-.305-.176A5.198 5.198 0 0 0 12 2a5.198 5.198 0 0 0-5.195 5.094L6.5 7.27a3.466 3.466 0 0 0-1.268 4.735 3.43 3.43 0 0 0 2.688 1.7l3.155 7.675c.34.827 1.51.827 1.85 0l3.155-7.674a3.43 3.43 0 0 0 2.688-1.7 3.466 3.466 0 0 0-1.27-4.736zm-.464 3.735c-.26.45-.732.72-1.263.72a1.46 1.46 0 0 1-.28-.026l-1.065-.204-.75.78a2.308 2.308 0 0 1-3.355 0l-.75-.78-1.066.202a1.46 1.46 0 0 1-.28.025 1.44 1.44 0 0 1-1.263-.72c-.404-.7-.163-1.6.537-2.003l.306-.176.977-.564.023-1.128A3.214 3.214 0 0 1 12 4a3.214 3.214 0 0 1 3.195 3.134l.023 1.128.977.564.304.176c.7.404.94 1.303.535 2.003z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Food
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('breakfast_brunch_icon')" onmouseout="javascript:outMouse('breakfast_brunch_icon')" onclick="javascript:clickMouse('Breakfast & Brunch')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="breakfast_brunch">
												<span id="breakfast_brunch_icon">
													<svg id="24x24_croissant" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M20.634 8.5H19.1c.09-.295.15-.602.15-.926v-2.12c.718.34 1.39.76 2.003 1.253.74.597.332 1.793-.62 1.793zm-4.86 1.055a5.58 5.58 0 0 0-.712-.05L13.748 3.58a10.957 10.957 0 0 1 3.425.138c.477.094.827.5.827 1.324v2.534c0 1.195-1.043 2.15-2.225 1.98zm-2.43 1.81a4.005 4.005 0 0 0-1.98 1.98c-.202.442-.664.702-1.138.597l-6.89-1.528a1.013 1.013 0 0 1-.737-1.3A13.018 13.018 0 0 1 11.112 2.6a1.013 1.013 0 0 1 1.3.735l1.527 6.89c.106.475-.154.937-.597 1.14zM9.506 15.06c.003.242.016.48.05.713C9.722 16.957 8.768 18 7.573 18H4.7c-.485 0-.89-.35-.984-.827a10.957 10.957 0 0 1-.138-3.425l5.928 1.314zM8.5 19.1v1.534c0 .95-1.196 1.36-1.792.62a9.997 9.997 0 0 1-1.253-2.004h2.12c.318 0 .626-.062.925-.15z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Breakfast & Brunch
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('coffee_tea_icon')" onmouseout="javascript:outMouse('coffee_tea_icon')" onclick="javascript:clickMouse('Coffee & Tea')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="coffee_tea">
												<span id="coffee_tea_icon">
													<svg id="24x24_coffee" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M19 13h-1a3 3 0 0 1-3 3H7a3 3 0 0 1-3-3V5h15a3 3 0 0 1 3 3v2a3 3 0 0 1-3 3zm1-5c0-.55-.45-1-1-1h-1v4h1c.55 0 1-.45 1-1V8zm2 10a1 1 0 0 1-1 1H3a1 1 0 0 1 0-2h18a1 1 0 0 1 1 1z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Coffee & Tea
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('delivery_icon')" onmouseout="javascript:outMouse('delivery_icon')" onclick="javascript:clickMouse('delivery')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="delivery">
												<span id="delivery_icon">
													<svg id="24x24_order" height="100%" viewBox="0 0 24 24" width="100%">
														<g>
															<path d="M19 10V4h-6v10H9.444a3.485 3.485 0 0 0-4.888 0H2v3h1.55A3.49 3.49 0 0 0 7 20a3.49 3.49 0 0 0 3.45-3h3.1c.24 1.69 1.69 3 3.45 3 1.76 0 3.21-1.31 3.45-3H22v-5l-3-2zM7 18a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm8-12h2v3h-2V6zm2 12c-.83 0-1.5-.67-1.5-1.5S16.17 15 17 15s1.5.67 1.5 1.5S17.83 18 17 18z"></path>
															<path d="M6 7V6c0-.55.45-1 1-1h1c.55 0 1 .45 1 1v1H6m2-4H7a3 3 0 0 0-3 3v1H2v7h11V7h-2V6a3 3 0 0 0-3-3" opacity=".502"></path>
														</g>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Delivery
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('takeout_icon')" onmouseout="javascript:outMouse('takeout_icon')" onclick="javascript:clickMouse('takeout')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="takeout">
												<span id="takeout_icon">
													<svg id="24x24_shopping" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M16 6V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H5v13a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V6h-3zm-6-1c0-.55.45-1 1-1h2c.55 0 1 .45 1 1v1h-4V5z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													TakeOut
												</span>
											</div>
										</div>
									</li>
									<li id="suggestion_container_list_items" onmouseover="javascript:onMouse('reservations_icon')" onmouseout="javascript:outMouse('reservations_icon')" onclick="javascript:clickMouse('reservations')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="reservations">
												<span id="reservations_icon">
													<svg id="24x24_reservation" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M18 21H6a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3 1 1 0 0 1 2 0h8a1 1 0 0 1 2 0 3 3 0 0 1 3 3v12a3 3 0 0 1-3 3zm1-13H5v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1V8zm-6 5h4v4h-4v-4z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													Reservations
												</span>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div id="yeps_search_arrange" style="float: left;">
							<label id="near_label" class="mainpage_search">
								<span id="label_span">Near</span>
								<span id="label_input_span">
									<input type="text" maxlength="80" id="page_header_location_inputs" class="page_header_location_inputs" autocomplete="off" placeholder="지역별 검색" 
											aria-autocomplete="list" tabindex="2" data-component-bound="true">
									<input type="hidden" maxlength="80" data-component-bound="true" name="find_loc" value="Las Vegas, NV">
								</span>
							</label>
							
							<!-- 이 구간 안에 새로운 div로 지역검색할 수 있도록 지정해야함 -->
							<div id="main_location_suggestion_container">
								<ul id="location_suggestion_container_list">
									<li id="suggestion_container_list_items_button" onmouseover="javascript:onMouse('location_icon')" onmouseout="javascript:outMouse('location_icon')" onclick="javascript:loc_clickMouse('최근 검색 지역')">
										<div id="list_items_unit" style="position: relative; display: flex;">
											<div id="location">
												<span id="location_icon" style="fill: #0073bb;">
													<svg id="24x24_location" height="100%" viewBox="0 0 24 24" width="100%">
														<path d="M3 12.73L20 4l-8.73 17-.696-7.574L3 12.73z"></path>
													</svg>
												</span>
											</div>
											<div id="suggestion_container_list_items_name">
												<span>
													최근 검색 지역
												</span>
											</div>
										</div>
									</li>
								</ul>
							</div>
							
						</div>
						<div id="yeps_search_arrange" style="width: 32%; float: left;">
							<label id="yeps_search_arrange_label" class="mainpage_search">
								<span id="search_input_span">
									<input type="text" maxlength="80" id="page_header_searchDate_inputs" autocomplete="on" placeholder="검색어를 입력하세요.">
									<input type="hidden" maxlength="80" name="search_loc" value>
								</span>
							</label>
						</div>
						
						<div id="header_searchbutton_container">
							<div id="header_searchbutton_contain_wrap">
								<div id="header_searchbutton_wrap">
									<button type="submit" value="submit" tabindex="3" style="height: 45px; width: 70px; padding: 0 20px;" title="Search" id="header_searchbutton">
										<span aria-hidden="true" style="fill: #fff; width: 24px; height: 24px;">
											<svg id="24x24_search" viewBox="0 0 24 24">
												<path d="M20.753 19.34l-4.295-4.297A7.46 7.46 0 0 0 18 10.5a7.5 7.5 0 1 0-7.5 7.5 7.46 7.46 0 0 0 4.543-1.542l4.296 4.295a1 1 0 1 0 1.412-1.414zM10.5 16A5.506 5.506 0 0 1 5 10.5C5 7.467 7.467 5 10.5 5S16 7.467 16 10.5 13.533 16 10.5 16z"></path>
											</svg>
										</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<ul class="mainpage_header_inner_categories">
					<li class="mainpage_header_inner_category">
						<div>
							<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
								<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
									<path d="M13.61 17h-.007a1.39 1.39 0 0 1-1.376-1.587L13 10l-2-1c0-5.373 1.375-8 3.25-8 .497 0 .75.336.75.75v13.86A1.39 1.39 0 0 1 13.61 17zM6.557 9.912l.35 5.59a1.41 1.41 0 1 1-2.813 0l.35-5.59A1.994 1.994 0 0 1 3 8V1.5a.5.5 0 0 1 1 0v5a.5.5 0 0 0 1 0v-5a.5.5 0 0 1 1 0v5a.5.5 0 0 0 1 0v-5a.5.5 0 0 1 1 0V8c0 .91-.61 1.67-1.443 1.912z"></path>
								</svg>
							</span>
							<a href="restaurant_list" class="mainpage_header_inner_category_link">
								Restaurants
							</a>
						</div>
					</li>
					<li class="mainpage_header_inner_category">
						<div>
							<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
								<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
									<path d="M15.55 3.66c.565-.648.105-1.66-.754-1.66H3.204a1 1 0 0 0-.753 1.66L8 9v5H6a1 1 0 0 0 0 2h6a1 1 0 0 0 0-2h-2V9l5.55-5.34zM11 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
								</svg>
							</span>
							<a href="#" class="mainpage_header_inner_category_link">
								Nightlife
							</a>
						</div>
					</li>
					<li class="mainpage_header_inner_category">
						<div id="mainpage_header_inner_category_block">
							<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
								<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
									<path d="M12.772 8.594c-.337 0-.656-.067-.962-.164l-6.99 7.116a1.472 1.472 0 0 1-2.11 0 1.538 1.538 0 0 1 0-2.15L9.697 6.28a3.34 3.34 0 0 1-.16-.98c0-1.82 1.447-3.294 3.234-3.294.338 0 .657.068.963.165L11.93 4.01l2.11 2.15 1.806-1.837c.095.312.162.637.162.98 0 1.82-1.45 3.294-3.236 3.294zM4.955 6.198L3.54 5.21 1.998 3.64l1.565-1.59 1.54 1.57.905 1.508L7.71 6.86 6.658 7.932 4.955 6.198zm10.006 7.198a1.54 1.54 0 0 1 0 2.15 1.475 1.475 0 0 1-2.11 0l-3.314-3.374 2.11-2.15 3.316 3.374z"></path>
								</svg>
							</span>
							<a href="#" class="mainpage_header_inner_category_link" id="category_link_homeservice_active">
								Home service
							</a>
							<span style="width: 14px; height: 14px; fill: currentColor; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; left: -3px; fill: #fff;">
								<svg id="14x14_triangle_down" height="100%" viewBox="0 0 14 14" width="100%">
									<path d="M7 9L3.5 5h7L7 9z"></path>
								</svg>
							</span>
							<div id="header_page_footer_dropdown_wrap" style="display: block;">
								<div id="header_page_footer_dropdown">
									<div id="header_page_footer_dropdown_menu">
										<ul id="header_page_footer_dropdown_menu_group">
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Air Conditioning & Heating</span>
												</a>
											</li>
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Contractors</span>
												</a>
											</li>
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Electricians</span>
												</a>
											</li>
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Home Cleaners</span>
												</a>
											</li>
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Landscapers</span>
												</a>
											</li>
											<li id="header_page_footer_dropdown_menu_item">
												<a href="#" id="footer_dropdown_menu_item_link">
													<span style="white-space: nowrap;">Locksmiths</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="mainpage_header_inner_category">
						<div>
							<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
								<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
									<g>
										<path d="M4 4V3h3v1H4m4-2H3v2H2a1 1 0 0 0-1 1v7h9V5a1 1 0 0 0-1-1H8V2" opacity=".502"></path>
										<path d="M17 10.93L15 9.5V4h-5v8H7.49a2.49 2.49 0 0 0-1.99-1 2.49 2.49 0 0 0-1.99 1H1v2h2.05a2.502 2.502 0 0 0 4.9 0h3.1a2.5 2.5 0 0 0 4.9 0H17v-3.07zM5.5 14.75a1.25 1.25 0 1 1 0-2.5 1.25 1.25 0 0 1 0 2.5zM12 6h1v3h-1V6zm1.5 8.75a1.25 1.25 0 1 1 0-2.5 1.25 1.25 0 0 1 0 2.5z"></path>
									</g>
								</svg>
							</span>
							<a href="#" class="mainpage_header_inner_category_link">
								Delivery
							</a>
						</div>
					</li>
				</ul>
				<div class="mainpage_header_inner_bottom" style="text-align: center;">
					<div class="mainpage_header_bottom_text_name" style="display:inline-block;">
						<span>
							<a href="#" class="mainpage_header_recommend_name">
								<span>
									사진이 찍힌 레스토랑 명
								</span>
							</a>
						</span>
					</div>
				</div>
				
				<div class="mainpage_header_bottom_photo_owner">
					<div>
						<p style="margin-bottom: 12px;">
							photo by
							<a href="#" class="mainpage_header_bottom_photo_owner_link">
								사진 찍은 사람
							</a>
						</p>
					</div>
					 
				</div>
			</div>
		</div>
	</div>




	<div class="mainpage_container">
		<div class="mainpage_content_container">
			<div class="mainpage_home_container">
				<div class="mainpage_home_container_section">
					<h2 class="mainpage_homecontainer_section_location">Yeps 선택 지역</h2>
					<div class="mainpage_homecontainer_location_bar">
						<div>
							<ul class="mainpage_homecontainer_location_bar_center">
							<!-- 아마 최신 검색 리스트 가져와서 반복문으로 6개 돌린 듯 -->
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역1</span>
									</a>
								</li>
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역2</span>
									</a>
								</li>
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역3</span>
									</a>
								</li>
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역4</span>
									</a>
								</li>
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역5</span>
									</a>
								</li>
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span class="mainpage_location_bar_item_label">최근 검색지역6</span>
									</a>
								</li>
								<!-- 아마 최신 검색 리스트 가져와서 반복문으로 6개 돌린 듯 -->
								<li class="mainpage_location_bar_item">
									<a href="#" class="mainpage_location_bar_item_link">
										<span style="width: 18px; height: 18px;" class="icon mainpage_18x18_search_small_icon">
											<svg class="icon_svg" height="100%" viewBox="0 0 18 18" width="100%">
												<path d="M15.913 14.224a1.324 1.324 0 0 0-.3-.466h.01l-3.378-3.376a5.49 5.49 0 0 0 .802-2.857 5.523 5.523 0 1 0-5.522 5.52 5.49 5.49 0 0 0 2.856-.8l3.37 3.368.006.003a1.364 1.364 0 0 0 .93.384C15.41 16 16 15.41 16 14.684c0-.163-.032-.317-.086-.46zM7.525 10.94a3.422 3.422 0 0 1-3.418-3.416 3.422 3.422 0 0 1 3.418-3.417 3.422 3.422 0 0 1 3.416 3.417 3.42 3.42 0 0 1-3.413 3.416z"></path>
											</svg>
										</span>
										<span class="mainpage_more_city">
											더 많은 지역
										</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				
				<div class="mainpage_new_businesses_section">
					<h3 class="explore_city_title">
						Hot & New Businesses
					</h3>
					
					<div class="mainpage_new_businesses_list">
					<!-- 3개만 출력하는 반복문일 가능성 높음 -->
						<div class="mainpage_new_businesses">
							<div class="mainpage_new_businesses_card">
								<div class="mainpage_new_businesses_card_photo">
									<div class="mainpage_new_businesses_photo_box" style="background-image: url(https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg);">
										<a href="#" style="display: block;" class="new_businesses_photo_box_link">
											<img class="photo_box_img" height="400" src="https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg" width="600">
										</a>
									</div>
								</div>
								
								<div class="mainpage_new_businesses_card_content">
									<h3 class="new_businesses_card_content_title">
										<div>
											<span>
												<a href="#">
													<span>매장이름1</span>
												</a>
											</span>
										</div>
									</h3>
									
									<div class="mainpage_new_business_rating">
										<div class="mainpage_new_business_rating_star">
											<img class="offscreen" height="303" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" width="84" style="vertical-align: middle;">
										</div>
										<span class="mainpage_new_business_review_count">
											리뷰갯수
										</span>
									</div>
									
									<div class="new_business_price_foodstyle">
										<!-- 가격표시 없으면 표시 안함 -->
										<span>
											<span style="letter-spacing: 1px; white-space: nowrap;">
												가격범위 표시
											</span>
										</span>
										<span>
											푸드스타일
										</span>
									</div>
									
									<div class="new_business_store_location">
										<span>매장 주소 간단히</span>
									</div>
									
									<p class="new_business_open_date">
										<span class="icon 18x18_frame" style="width: 18px; height: 18px; fill: currentColor; overflow: hidden;">
											<svg class="icon_svg" id="18x18_frame">
												<path d="M11.508 3.743c1.173 2.43-.465 2.27-.696 3.88C10.082 2.758 5.947 1.5 5.947 1.5c2.045 2.697-1.9 4.784-3.63 8.33-1.47 3.016 2.533 5.44 4.67 6.67-2.15-2.993-.563-5.02 1.612-6.793-.81 2.448.5 2.934 1.043 3.944.71-.31 1.028-1.3 1.1-1.79.954 1.31 1.465 2.97-.248 4.64 8.302-3.77 5.977-9.743 1.007-12.752z"></path>
											</svg>
										</span>
										오픈한지 얼마나 됐는지
									</p>
								</div>
							</div>
						</div>
						
						
						
						
						<div class="mainpage_new_businesses">
							<div class="mainpage_new_businesses_card">
								<div class="mainpage_new_businesses_card_photo">
									<div class="mainpage_new_businesses_photo_box" style="background-image: url(https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg);">
										<a href="#" style="display: block;" class="new_businesses_photo_box_link">
											<img class="photo_box_img" height="400" src="https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg" width="600">
										</a>
									</div>
								</div>
								
								<div class="mainpage_new_businesses_card_content">
									<h3 class="new_businesses_card_content_title">
										<div>
											<span>
												<a href="#">
													<span>매장이름2</span>
												</a>
											</span>
										</div>
									</h3>
									
									<div class="mainpage_new_business_rating">
										<div class="mainpage_new_business_rating_star">
											<img class="offscreen" height="303" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" width="84" style="vertical-align: middle;">
										</div>
										<span class="mainpage_new_business_review_count">
											리뷰갯수
										</span>
									</div>
									
									<div class="new_business_price_foodstyle">
										<!-- 가격표시 없으면 표시 안함 -->
										<span>
											<span style="letter-spacing: 1px; white-space: nowrap;">
												가격범위 표시
											</span>
										</span>
										<span>
											푸드스타일
										</span>
									</div>
									
									<div class="new_business_store_location">
										<span>매장 주소 간단히</span>
									</div>
									
									<p class="new_business_open_date">
										<span class="icon 18x18_frame" style="width: 18px; height: 18px; fill: currentColor; overflow: hidden;">
											<svg class="icon_svg" id="18x18_frame">
												<path d="M11.508 3.743c1.173 2.43-.465 2.27-.696 3.88C10.082 2.758 5.947 1.5 5.947 1.5c2.045 2.697-1.9 4.784-3.63 8.33-1.47 3.016 2.533 5.44 4.67 6.67-2.15-2.993-.563-5.02 1.612-6.793-.81 2.448.5 2.934 1.043 3.944.71-.31 1.028-1.3 1.1-1.79.954 1.31 1.465 2.97-.248 4.64 8.302-3.77 5.977-9.743 1.007-12.752z"></path>
											</svg>
										</span>
										오픈한지 얼마나 됐는지
									</p>
								</div>
							</div>
						</div>
						
						
						
						
						
						
						<div class="mainpage_new_businesses">
							<div class="mainpage_new_businesses_card">
								<div class="mainpage_new_businesses_card_photo">
									<div class="mainpage_new_businesses_photo_box" style="background-image: url(https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg);">
										<a href="#" style="display: block;" class="new_businesses_photo_box_link">
											<img class="photo_box_img" height="400" src="https://s3-media1.fl.yelpcdn.com/bphoto/sioF_Kn_ZZvhdvLZvV6iUg/l.jpg" width="600">
										</a>
									</div>
								</div>
								
								<div class="mainpage_new_businesses_card_content">
									<h3 class="new_businesses_card_content_title">
										<div>
											<span>
												<a href="#">
													<span>매장이름3</span>
												</a>
											</span>
										</div>
									</h3>
									
									<div class="mainpage_new_business_rating">
										<div class="mainpage_new_business_rating_star">
											<img class="offscreen" height="303" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" width="84" style="vertical-align: middle;">
										</div>
										<span class="mainpage_new_business_review_count">
											리뷰갯수
										</span>
									</div>
									
									<div class="new_business_price_foodstyle">
										<!-- 가격표시 없으면 표시 안함 -->
										<span>
											<span style="letter-spacing: 1px; white-space: nowrap;">
												가격범위 표시
											</span>
										</span>
										<span>
											푸드스타일
										</span>
									</div>
									
									<div class="new_business_store_location">
										<span>매장 주소 간단히</span>
									</div>
									
									<p class="new_business_open_date">
										<span class="icon 18x18_frame" style="width: 18px; height: 18px; fill: currentColor; overflow: hidden;">
											<svg class="icon_svg" id="18x18_frame">
												<path d="M11.508 3.743c1.173 2.43-.465 2.27-.696 3.88C10.082 2.758 5.947 1.5 5.947 1.5c2.045 2.697-1.9 4.784-3.63 8.33-1.47 3.016 2.533 5.44 4.67 6.67-2.15-2.993-.563-5.02 1.612-6.793-.81 2.448.5 2.934 1.043 3.944.71-.31 1.028-1.3 1.1-1.79.954 1.31 1.465 2.97-.248 4.64 8.302-3.77 5.977-9.743 1.007-12.752z"></path>
											</svg>
										</span>
										오픈한지 얼마나 됐는지
									</p>
								</div>
							</div>
						</div>
					</div>
					
					
					<div style="margin-top: 12px!important; text-align: center!important;">
						<a href="#">더 많은 최신 식당 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="under_review_container">
		<div class="under_review_content_container">
			<div class="un_named">
				<div class="mainpage_home_container_section">
				<!-- 크기 잘못됨, 다시 체크하면서 수정할 것 -->
					<div style="margin: 0 -15px; width: 100%; height:auto; overflow: hidden;">
						<div class="mainpage_review_of_the_day">
							<div class="review_of_the_day_container">
								<h3 class="review_of_the_day_title">Review of the Day</h3>
								<div class="review_of_the_day_content">
									<div class="review_of_the_day_writer_container">
										<div class="review_of_the_day_writer_photo_box">
											<div>
												<a href="#">
													<img class="review_of_the_day_writer_img" height="60" widgh="60" src="#">
												</a>
											</div>
										</div>
										
										<div class="review_of_the_day_writer_info">
											<strong style="font-weight: 700;">
												<a href="#" class="review_of_the_day_writer">
													유저 아이디
												</a>
											</strong>
											<ul class="review_of_the_day_writer_status">
												<li class="review_of_the_day_writer_friend_count">
													<span class="icon 18x18_friend_icon">
														<svg style="fill: #f15c00; width: 18px; height: 18px;">
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												
												<li class="review_of_the_day_writer_review_count">
													<span class="icon 18x18_review_icon">
														<svg style="fill: #f15c00; width: 18px; height: 18px;">
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
												
												<li class="review_of_the_day_writer_is_elite">
													<a href="#">Elite ’17(?)</a>
												</li>
											</ul>
											<div class="where_write_review">
												Wrote a review for
												<div style="display: inline;">
													<span>
														<a href="#" style="font-weight: 700;">
															식당 명
														</a>
													</span>
												</div>   
											</div>
										</div>
									</div>
									
									<div>	</div>
									
									<div>	</div>
									
									<p></p>
								</div>
								
								<p></p>
								
								
							</div>
						</div>
						
						<div>
							Recent List
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	

	<script>
	$(document).ready(function() {
		$('#page_header_inputs').click(function() {
			$('#main_search_suggestion_container').show();
			$('#find_label').css('border-radius', '4px 0 0 0');
		})
		$('#page_header_location_inputs').click(function() {
			$('#main_location_suggestion_container').show();
		})
		
		$('#mainpage_header_inner_category_block').hover(function() {
			$('#header_page_footer_dropdown').attr('id', 'header_page_footer_dropdown_view');
			$('#mainpage_header_inner_category_block').attr('id', 'mainpage_header_inner_category_block_active');
			$('#header_page_footer_dropdown_wrap').css('pointer-events', 'auto');
		})
		$('#mainpage_header_inner_category_block').mouseleave(function() {
			$('#header_page_footer_dropdown_view').attr('id', 'header_page_footer_dropdown');
			$('#mainpage_header_inner_category_block_active').attr('id', 'mainpage_header_inner_category_block');
			$('#header_page_footer_dropdown_wrap').css('pointer-events', 'none');
		})
	});
	
	$('html').click(function(e) {
		if(!$(e.target).hasClass("page_header_inputs"))	{
			$('#main_search_suggestion_container').hide();
			$('#find_label').css('border-radius', '4px 0 0 4px');
		}
		if(!$(e.target).hasClass("page_header_location_inputs")) {
			$('#main_location_suggestion_container').hide();
		} 
	});
	</script>
	
	<script type="text/javascript">
		function onMouse(obj) {
			document.getElementById(obj).style.fill = "white";
		}
	
		function outMouse(obj) {
			if(obj == 'location_icon') {
				document.getElementById(obj).style.fill = "#0073bb";
			} else {
				document.getElementById(obj).style.fill = "#666";
			}
		}
	
		function clickMouse(obj) {
			document.getElementById("page_header_inputs").value = obj;
			document.page_header_form.action = "#";
			document.page_header_form.submit();
		}
		function loc_clickMouse(obj) {
			document.getElementById("page_header_location_inputs").value = obj;
			document.page_header_form.action = "#";
			document.page_header_form.submit();
		}
	</script>




