<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Photos for ${getRest.rname}</title>
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
											<div class="paged-scroll-container js-paged-scroll-container inactive-left-arrow inactive-right-arrow has-single-page" style="    overflow: hidden;margin: 0 -15px;    user-select: none;position: relative;    display: flex;-webkit-box-direction: normal; -webkit-box-orient: horizontal;    flex-direction: row;padding: 0px 18px; z-index: 2;">
<!-- 												<div class="js-paged-scroll-container_arrow-left paged-scroll-container_arrow-left" style="    cursor: pointer;    display: flex;align-items: center;"> -->
<!-- 													<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-chevron-left icon--size-24 paged-scroll-container_arrow-left-inner"> -->
<!-- 													    <svg id="24x24_chevron_left" height="100%" viewBox="0 0 24 24" width="100%"> -->
<!-- 													    	<path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path> -->
<!-- 													    </svg> -->
<!-- 													</span> -->
<!-- 												</div> -->
												<div class="paged-scroll-container_container" style="-webkit-box-flex: 1;flex-grow: 1;align-self: center;overflow: hidden;position: relative;white-space: nowrap;">
													<div class="js-scroll-container scroll-container" style="    transform: translateX(0px);    display: flex;-webkit-box-direction: normal;-webkit-box-orient: horizontal;    flex-direction: row;    transition: transform 400ms;width: 100%;">
														<li class="tab-nav_item" style="display: table-cell; vertical-align: middle;">
															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;">
																<span class="tab-link_label" style="font-weight: bold;vertical-align: middle;line-height: 30px;display: inline-block;">
																	All Photos
																</span>
																<span class="tab-link_count" style=" font-weight: bold;vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;">
																	(${photoCount})
																</span>
															</a>
														</li>
														
<!-- 														<li class="tab-nav_item" style="display: table-cell;vertical-align: middle;text-align: -webkit-match-parent;"> -->
<!-- 															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;"> -->
<!-- 																<span class="tab-link_label" style="vertical-align: middle;line-height: 30px;display: inline-block;"> -->
<!-- 																	Food -->
<!-- 																</span> -->
<!-- 																<span class="tab-link_count" style="vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;"> -->
<!-- 																	(4600) -->
<!-- 																</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="tab-nav_item" style="display: table-cell;vertical-align: middle;text-align: -webkit-match-parent;"> -->
<!-- 															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;"> -->
<!-- 																<span class="tab-link_label" style="vertical-align: middle;line-height: 30px;display: inline-block;"> -->
<!-- 																	Inside -->
<!-- 																</span> -->
<!-- 																<span class="tab-link_count" style="vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;"> -->
<!-- 																	(57) -->
<!-- 																</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="tab-nav_item" style="display: table-cell;vertical-align: middle;text-align: -webkit-match-parent;"> -->
<!-- 															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;"> -->
<!-- 																<span class="tab-link_label" style="vertical-align: middle;line-height: 30px;display: inline-block;"> -->
<!-- 																	Menu -->
<!-- 																</span> -->
<!-- 																<span class="tab-link_count" style="vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;"> -->
<!-- 																	(49) -->
<!-- 																</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="tab-nav_item" style="display: table-cell;vertical-align: middle;text-align: -webkit-match-parent;"> -->
<!-- 															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;"> -->
<!-- 																<span class="tab-link_label" style="vertical-align: middle;line-height: 30px;display: inline-block;"> -->
<!-- 																	Drink -->
<!-- 																</span> -->
<!-- 																<span class="tab-link_count" style="vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;"> -->
<!-- 																	(49) -->
<!-- 																</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="tab-nav_item" style="display: table-cell;vertical-align: middle;text-align: -webkit-match-parent;"> -->
<!-- 															<a href="#" class="tab-link js-tab-link tab-link--nav js-tab-link--nav is-selected" style=" padding-top: 6px;padding-bottom: 6px;    color: #333;text-decoration: none;border-bottom-color: #d32323;    padding: 0 12px;border-top: 3px solid transparent;border-bottom: 3px solid transparent;    display: block;vertical-align: bottom;line-height: 1;white-space: nowrap;outline: 0;cursor: pointer; text-align: -webkit-match-parent;"> -->
<!-- 																<span class="tab-link_label" style="vertical-align: middle;line-height: 30px;display: inline-block;"> -->
<!-- 																	Outside -->
<!-- 																</span> -->
<!-- 																<span class="tab-link_count" style="vertical-align: middle;line-height: 30px;padding-left: 3px;display: inline-block;"> -->
<!-- 																	(42) -->
<!-- 																</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
													</div>
												</div>
<!-- 												<div class="js-paged-scroll-container_arrow-right paged-scroll-container_arrow-right" style="    cursor: pointer;    display: flex;align-items: center;"> -->
<!-- 													<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-chevron-right icon--size-24 paged-scroll-container_arrow-right-inner"> -->
<!-- 													   <svg id="24x24_chevron_right" height="100%" viewBox="0 0 24 24" width="100%"> -->
<!-- 													   		<path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path> -->
<!-- 													   </svg> -->
<!-- 													</span> -->
<!-- 												</div> -->
											</div>
										</ul>
									</div>
								</div>
							</div>
							<div class="caption-search-form js-caption-search-form" style="    display: inline-block;width: 25%;margin-right: 6px;">
								<form class="yform yform--continuous arrange" name="restPhotoList" method="post" action="" style="margin-bottom: 10px;    display: table;min-width: 100%;table-layout: auto;">
									<label for="restPhotoList" class="offscreen" style="display: inline-block;font-weight: bold;margin: 0 0 6px;    clip: rect(0 0 0 0); position: absolute;left: -9999px;top: auto;overflow: hidden; width: 1px;height: 1px;cursor: default;">Search photos...</label>
									<div class="arrange_unit arrange_unit--fill" style=" width: 100%;    box-sizing: border-box;display: table-cell;vertical-align: top;">
										<input type="text" placeholder="Search photos..." name="restPhotoList"  autocomplete="off" style=" margin: 0;    display: block;    box-sizing: border-box;width: 100%;    padding: 5px 9px;background: #fff;border: 1px solid #999;border-radius: 3px;font-size: 14px;    line-height: 1.29em;    color: inherit;font: inherit;    font-weight: normal;    -webkit-appearance: textfield;    -webkit-rtl-ordering: logical;cursor: text;    text-rendering: auto;    letter-spacing: normal;word-spacing: normal;text-transform: none;text-indent: 0px;text-shadow: none;    text-align: start;webkit-writing-mode: horizontal-tb;">
									</div>
									<div class="arrange_unit" style="    box-sizing: border-box;display: table-cell;vertical-align: top;">
										<button type="submit" value="submit" class="ybtn ybtn--primary ybtn--small" style="    position: relative;left: -4px; width: calc(100% + 4px);border-radius: 0 3px 3px 0;    box-shadow: none;    padding: 5px 8px; font-size: 12px;line-height: 1.5em;    color: white;border-color: #8d0005;    background-color: #d90007;    background: linear-gradient(#d90007, #c91400);    display: inline-block;vertical-align: middle;margin: 0;cursor: pointer;border: 1px solid;font-weight: bold;text-align: center;    user-select: none;    overflow: visible;    font: inherit;    align-items: flex-start;    box-sizing: border-box;    text-rendering: auto;    letter-spacing: normal;word-spacing: normal;text-transform: none;text-indent: 0px;text-shadow: none;    -webkit-writing-mode: horizontal-tb;    -webkit-appearance: button;">
											<span>
												<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-search-small icon--size-18 icon--inverse icon--fallback-inverted">
										    <svg id="18x18_search_small" height="100%" viewBox="0 0 18 18" width="100%">
										    	<path d="M15.913 14.224a1.324 1.324 0 0 0-.3-.466h.01l-3.378-3.376a5.49 5.49 0 0 0 .802-2.857 5.523 5.523 0 1 0-5.522 5.52 5.49 5.49 0 0 0 2.856-.8l3.37 3.368.006.003a1.364 1.364 0 0 0 .93.384C15.41 16 16 15.41 16 14.684c0-.163-.032-.317-.086-.46zM7.525 10.94a3.422 3.422 0 0 1-3.418-3.416 3.422 3.422 0 0 1 3.418-3.417 3.422 3.422 0 0 1 3.416 3.417 3.42 3.42 0 0 1-3.413 3.416z"></path>
										    </svg>
												</span>
											</span>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="media-landing js-media-landing" style="position: relative;">
					
					
					<div class="media-landing_gallery photos" style="height:auto;overflow:hidden;">
						<ul class="photo-box-grid photo-box-grid--highlight photo-box-grid--small clearfix lightbox-media-parent" style="margin-right: -12px;    transform-style: preserve-3d;margin-top: 18px;list-style: none;display: block;">
							<c:forEach items="${uploadFileList}" var="upload">
							<li style="transition: opacity 0.1s ease-out;    width: 150px;float: left;margin: 0 12px 12px 0;    display: list-item;text-align: -webkit-match-parent;">
								<div class="photo-box photo-box--interactive" style="height: 150px;    position: relative;">
									<img  class="photo-box-img" height="226" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${upload.filename }"  width="226" style="max-width: 100%;max-height: 100%;    border-radius: 4px;vertical-align: middle;">
									<a class="biz-shim js-lightbox-media-link js-analytics-click" data-analytics-label="biz-photo" href="#" style="display: block;position: absolute;top: 0;left: 0;width: 100%;height: 100%;background-color: white;opacity: 0;    color: #0073bb;text-decoration: none;    cursor: pointer;"></a>
								</div>
							</li>
							</c:forEach>
						</ul><!-- 이미지 30장  -->
					</div>
					
					<div class="media-landing_footer" style="margin-top: 6px;">
						<div class="media-pager" style="    border-top: 1px solid #e6e6e6;">
							<div class="pagination-block" style="border-bottom: 1px solid #e6e6e6;">
								<div class="arrange arrange--stack arrange--baseline arrange--6" style="margin-left: -6px;margin-right: -6px;border-collapse: separate;border-spacing: 6px 0;    display: table;min-width: 100%;table-layout: auto;">
									<div class="page-of-pages arrange_unit arrange_unit--fill" style="white-space: nowrap;padding: 11px 0;    margin-left: 3px;margin-right: 3px;border-collapse: collapse;border-spacing: 0 0;vertical-align: baseline;    width: 100%;    box-sizing: border-box;display: table-cell;">
										Page 2 of 40
									</div>
									<div class="pagination-links arrange_unit" style="margin-left: 3px;margin-right: 3px;border-collapse: collapse;border-spacing: 0 0;vertical-align: baseline;    box-sizing: border-box;display: table-cell;white-space: nowrap;">
										<div class="arrange arrange--baseline" style=" display: table;min-width: 100%;table-layout: auto;">
							
								
										</div>
									</div>
								</div>
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