<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=3"/>"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css?ver=1" />
<script src="//code.jquery.com/jquery.min.js?ver=1"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js?ver=2"></script>

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
						
						<c:choose>
							<c:when test="${empty sessionScope.memberinfo}">
								<div id="page_header_signup_wrap">
									<ul style="display: inline-block;">
										<li style="display: list-item; text-align: -webkit-match-parent;"><a href="member_login?mode=signup" id="page_header_signup">Sign Up</a></li>
									</ul>
								</div>
							</c:when>
							<c:otherwise>
								<div id="page_header_notifications_wrap">
									<div id="page_header_notifications">
										<a href="/mail" class="header-nav_link" id="messages-icon" data-analytics-label="messages_icon">
											<span aria-label="Messages" style="width: 24px; height: 24px;" class="icon icon--24-speech icon--size-24 icon--white icon--fallback-inverted">
											<svg class="icon_svg">
												<path d="M18 3H6C4.34 3 3 4.34 3 6v7c0 1.66 1.34 3 3 3h2v5l5-5h5c1.66 0 3-1.34 3-3V6c0-1.66-1.34-3-3-3z"></path>
											</svg>
											</span>
										</a>
										<a href="#" class="header-nav_link show-tooltip js-analytics-click" id="notifications-icon" data-analytics-label="notifications_icon">
											<span aria-label="Notifications" style="width: 24px; height: 24px;" class="icon icon--24-notification icon--size-24 icon--white icon--fallback-inverted">
												<svg class="icon_svg">
													<path d="M20.984 17.177A1 1 0 0 1 20 18H4a1 1 0 0 1-.348-1.938c2.43-.9 3.74-4.605 3.74-7.634 0-1.75 1.07-3.253 2.608-3.97V4a2 2 0 0 1 4 0v.457c1.538.718 2.61 2.22 2.61 3.97 0 3.03 1.31 6.734 3.738 7.635a1 1 0 0 1 .636 1.115zM12 22a3 3 0 0 1-3-3h6a3 3 0 0 1-3 3z"></path>
												</svg>
											</span>
										</a>
									</div>
								</div>
								
								<div id="page_header_notifications_wrap">
									<div id="page_header_acount_notifications">
										<div id="page_header_account">
											<div id="topbar-account-item" class="drop-menu-origin" data-component-bound="true">
												<a class="drop-menu-link user-account_button drop-menu-highlighted" href="javascript:;" id="topbar-account-link" data-component-bound="true">
													<span class="user-account_avatar responsive-visible-large-block"><img alt="Smile08908 .." class="photo-box-img" height="90" src="https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/90s.jpg" srcset="https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/180s.jpg 2.00x,https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/ms.jpg 1.11x,https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/120s.jpg 1.33x,https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/168s.jpg 1.87x,https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/ls.jpg 2.78x,https://s3-media3.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/258s.jpg 2.87x" width="90"></span>
													<span aria-hidden="true" style="width: 14px; height: 14px;" class="icon icon-triangle-down">
														<svg class="icon_svg">
															<path d="M7 9L3.5 5h7L7 9z"></path>
														</svg>
													</span>
												</a>
												<div id="topbar-account-wrap" class="drop-menu drop-menu-has-arrow" data-component-bound="true">
													<div class="drop-menu-arrow responsive-hidden-small"></div>
														<div class="drop-menu-group responsive-visible-large-block">
															<div class="ypassport ypassport-notext media-block">
																<div class="media-avatar responsive-photo-box js-analytics-click" data-analytics-label="about_me">
																	<div class="photo-box pb-60s" data-hovercard-id="mNnbq24hI6DxMOQ0JLFrnQ">
																		<a href="#" class="js-analytics-click" data-analytics-label="user-photo">
																			<img alt="Smile08908 .." class="photo-box-img" height="60" src="https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/60s.jpg" srcset="https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/90s.jpg 1.50x,https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/168s.jpg 2.80x,https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/ms.jpg 1.67x,https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/180s.jpg 3.00x,https://s3-media4.fl.yelpcdn.com/photo/mlb90wwPDh8ood7isjXg3w/120s.jpg 2.00x" width="60">
																		</a>
																	</div>
																</div>
																<div class="media-story">
																	<ul class="user-passport-info">
																		<li class="user-name">
																			<a class="user-display-name js-analytics-click" href="#" data-hovercard-id="mNnbq24hI6DxMOQ0JLFrnQ" data-analytics-label="about_me" id="dropdown_user-name">
																				<strong class="unit_hover">
																					<c:set value="${sessionScope.memberinfo.name}" var="memberName"/>
                    																	<c:choose>
                    																		<c:when test="${fn:length(memberName) > 7}">
												                    							<c:out value="${fn:substring(memberName,0,6)}"/>..
                    																		</c:when>
                    																		<c:otherwise>
                    																			<c:out value="${memberName}"/>
                    																		</c:otherwise> 
                    																	</c:choose>
																				</strong>
																			</a>
																		</li>
																		<li class="user-location responsive-hidden-small">
																			<b>Korea, seoul</b>
																		</li>
																	</ul>
																	<ul class="user-passport-stats">
																		<li class="friend-count">
																			<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-friends icon--size-18">
																				<svg class="icon_svg">
																					<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
																					<path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
																				</svg>
																			</span>
																			<b>0</b>	<!-- 친구 수 -->
																		</li>
																		<li class="review-count">
																			<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-review icon--size-18">
																				<svg class="icon_svg">
																					<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
																				</svg>
																			</span>
																			<b>${sessionScope.memberinfo.reviewcount}</b> <!-- 리뷰 수 -->
																		</li>
																	</ul>
																</div>
															</div>
																		</div>
														<ul class="drop-menu-group--nav drop-menu-group">
															<li class="drop-down-menu-link">
																<a class="js-analytics-click arrange arrange--middle arrange--6" href="#" data-analytics-label="dropdown_about-me">
																	<strong class="arrange_unit">
																		<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-profile icon--size-24 u-space-r1">
																			<svg class="icon_svg">
																				<path d="M4.37 22c.278-4.762 3.587-8 7.63-8 4.043 0 7.352 3.238 7.63 8H4.37zM12 12a5 5 0 1 1 0-10 5 5 0 0 1 0 10z"></path>
																			</svg>
																		</span><strong class="unit_hover">About Me</strong>
																	</strong>
																</a>
															</li>
															<li class="drop-down-menu-link">
																<a class="js-analytics-click arrange arrange--middle arrange--6" href="#" data-analytics-label="dropdown_find-friends">
																	<strong class="arrange_unit">
																		<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-friends icon--size-24 u-space-r1">
																			<svg class="icon_svg">
																				<path d="M10.824 13.817l-2.482 5.946c-.69 1.65-2.995 1.65-3.684 0l-2.482-5.946C1.618 12.48 2.586 11 4.018 11h4.964c1.432 0 2.4 1.48 1.842 2.817zM6.5 9a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"></path>
																				<path d="M21.824 13.817l-2.482 5.946c-.69 1.65-2.995 1.65-3.684 0l-2.482-5.946c-.558-1.337.41-2.817 1.842-2.817h4.964c1.432 0 2.4 1.48 1.842 2.817zM17.5 9a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" opacity=".502"></path>
																			</svg>
																		</span><strong class="unit_hover">Find Friend</strong>
																	</strong>
																</a>
															</li>
															<li class="drop-down-menu-link hidden-non-responsive-block responsive-visible-medium-block">
																<a class="js-analytics-click arrange arrange--middle arrange--6" href="#" data-analytics-label="">
																	<strong class="arrange_unit">
																		<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-talk icon--size-24 u-space-r1">
																			<svg class="icon_svg">
																				<path d="M20 17.326V21l-3-3c-2.715 0-5.006-1.504-5.746-3.566C14.047 13.42 16 11.144 16 8.5c0-.142-.015-.282-.026-.422A7.19 7.19 0 0 1 17 8c3.314 0 6 2.24 6 5 0 1.85-1.208 3.46-3 4.326zM8 14c-.08 0-.158-.007-.238-.01L4 17v-3.99c-1.812-.994-3-2.642-3-4.51C1 5.462 4.134 3 8 3s7 2.462 7 5.5S11.866 14 8 14z"></path>
																			</svg>
																		</span><strong class="unit_hover">Message</strong>
																	</strong>
																</a>
															</li>
															<li class="drop-down-menu-link">
																<a class="js-analytics-click arrange arrange--middle arrange--6" href="#" data-analytics-label="dropdown_rewards-inactive">
																	<strong class="arrange_unit">
																		<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-cash-back icon--size-24 u-space-r1">
																			<svg class="icon_svg">
																				<path d="M13.632 11.153c1.49.283 2.765 1.012 2.765 2.752 0 1.683-1.296 2.78-3.402 2.978l.008.89H11.75v-.883c-2.547-.17-3.453-1.584-3.476-2.886h2.113c.03.616.502 1.146 1.41 1.267v-2.495l-.66-.133c-1.44-.29-2.668-1.13-2.668-2.75 0-1.713 1.443-2.66 3.294-2.823v-.91h1.26v.913c1.948.204 3.154 1.35 3.176 2.815h-2.05c-.016-.53-.42-1.083-1.163-1.21v2.34l.645.135zm-.645 4.11c.727-.057 1.252-.495 1.252-1.146 0-.56-.37-.927-1.12-1.125-.045-.006-.09-.02-.135-.028v2.3zm-1.19-6.592c-.66.074-1.148.46-1.148 1.057 0 .494.335.85.98 1.04.052.02.104.036.164.05V8.67zm9.13 4.12l-3.062-3.95h2.06c-1.27-2.854-4.193-4.862-7.603-4.862-4.57 0-8.29 3.6-8.29 8.024 0 4.426 3.72 8.026 8.29 8.026 3.566 0 6.604-2.195 7.772-5.26h2.148C21 18.936 17.026 22 12.322 22c-5.696 0-10.33-4.486-10.33-10S6.626 2 12.322 2c4.554 0 8.418 2.872 9.788 6.84h1.877l-3.06 3.95z"></path>
																			</svg>
																		</span><strong class="unit_hover">Cash Back</strong>
																	</strong>
																	<span class="arrange_unit">
																		<span class="ybadge ybadge-notification drop-down-menu-link_new-label">NEW</span>
																	</span>
																</a>
															</li>
															<li class="drop-down-menu-link">
																<a class="js-analytics-click arrange arrange--middle arrange--6" href="member_profile" data-analytics-label="Zprofile">
																	<strong class="arrange_unit">
																		<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-settings icon--size-24 u-space-r1">
																			<svg class="icon_svg">
																				<path d="M21.872 10.48c.076.497.128 1.002.128 1.52s-.05 1.022-.127 1.518l-3.165.475c-.14.47-.323.92-.552 1.343l1.9 2.57c-.3.408-.62.8-.976 1.156l-.018.018a10.05 10.05 0 0 1-1.154.975l-2.57-1.9a7 7 0 0 1-1.344.553l-.475 3.165a9.94 9.94 0 0 1-1.506.127h-.034c-.51 0-1.01-.052-1.5-.127l-.475-3.165a7 7 0 0 1-1.343-.553l-2.57 1.9c-.408-.3-.798-.62-1.155-.975l-.018-.018a10.068 10.068 0 0 1-.978-1.155l1.9-2.57a6.97 6.97 0 0 1-.552-1.344l-3.164-.475C2.052 13.022 2 12.518 2 12s.052-1.023.128-1.52l3.164-.475a7 7 0 0 1 .553-1.342l-1.9-2.57a10.035 10.035 0 0 1 2.148-2.15l2.57 1.9a7.015 7.015 0 0 1 1.343-.55l.475-3.166C10.98 2.052 11.486 2 12 2s1.023.052 1.52.127l.474 3.165c.47.14.92.323 1.342.552l2.57-1.9a10.044 10.044 0 0 1 2.15 2.148l-1.9 2.57c.23.424.412.874.552 1.343l3.164.475zM12 8.5a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7z"></path>
																			</svg>
																		</span><strong class="unit_hover">Account Settings</strong>
																	</strong>
																</a>
															</li>
														</ul>
														<ul class="drop-menu-group">
															<li class="drop-down-menu-link drop-down-menu-link--logout">
																<form action="member_logout" id="logout-form" name="logout-form">
																	<button type="submit" class="u-pseudo-link" id="header-log-out" data-analytics-label="logout">Log Out</button>
																</form>
															</li>
														</ul>
													</div>			
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		<div id="header_main_content_footer_wrap">
			<div id="footer_content_container">
				<div id="footer_container_arrange">
					<div id="footer_container_list">
						<div id="footer_list" style="width: 854px; display: inline-block;">
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
						<c:if test="${empty sessionScope.memberinfo}">
								<div id="footer_list_login_box">
									<a href="member_login?mode=login" id="footer_list_li_unit" style="color: white; font-weight: bold;">Log In</a>
								</div>
						</c:if>
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
		$('.drop-menu-link').click(function() {
			$('#topbar-account-wrap').toggle();
		});
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