<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<input type="hidden" id="set" value="${set}">
<div id="page_header">
	<div id="header_main_content_wrap">
		<div id="main_content_wrap">
			<div id="content_container">
				<div id="content_container_arrange">
					<div id="yeps_img">
						<a href="main">Yeps</a>
					</div>
						<div id="yeps_search_arrange_wrap">
						<form name="page_header_form" method="post" style="margin: 0; padding: 0; width: 100%;">
							<div id="yeps_search_arrange">
								<label id="find_label">
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
								<label id="near_label">
									<span id="label_span">Near</span>
									<span id="label_input_span">
										<input type="text" maxlength="80" id="page_header_location_inputs" class="page_header_location_inputs" autocomplete="off" placeholder="지역별 검색" 
												data-query="Las Vegas, NV" aria-autocomplete="list" tabindex="2" data-component-bound="true">
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
								<label id="yeps_search_arrange_label">
									<span id="search_input_span">
										<input type="text" maxlength="80" id="page_header_searchDate_inputs" autocomplete="on" placeholder="검색어를 입력하세요.">
										<input type="hidden" maxlength="80" name="search_loc" value>
									</span>
								</label>
							</div>
							
							<div id="header_searchbutton_container">
								<div id="header_searchbutton_contain_wrap">
									<div id="header_searchbutton_wrap">
										<button type="submit" value="submit" tabindex="3" title="Search" id="header_searchbutton">
											<span aria-hidden="true" style="fill: #fff;">
												<svg id="24x24_search" viewBox="0 0 24 24">
													<path d="M20.753 19.34l-4.295-4.297A7.46 7.46 0 0 0 18 10.5a7.5 7.5 0 1 0-7.5 7.5 7.46 7.46 0 0 0 4.543-1.542l4.296 4.295a1 1 0 1 0 1.412-1.414zM10.5 16A5.506 5.506 0 0 1 5 10.5C5 7.467 7.467 5 10.5 5S16 7.467 16 10.5 13.533 16 10.5 16z"></path>
												</svg>
											</span>
										</button>
									</div>
								</div>
							</div>
							</form>
						</div>
						<div id="page_header_signup_wrap">
							<ul style="display: inline-block;">
								<li style="display: list-item; text-align: -webkit-match-parent;"><a href="#" id="page_header_signup">Sign Up</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="header_main_content_footer_wrap">
			<div id="footer_content_container">
				<div id="footer_container_arrange">
					<div id="footer_container_list">
						<div id="footer_list" style="width: 86%; display: inline-block;">
							<ul style="display: inline-block;">
								<li id="footer_list_li">
									<div>
										<a href="#" id="footer_list_li_unit">
											<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
												<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
													<path d="M13.61 17h-.007a1.39 1.39 0 0 1-1.376-1.587L13 10l-2-1c0-5.373 1.375-8 3.25-8 .497 0 .75.336.75.75v13.86A1.39 1.39 0 0 1 13.61 17zM6.557 9.912l.35 5.59a1.41 1.41 0 1 1-2.813 0l.35-5.59A1.994 1.994 0 0 1 3 8V1.5a.5.5 0 0 1 1 0v5a.5.5 0 0 0 1 0v-5a.5.5 0 0 1 1 0v5a.5.5 0 0 0 1 0v-5a.5.5 0 0 1 1 0V8c0 .91-.61 1.67-1.443 1.912z"></path>
												</svg>
											</span>
											Restaurants
										</a>
									</div>
								</li>
								<li id="footer_list_li">
									<div>
										<a href="#" id="footer_list_li_unit">
											<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
												<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
													<path d="M15.55 3.66c.565-.648.105-1.66-.754-1.66H3.204a1 1 0 0 0-.753 1.66L8 9v5H6a1 1 0 0 0 0 2h6a1 1 0 0 0 0-2h-2V9l5.55-5.34zM11 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
												</svg>
											</span>
											Nightlife
										</a>
									</div>
								</li>
								<li id="footer_list_li">
									<div id="footer_list_block">
										<a href="#" id="footer_list_li_unit_after">
											<span style="width: 18px; height: 18px; margin-right: 3px !important; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; fill: #fff;">
												<svg id="18x18_food" height="100%" viewBox="0 0 18 18" width="100%">
													<path d="M12.772 8.594c-.337 0-.656-.067-.962-.164l-6.99 7.116a1.472 1.472 0 0 1-2.11 0 1.538 1.538 0 0 1 0-2.15L9.697 6.28a3.34 3.34 0 0 1-.16-.98c0-1.82 1.447-3.294 3.234-3.294.338 0 .657.068.963.165L11.93 4.01l2.11 2.15 1.806-1.837c.095.312.162.637.162.98 0 1.82-1.45 3.294-3.236 3.294zM4.955 6.198L3.54 5.21 1.998 3.64l1.565-1.59 1.54 1.57.905 1.508L7.71 6.86 6.658 7.932 4.955 6.198zm10.006 7.198a1.54 1.54 0 0 1 0 2.15 1.475 1.475 0 0 1-2.11 0l-3.314-3.374 2.11-2.15 3.316 3.374z"></path>
												</svg>
											</span>
											Home service
											<span style="width: 14px; height: 14px; fill: currentColor; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em; left: -3px;">
												<svg id="14x14_triangle_down" height="100%" viewBox="0 0 14 14" width="100%">
													<path d="M7 9L3.5 5h7L7 9z"></path>
												</svg>
											</span>
										</a>
										<div id="header_page_footer_dropdown_wrap">
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
							</ul>
							<ul style="display: inline-block;">
								<li id="footer_list_dot">
									<div class="before">
										·
									</div>
								</li>
								<li id="footer_list_li_review">
									<div>
										<a href="#" id="footer_list_li_unit"> 
											Write a Review
										</a>
									</div>
								</li>
								<li id="footer_list_li_event">
									<div>
										<a href="event_list" id="footer_list_li_unit">
											Events
										</a>
									</div>
								</li>
								<li id="footer_list_li_message">
									<div>
										<a href="#" id="footer_list_li_unit">
											Message
										</a>
									</div>
								</li>
							</ul>
						</div>
						<div id="footer_list_login_box">
							<a href="#" id="footer_list_li_unit" style="color: white; font-weight: bold;">Log In</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(document).ready(function() {
		var set = $('#set');
		if(set.val() == 'events') {
			$('#footer_list_li_event').css('background', '#9b1a1a');
		} else if(set.val() == 'review') {
			$('#footer_list_li_review').css('background', '#9b1a1a');
		} else if(set.val() == 'message') {
			$('#footer_list_li_message').css('background', '#9b1a1a');
		}
		
		$('#footer_list_block').hover(function() {
			$('#header_page_footer_dropdown').attr('id', 'header_page_footer_dropdown_view');
			$('#footer_list_li_unit_after').attr('id', 'footer_list_li_unit_after_active');
			$('#header_page_footer_dropdown_wrap').css('pointer-events', 'auto');
		})
		$('#footer_list_block').mouseleave(function() {
			$('#header_page_footer_dropdown_view').attr('id', 'header_page_footer_dropdown');
			$('#footer_list_li_unit_after_active').attr('id', 'footer_list_li_unit_after');
			$('#header_page_footer_dropdown_wrap').css('pointer-events', 'none');
		})
		$('#page_header_inputs').click(function() {
			$('#main_search_suggestion_container').show();
			$('#find_label').css('border-radius', '4px 0 0 0');
		})
		$('#page_header_location_inputs').click(function() {
			$('#main_location_suggestion_container').show();
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