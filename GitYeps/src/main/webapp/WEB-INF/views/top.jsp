<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="style.jsp"%>
<script>
	$(document).ready(function() {
		$('#header_searchbutton').hover(function() {
			$(this).css('background', '#9b1a1a');
		})
		$('#header_searchbutton').mouseleave(function() {
			$(this).css('background', '#bd1f1f');
		})
	});
</script>
<div id="page_header">
	<div id="header_main_content_wrap">
		<div id="main_content_wrap">
			<div id="content_container">
				<div id="content_container_arrange">
					<div id="yeps_img">
						<a href="main_page" style="display: block; width:100%;"><img src="getYelp_Logo" style="width: 80px; height: 40px;"></a>
					</div>
						<div id="yeps_search_arrange_wrap" style="display:table-cell; vertical-align: bottom;">
						<form name="page_header_form" method="post" style="margin: 0; padding: 0; width: 100%;">
							<div id="yeps_search_arrange">
								<label id="find_label">
									<span id="label_span">Find</span>
									<span id="label_input_span" style="border-right: 1px solid #999;">
										<input type="text" maxlength="64" id="page_header_inputs" autocomplete="off" value placeholder="분야별 검색"
												aria-autocomplete="list" tabindex="1" data-component-bound="true" style="display: inline-block; background: transparent; position: relative; box-sizing: border-box;">
										<input type="hidden" maxlength="64" data-component-bound="true" name="find_input" value>		
									</span>
								</label>
							</div>
							<div id="yeps_search_arrange" style="float: left;">
								<label id="yeps_search_arrange_label">
									<span id="label_span">Near</span>
									<span id="label_input_span" style="border-right: 1px solid #999;">
										<input type="text" maxlength="80" id="page_header_inputs" autocomplete="off" placeholder="지역별 검색" 
												data-query="Las Vegas, NV" aria-autocomplete="list" tabindex="2" data-component-bound="true" style="display: inline-block; background: transparent; position: relative; box-sizing: border-box;">
										<input type="hidden" maxlength="80" data-component-bound="true" name="find_loc" value="Las Vegas, NV">
									</span>
								</label>
							</div>
							<div id="yeps_search_arrange" style="width: 32%; float: left;">
								<label id="yeps_search_arrange_label">
									<span id="search_input_span">
										<input type="text" maxlength="80" id="page_header_inputs" autocomplete="on" placeholder="검색어를 입력하세요." style="display: inline-block; background: transparent; position: relative; box-sizing: border-box;">
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
									<div>
										<a href="#" id="footer_list_li_unit">
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
										<div>
											<!-- 아래방향 표시 눌렀을 때 구현해야함!! -->
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
								<li id="footer_list_li">
									<div>
										<a href="#" id="footer_list_li_unit"> 
											Write a Review
										</a>
									</div>
								</li>
								<li id="footer_list_li">
									<div>
										<a href="event_list" id="footer_list_li_unit">
											Events
										</a>
									</div>
								</li>
								<li id="footer_list_li">
									<div>
										<a href="#" id="footer_list_li_unit">
											Message
										</a>
									</div>
								</li>
							</ul>
						</div>
						<div id="footer_list_login_box" style="margin-left: 7px; width: 12%; display: inline-block; text-align: center; box-sizing: border-box;">
							<a href="#" id="footer_list_li_unit" style="color: white; font-weight: bold;">Log In</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>