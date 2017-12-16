<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<html>
<head>
	<title>${eventDTO.eventname}</title>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=HXle5j7nJaMnyv_Zey_M&submodules=geocoder"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css?ver=1"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_content.css?ver=1"/>"/>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
</head>
	<%@ include file="../top.jsp"%>
	<div id="event_content_header_container">
		<div id="event_content_header_content">
			<div id="event_header_eventname">
				<div id="event_header_eventname_detail">
					<h1>${eventDTO.eventname}</h1>
					<div id="eventname_detail_category">
						<span>
							<a href="#">${eventDTO.event_category}</a>
						</span>
					</div>
				</div>
			</div>
			<div id="photo_map_container">
				<div id="photo_storeInfo_wrap">
					<div id="photo_storeInfo">
						<div id="photo_box">
							<div id="photo_box_detail">
								<div id="photo_box_add_action">
									<a id="photo_box_action" href="event_update_photo?evnum=${eventDTO.evnum}"> 										
										<span id="camera_icon" aria-hidden="true"> 
											<!-- before -->
											<svg>
												<path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 4.75a4.25 4.25 0 1 0 0 8.5 4.25 4.25 0 0 0 0-8.5zM11 10h-1v1a1 1 0 0 1-2 0v-1H7a1 1 0 0 1 0-2h1V7a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2z"></path>
											</svg>
										</span>
										<span id="event_content_photo_tooltip_wrap">
											<span id="event_content_photo_tootip">
												Add Photo
											</span>
										</span>
										<c:if test="${empty fileList}">
											<span>
												사진을 등록해주세요.
											</span>
										</c:if>
									</a>
								</div>
								
								<div id="photo_slideshow_parent">
									<div id="photo_slideshow_slide">
										<div class="cycle-slideshow" data-cycle-speed="6000" id="slideshow_img">
											<!-- 사진 눌렀을 때 팝업!! -->
											<a href="#">
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="card_body">
							<div id="event_detail_info">
								<ul id="event_info_list">
									<li id="location_info">
										<div style="display:none;">
										</div>
										<div id="location_block">
											<div id="location_icon_wrap">
												<span id="content_location_icon">
													<svg>
														<path d="M12 2C8.13 2 5 5.13 5 9c0 2.61 1.43 4.88 3.54 6.08L12 22l3.46-6.92A6.987 6.987 0 0 0 19 9c0-3.87-3.13-7-7-7zm0 9.5a2.5 2.5 0 0 1 0-5 2.5 2.5 0 0 1 0 5z"></path>
													</svg>
												</span>
											</div>
											
											<div style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
												<div id="storename_line">
													<a href="#" style="font-weight: bold;">음식점명(식당 상세보기로 이동)</a>
												</div>
											
												<div id="estimation_line">
													<div id="rating_star">
														<img id="rating_star_img" width="84px" height="303px" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png">
													</div>
													<span>리뷰 총 갯수</span> 											
												</div>
										
												<address id="event_store_address">${eventDTO.store_address}</address>
												<span id="event_store_phone_numbebr">--- 전화번호 ---</span>
											</div>
										</div>
									</li>
									
									<li>
										<div id="periode_block">
											<div id="calender_icon_wrap">
												<span id="calender_icon" aria-hidden="true">
													<svg style="overflow: hidden; position: absolute; width: 100%; height: 100%; fill: inherit; display: block; left: 0; top: 0; right: 0; bottom: 0;"> 
														<path d="M18 21H6a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3 1 1 0 0 1 2 0h8a1 1 0 0 1 2 0 3 3 0 0 1 3 3v12a3 3 0 0 1-3 3zm1-13H5v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1V8zm-6 5h4v4h-4v-4z"></path>
													</svg>
												</span>
											</div>
										
											<div id="periode_info_box">
												<div id="event_date">
													<div id="startDate">
														<b>FROM: </b>${eventDTO.start_date} ${eventDTO.start_time}
													</div>
													<!-- 종료일이 존재한다면 -->
													<c:if test="${!empty eventDTO.end_date}">
														<div id="endDate">
															<b>TO: </b>${eventDTO.end_date} ${eventDTO.end_time}
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</li>
									
									<li>
										<div style="text-align: -webkit-match-parent; border-right: 6px solid transparent; border-left: none;">
											<span id="event_details_sale_info">
												<span id="ticket_icon">
													<svg> 
														<path d="M17.303 6.697a2 2 0 0 1 0-2.83L14.12.687 10.056 4.75l2.122 2.12-1.06 1.062-2.122-2.12-8.31 8.307L3.87 17.3a2 2 0 1 1 2.83 2.83l3.18 3.18 8.31-8.308-2.123-2.12 1.06-1.062 2.122 2.122 4.064-4.066-3.182-3.183a2 2 0 0 1-2.83 0zm-1.59 3.712l-1.06 1.06-2.123-2.124 1.06-1.06 2.122 2.12z"></path>								
													</svg>
												</span>
												Discount
											</span>
										</div>
										<div id="event_discount_content">
											<span>
												${fn:replace(eventDTO.discount,crcn,br)}
											</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div id="map_location_wrap">
					<div id="event_detail_map_location">
						<div id="event_map_container">
							<div id="event_map"> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	
	
	
	<div id="event_content_super_container">
		<div id="event_content_detail_container">
			<div id="event_content_detail_left_container">
				<div id="event_content_description">
					<h3>What/Why:</h3>
					<p style="margin-bottom: 12px;">
						${fn:replace(eventDTO.event_content,crcn,br)}
					</p>
					<div id="event_content_description_bottom">
						<div id="event_content_description_bottom_flag_box">
							<!-- 눌렀을 때 관리자한테 메세지 보내는 기능 해야함 -->
							<a id="event_content_description_bottom_flag_icon_action" href="#" data-popup-open="popup-1">
								<span id="event_content_description_bottom_flag_icon">
									<svg id="event_content_flag_icon" >
										<path d="M6 10V3c4.976 1.098 4.024-1 8 0v7c-4.024-.976-3.024 1.024-8 0zM4 2h1v14H4V2z"></path>
									</svg>
								</span>
								<span id="event_content_flag_tootip_wrap">
									<span id="event_content_flag_tootip"> 									
										부적절한 이벤트 신고
									</span>
								</span>
							</a>
						</div>
					</div>
				</div>
				
				<div id="event_content_comment_block_wrap">
					<div id="event_content_comment_block">
						<div id="event_content_comment_header">
							<h3>Discuss This Event</h3>
						</div>
						<p style="margin-bottom: 12px;">
							No one has commented on this event yet.
						</p>
						<form name="eventReview" method="post" action="eventReview_insert" style="display: block; margin-bottom: 10px; margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline;">
							<input type="hidden" name="evnum" value="${eventDTO.evnum}">
							<input type="hidden" name="mnum" value="">
							<input type="hidden" name="" value="">
							<div id="event_content_comment_reply_box">
								<label>
									Enter Your Reply
								</label>
								<!-- 로그인 했을 때만 textarea를 볼 수있음!!!! -->
								<div id="event_content_comment_reply">
									<textarea name="eventReview_content" id="event_review_content"></textarea>
								</div>
								<fieldset>
									<button id="event_reply_button" type="submit" value="submit">
										<span>Post</span>	
									</button> 
								</fieldset>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="event_content_detail_right_container">
				<div id="event_content_detail_subscription" style="margin-bottom: 18px;">
					<div id="event_content_detail_subscription_action" style="margin-bottom: 0;">
						<h3>이벤트에 관심있어요!</h3>
						<div id="event_subscription_button_wrap">
							<div id="event_subscription_buttons">
								<div id="event_subscription_join_button">
									<form action="#" method="post" name="event_subscription_join_form" style="margin-bottom: 18px; padding: 0; border: 0; font-size: 100%; display: block;">
										<input type="hidden" name="뭐가 들어가야 될지 생각해보자">
										<input type="hidden" name="뭐가 들어가야 될지 생각해보자">
										<button type="submit" value="submit" id="event_subscript_join_button">
											<span>참여할래요!</span>	
										</button>
									</form>
								</div>
								<div id="event_subscription_good_button" style="flex: 1; min-width: 0; min-height: 0; display: block; margin-left: 3px; margin-right: 3px; border-collapse: collapse; border-spacing: 0 0; vertical-align: top;">
									<form action="#" method="post" name="event_subscription_join_form" style="margin-bottom: 18px; padding: 0; border: 0; font-size: 100%; display: block;">
										<input type="hidden" name="뭐가 들어가야 될지 생각해보자">
										<input type="hidden" name="뭐가 들어가야 될지 생각해보자">
										<button type="submit" value="submit" id="event_subscript_interested_button"> 											
											<span>관심있어요!</span>
										</button>
									</form>
								</div>
							</div>
						</div>
						
						<div id="event_subscription_whos_in_section" style="margin-bottom: 18px;">
							<div id="event_subscription_whos_in_line">
								<div id="event_subscription_whos_in">
									<h3>누가 참여할까요?</h3>
								</div>
								<div id="event_subscription_whos_in_response">
									<span>total responses</span>
								</div>
							</div>
							
							<ul id="whos_in_list">
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">
											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">
											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">
											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
							
							<a href="#" style="font-size: 12px;">전체 유저 보기</a>
						</div>
						
						
						
						<div id="event_subscription_interested_section">
							<div id="event_subscription_interested_line">
								<div id="event_subscription_interested">
									<h3>관심있어요</h3>
								</div>
								<div id="event_subscription_interested_response">
									<span>
										total response
									</span>
								</div>
							</div>
							
							
							<ul id="interested_list">
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">
											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								
								
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#" style="outline: none; margin-top: 3px; border-radius: 4px; vertical-align: middle;">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								
								<li style="margin-bottom: 12px;">
									<div id="event_subscription_user_info_block">
										<div id="event_subscription_user_info_profile">
											<div id="event_subscription_user_profile_photo">
												<!-- 유저 프로필로 이동 -->
												<a href="#">
													<img id="event_subscription_user_photo" height="30" weight="30" src="#">
												</a>
											</div>
										</div>
										<div id="event_subscription_simple_user_info">
											<ul>
												<li id="event_subscription_user_name">
													<a href="#" id="event_subscription_display_user_name">
														유저 아이디
													</a>
												</li>
											</ul>
											<ul>
												<li id="event_subscription_friend_count">
													<span id="event_subscription_icon">
														<svg>
															<g>
																<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path><path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
															</g>
														</svg>
													</span>
													<b>999</b>
												</li>
												<li id="event_subscription_review_count">
													<span>
														<svg>
															<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
														</svg>
													</span>
													<b>999</b>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
							
							<a href="#" style="font-size: 12px;">전체 유저 보기</a>
						</div>
					</div>
				</div>
				
				
				
				<div id="other_events_this_week" style="margin-bottom: 0;">
					<h3>금주 추천 이벤트</h3>
					<ul>
						<c:forEach var="this_week_eventDTO" items="${thisWeek_EventList}">
						<li style="margin-bottom: 12px; display: list-item; text-align: -webkit-match-parent;">
							<div id="this_week_popular_events">
								<div id="this_week_popular_events_photo_wrap">
									<div id="this_week_popular_events_photo" style="width: 60px; height: 60px;">
										<c:forEach var="this_week_fileDTO" items="${thisWeek_EventFileList}">
										<c:if test="${this_week_eventDTO.filenum == this_week_fileDTO.filenum}">
											<a href="event_content?evnum=${this_week_eventDTO.evnum}" style="margin: 0; padding: 0; border: 0; cursor: pointer;">
												<img src="getImage/${this_week_fileDTO.origin_filename}" style="outline: none; border-radius: 4px; vertical-align: middle; margin: 0; padding: 0; border: 0; height: 60px; width: 60px;">
											</a>
										</c:if>
										</c:forEach>
									</div>
								</div>
								
								<div id="this_week_popular_events_info">
									<strong>
										<a href="event_content?evnum=${this_week_eventDTO.evnum}" style="font-weight: bold;">
											${this_week_eventDTO.eventname}
										</a>
									</strong>
									<small>
										${this_week_eventDTO.start_date}, ${this_week_eventDTO.start_time} – ${this_week_eventDTO.end_date}, ${this_week_eventDTO.end_time}
									</small>
									<div>
										<small style="color: #999; font-weight: normal; font-size: 12px; line-height: 1.5em;">
											999명 관심있어요
										</small>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
					<a href="event_list" style="font-size: 12px;">더 많은 이벤트 보기</a>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="flag_content_popup" data-popup="popup-1">
    	<div class="popup-inner" style="width: 465px; z-index: 1;">
    	    <div id="flag_content_popup_title">
    	    	<div id="flag_content_popup_close" data-popup-close="popup-1">
    				<h4 style="margin-top: -20px;">×</h4>
    			</div>
    	    	<h2>
    	    		부적절한 내용 신고
    	    	</h2>
    	    </div>
    	    <div id="flag_content_popup_error_message">
    	    	<span style="color: #d32323;">
    	    		<span id="popup_error_message_icon">
    	    			<svg>
    	    				<path d="M9 1a8 8 0 1 0 0 16A8 8 0 0 0 9 1zM8 5a1 1 0 0 1 2 0v4a1 1 0 0 1-2 0V5zm1 9a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"></path>
    	    			</svg>
    	    		</span>
    	    		신고할 내용을 작성해주세요.
    	    	</span>
    	    </div>
    	    
    	    <div id="flag_popup_description">
    	    	<div>
    	    		<p>지금 보고계신 콘텐츠의 수정이 필요한 부분과 실제 이벤트에서 어떠한 사항을 위반하고 있는지 알려 주시기 바랍니다.</p>
    	    		<form name="flag_popup_form" id="flag_popup_form" action="#" method="post" onsubmit="return check()" style="margin-bottoom: 0;">
    	    			<div id="flag_popup_descripte_container">
    	    				<div id="flag_popup_descripte">
    	    					<label id="flag_popup_descripte_alert">신고내용을 상세하게 작성해주세요.</label>
    	    					<textarea id="flag_popup_descripte_field" name="flag_popup_descripte_field"></textarea>
    	    				</div>
    	    			</div>
    	    		</form>
    	    	</div>
    	    </div>
     	  	<div id="flag_popup_footer">
     	  		<div id="flag_popup_buttons">
     	  			<button id="flag_popup_submit_button" type="submit" value="submit">
     	  				<span>제출하기</span>
     	  			</button>
     	  			<a href="#" data-popup-close="popup-1">
    					Close
    				</a>
     	  		</div>
     	  	</div>
    	</div>
	</div>
	
	<script type="text/javascript">
		var store_address = '${eventDTO.roadAddrPart1}';
		
		naver.maps.Service.geocode({address : store_address}, function(status, response) {
			var result = response.result;
			var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			map.setCenter(myaddr);
			
			var marker = new naver.maps.Marker({
				position: myaddr,
				map: map
			});
			
			naver.maps.Event.addListener(marker, "click", function(e) {
				if(infowindow.getMap()) {
					infowindow.close();
				} else {
					infowindow.open(map, marker);
				}
			});
			var contentString = [
				'<div>',
					'<div style="padding: 8px; background: white;">',
						'<div style="display: inline-block;">',
							'<div id="map_inner_eventphoto" style="float: left;">',
								'<img src="getImage/${fileList[0].origin_filename}" style="outline: none; width: 100px; height: 100px;">',
							'</div>',
							'<div id="map_inner_eventname" style="margin-left: 5px; float: left; width: 150px; heght: 100px; font-size: 12px;">',
								'<a href="event_content?evnum=${eventDTO.evnum}">${eventDTO.eventname}</a>',
								'<div style="margin-top: 5px;">',
									'${eventDTO.roadAddrPart1}' + '${eventDTO.roadAddrPart2}' + '${eventDTO.addrDetail}',
								'</div>',
							'</div>',
						'</div>',
					'</div>',
				'</div>'].join('');
			
			var infowindow = new naver.maps.InfoWindow({
				content: contentString
			});
		});
		var map = new naver.maps.Map('event_map', {
			zoom: 12, //지도의 초기 줌 레벨
	        minZoom: 10, //지도의 최소 줌 레벨
	        disableKineticPan: true,
	        tileTransition: true,
	        draggable: true,
            pinchZoom: true,
            scrollWheel: true,
            keyboardShortcuts: true,
            disableDoubleTapZoom: false,
            disableDoubleClickZoom: true,
            disableTwoFingerTapZoom: true
		});
		
		var list = new Array();
		<c:forEach var="fileDTO" items="${fileList}">
			list.push("${fileDTO.origin_filename}");
		</c:forEach>
		
		for(var i = 0; i < list.length; i++) {
			var img = document.createElement('img');			
			img.src = 'getImage/' + list[i];
			img.style.cursor = 'pointer';
			img.style.width = '100%';
			img.style.height = '100%';
			img.onclick = function() {location.href="#"};
			document.getElementById('slideshow_img').appendChild(img);
		}
		
		function check() {
			if(flag_popup_form.flag_popup_descripte_field.value == "") {
				document.getElementById('flag_content_popup_error_message').style.display = 'block';
				document.getElementById('flag_popup_descripte_alert').style.color = '#d32323';
				return false;
			}
		}
	</script>
	<script>
   		//----- OPEN
    	$('[data-popup-open]').on('click', function(e)  {
        	var targeted_popup_class = jQuery(this).attr('data-popup-open');
        	$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
        	$('body').css('overflow','hidden');
        	
 			e.stopPropagation();
        	e.preventDefault();
    	});
 
    	//----- CLOSE
    	$('[data-popup-close]').on('click', function(e)  {
        	var targeted_popup_class = jQuery(this).attr('data-popup-close');
        	$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
        	$('body').css('overflow','auto');
        	e.stopPropagation();
        	e.preventDefault();
    	});
	
		$(document).ready(function() {
			$('#photo_box_action').hover(function() {
				$('#photo_box_action').css('background', 'rgba(0, 0, 0, 0.6)');
				$('#event_content_photo_tooltip_wrap').css('left', '16px');
			})
			
			$('#photo_box_action').mouseleave(function() {
				$('#photo_box_action').css('background', 'rgba(0, 0, 0, 0.3)');
				$('#event_content_photo_tooltip_wrap').css('left', '-9999px');
			})
			
			$('#event_content_description_bottom_flag_icon_action').hover(function() {
				$('#event_content_description_bottom_flag_icon').css('fill', 'black');
				$('#event_content_flag_tootip_wrap').css('left', '13px');
			})
			
			$('#event_content_description_bottom_flag_icon_action').mouseleave(function() {
				$('#event_content_description_bottom_flag_icon').css('fill', 'currentColor');
				$('#event_content_flag_tootip_wrap').css('left', '-9999px');
			})
			
			$('#event_reply_button').hover(function() {
				$('#event_reply_button').css('background', 'red');
			})
			
			$('#event_reply_button').mouseleave(function() {
				$('#event_reply_button').css('background', '#d90007');
			})
			
			$('#event_subscript_join_button').hover(function() {
				$('#event_subscript_join_button').css('background', 'red');
			})
			
			$('#event_subscript_join_button').mouseleave(function() {
				$('#event_subscript_join_button').css('background', '#d90007');
			})
			
			$('#event_subscript_interested_button').hover(function() {
				$('#event_subscript_interested_button').css('background', 'white');
			})
			
			$('#event_subscript_interested_button').mouseleave(function() {
				$('#event_subscript_interested_button').css('background', '#f7f7f7');
			})
			
			$('#flag_popup_submit_button').hover(function() {
				$('#flag_popup_submit_button').css('background', 'red');
			})
			
			$('#flag_popup_submit_button').mouseleave(function() {
				$('#flag_popup_submit_button').css('background', '#d90007');
			})
			
			$('#flag_popup_submit_button').click(function() {
				$('#flag_popup_form').submit();
			})
		});
	</script>
<%@ include file="../bottom.jsp"%>