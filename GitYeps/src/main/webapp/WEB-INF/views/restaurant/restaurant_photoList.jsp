<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Photos for ${getRest.rname}</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/event_list.css?ver=1"/>"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%@include file="../top.jsp" %>
<div class="main-content-wrap main-content-wrap--full" style="background: white;">
	<div class="restPhotoList-super-container" style="width: 960px; margin: 0 auto;padding: 15px 15px 36px 15px;">
		<div class="restPhotoList-container">
			<div class="js-media-landing_container">
				<div class="js-media-landing_header media-landing_header" style="margin-top: 18px;">
					<h1 class="js-media-landing_header_title" style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; margin-bottom: 6px; font-size: 30px; line-height: 1.2em; color: #333; padding-top: 6px; margin: 0 0 6px; display: block;">
						Photos for ${getRest.rname}
					</h1>
					<div class="section-header media-header--tabbed" style="    margin-bottom: 11px;border-bottom: 1px solid #e6e6e6;">
						<div class="arrange arrange--12 arrange--bottom" style="margin-left: -12px;margin-right: -12px;border-collapse: separate;border-spacing: 12px 0;    display: table;min-width: 100%;table-layout: auto;">
							<div class="arrange_unit arrange_unit--fill media-header_biz-listing" style=" margin-left: 6px;margin-right: 6px;border-collapse: collapse;border-spacing: 0 0;    vertical-align: bottom;    width: 100%;    box-sizing: border-box;display: table-cell;">
								<div class="media-block media-block biz-passport--slim" style="    position: relative;    display: flex;">
									<div class="media-avatar">
										<div class="photo-box pb-30s">
											<a href="#" class="js-analytics-click" style="color: #0073bb;text-decoration: none;cursor: pointer;">
												<img src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${getRest.rest_filename}" class="photo-box-img" width="30" height="30" style="outline: none;margin-top: 3px;border-radius: 4px;vertical-align: middle;">
											</a>
										</div>
									</div>
									<div class="media-story" style="-webkit-box-flex: 1;flex: 1;min-width: 0;min-height: 0;">
										<div class="media-title clearfix">
											<a href="#" class="biz-name js-analytics-click" style="font-weight: bold;color: #0073bb;text-decoration: none;cursor: pointer;">
												<span>${getRest.rname}</span>
											</a>
										</div>
										<div class="biz-passport_rating" style="margin-top: -3px; display:flex;">
											<div class="biz-rating biz-rating-medium clearfix" style="margin-bottom: 0;margin: 3px 0;">
												<div class="restList-star-rating-${starAvg}">
													<img class="offscreen" src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png" width="84" height="303"style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">
												</div>
												<span class="review-count rating-qualifier" style="font-size: 12px;line-height: 1.5em;    display: block;float: left;color: #666;font-weight: normal;">
													<span itemprop="reviewCount">${reviewCount}</span> reviews
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="arrange_unit nowrap media-header_actions" style="margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: bottom; box-sizing: border-box; display: table-cell; white-space: nowrap; ">
								<a class="ybtn ybtn--primary u-space-r1" href="#" style="color: white; text-decoration: none !important; box-shadow: 0 1px 1px rgba(0,0,0,0.3); background-color: #d90007; background: linear-gradient(#d90007, #c91400); display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid #8d0005; font-weight: bold; text-align: center; font-size: 14px; line-height: 1.28571em; padding: 5px 19px 6px; border-radius: 3px;border-collapse: collapse; white-space: nowrap;">
									<span aria-hidden="true" style="fill: currentColor; width: 24px; height: 24px;" class="icon">
									    <svg id="24x24_add_photo" height="100%" viewBox="0 0 24 24" width="100%">
									    	<path d="M19 20H5a3 3 0 0 1-3-3V9a3 3 0 0 1 3-3h2.184A2.99 2.99 0 0 1 10 4h4a2.99 2.99 0 0 1 2.816 2H19a3 3 0 0 1 3 3v8a3 3 0 0 1-3 3zM12.005 8.5a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zM13 14v1a1 1 0 0 1-2 0v-1h-1a1 1 0 0 1 0-2h1v-1a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2h-1z"></path>
									    </svg>
									</span>
									사진 추가
								</a>
							</div>
						</div>
						<div class="section-header_tabs section-header_tabs-search" style="display: flex;flex-direction: row;align-items: flex-end;border-top: none;    margin-top: 18px;">
							<div class="tab-navbars js-tab-navbars" style="display: inline-block; width: 75%;">
								<div class="media-header_root-navbar media-header_root-navbar--paged">
									<div class="tab-nav-container">
										<ul class="tab-nav js-tab-nav tab-nav--paged js-tab-nav--paged tab-nav--large js-tab-nav--large tab-nav--no-icon js-tab-nav--no-icon" style="display: inline; margin: 0 0 -1px; padding: 0; white-space: nowrap;">
											<div class="paged-scroll-container js-paged-scroll-container inactive-left-arrow inactive-right-arrow has-single-page" style="    overflow: hidden;margin: 0 -15px;    user-select: none;position: relative;    display: flex;-webkit-box-direction: normal; -webkit-box-orient: horizontal; flex-direction: row;padding: 0px 18px; z-index: 2;">
												<div class="paged-scroll-container_container" style="-webkit-box-flex: 1;flex-grow: 1;align-self: center;overflow: hidden;position: relative;white-space: nowrap;">
													<div class="js-scroll-container scroll-container" style="    transform: translateX(0px);    display: flex;-webkit-box-direction: normal;-webkit-box-orient: horizontal;    flex-direction: row;    transition: transform 400ms;width: 100%;">
														<li class="tab-nav_item" style="display: table-cell; vertical-align: middle;">
															<a href="#" class="tab-link" style="padding: 0 12px; padding-top: 6px; padding-bottom: 6px; color: #333; text-decoration: none; border-bottom: 3px solid #d32323; display: block; vertical-align: bottom; line-height: 1; white-space: nowrap; outline: 0;">
																<span style="font-weight: bold; vertical-align: middle; line-height: 30px; display: inline-block;">
																	All Photos
																</span>
																<span style="font-weight: bold; vertical-align: middle; line-height: 30px; display: inline-block;">
																	(${photoCount})
																</span>
															</a>
														</li>
													</div>
												</div>
											</div>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="media-landing js-media-landing" style="position: relative;">
					<div class="media-landing_gallery photos" style="height:auto;overflow:hidden;">
						<ul class="photo-box-grid photo-box-grid--highlight photo-box-grid--small clearfix lightbox-media-parent" style="margin-right: -12px; margin-top: 18px; display: flex;">
							<c:forEach items="${uploadFileList}" var="upload">
							<li style="transition: opacity 0.1s ease-out; width: 150px; float: left; margin: 0 12px 12px 0; display: list-item;">
								<div class="photo-box photo-box--interactive" style="height: 150px; position: relative;">
									<img class="photo-box-img" height="226" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${upload.filename}"  width="226" style="max-width: 100%; max-height: 100%; border-radius: 4px; vertical-align: middle;">
									<a class="biz-shim js-lightbox-media-link js-analytics-click" data-analytics-label="biz-photo" href="#" style="display: block; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: white; opacity: 0;    color: #0073bb;text-decoration: none;    cursor: pointer;"></a>
								</div>
							</li>
							</c:forEach>
						</ul><!-- 이미지 30장  -->
					</div>
					
					
					<div class="event_list_paging_section" style="font-size: 14px;">
						<div class="event_list_pagination_block">
							<div class="event_list_pagination_wrap">
								<div class="event_list_page_of_pages">
								<c:if test="${yepsPager.blockEnd == 0}">
									Page ${curPage} of 1
								</c:if>
								<c:if test="${yepsPager.blockEnd != 0}">
									Page ${curPage} of ${yepsPager.blockEnd}
								</c:if>
								</div>
<!-- 					페이징 처리!! 현재페이지는 span이 되고 나머지는 a로 -->
								<c:if test="${yepsPager.blockEnd != 1}">
								<div class="event_list_page_link_wrapper">
									<div class="event_list_page_link_wrap">
						
									<c:if test="${yepsPager.curBlock > 1}">
										<div class="event_list_next_block">
											<a class="event_list_next_block_action" href="javascript:list('1')">
												<span>Start</span>
											</a>
										</div>
									</c:if>

									<c:if test="${yepsPager.curBlock > 1}">
										<div class="event_list_next_block">
											<a class="event_list_next_block_action" href="javascript:list('${yepsPager.prevPage}')">
												<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
													<svg class="icon_svg">
														<path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>
													</svg>
												</span>
												<span>Previous</span>
											</a>
										</div>
									</c:if>
						
						
									<c:forEach var="num" begin="${yepsPager.blockBegin}" end="${yepsPager.blockEnd}">
										<div class="event_list_page_link_option">
										<c:choose>
											<c:when test="${num == yepsPager.curPage}">
												<span class="event_list_page_option_action">
													${num}
												</span>
											</c:when>
											<c:otherwise>
												<a href="javascript:list('${num}')" class="event_list_page_option_link_action">
												${num}
												</a>
											</c:otherwise>
										</c:choose>
										</div>
									</c:forEach>
						
									<c:if test="${yepsPager.curBlock <= yepsPager.totBlock}">
										<div class="event_list_next_block">
											<a class="event_list_next_block_action" href="javascript:list('${yepsPager.nextPage}')">
												<span>Next</span>
												<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
													<svg class="icon_svg">
														<path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
													</svg>
												</span>
											</a>
										</div>
									</c:if>
							
									<c:if test="${yepsPager.curPage <= yepsPager.totPage}">
										<div class="event_list_next_block">
											<a class="event_list_next_block_action" href="javascript:list('${yepsPager.totPage}')">
												<span>End</span>
											</a>
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
					
				</div>
			</div>
		</div>
	</div>

</div>

<script>
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="restaurant_photoList?curPage="+page;
    }
</script>
</body>
</html>
<%@include file="../bottom.jsp" %>