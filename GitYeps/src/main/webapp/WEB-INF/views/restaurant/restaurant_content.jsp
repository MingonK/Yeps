<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>${getRest.rname}</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/review.css?ver=2"/>"/>

<title>레스토랑</title>
</head>
<%@include file="../top.jsp" %>
	<div class="main" style="background: white;">
	<div class="top-shelf" style="overflow: hidden; min-width: 990px; padding-bottom: 24px; margin-bottom: -18px; z-index: 1; width: 100%; position: relative; padding-top: 15px;">
		<div class="content-container js-biz-details" style="width: 960px;margin: 0 auto;padding: 0 15px;">
			<div class="biz-page-header clearfix" style="position: relative;display: flex;-webkit-box-align: center;align-items: center;width: 100%;margin-bottom: 13px;font-size: 16px;line-height: 1.3125em;">
					<div class="biz-page-header-left claim-status" style="-webkit-box-flex: 1;flex: 1;min-width: 0;min-height: 0;padding-right: 30px;">
						<div class="u-space-t1" style="margin-top: 6px !important;">
						<h1
							style="display: inline; padding-top: 0px; font-size: 36px; line-height: 1.16667em; margin-bottom: 6px; text-shadow: 0 1px rgba(255, 255, 255, 0.7); word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; color: #333; margin: 0 0 6px;">${getRest.rname}</h1>
					</div>
						<div class="biz-main-info embossed-text-white"style="margin-top: 9px;text-shadow: 0 1px rgba(255,255,255,0.7);">
							<div class="rating-info clearfix" style="margin-bottom: 9px;height:auto;overflow:hidden;">
								<div class="biz-rating biz-rating-very-large clearfix" style="float: left; line-height: 24px; margin-bottom: 0;">
									<div class="restContent-star-rating-${starAvg}">
										<img class="offscreen" height="303"
										src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png"
										width="84" alt="4.0 star rating"
										style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">
									</div>
									<span class="review-count rating-qualifier" style="position: relative;display: block;float: left;color: #666;font-weight: normal;">${reviewCount} 리뷰</span>
								</div>
<!-- 								<div class="rating-details" style="position: relative;top: 1px;float: left;margin-left: 9px;"> -->
<!-- 							        <a href="#" class="chiclet-link chiclet-link--with-text show-tooltip js-rating-details" style="cursor: pointer; position: relative; padding: 0 6px;text-decoration: none;"> -->
<!-- 							            <span aria-hidden="true" style="width: 14px; height: 14px;" class="icon icon--14-histogram icon--size-14 icon--currentColor"> -->
<!-- 										  <svg id="14x14_histogram" height="100%" viewBox="0 0 14 14" width="100%"> -->
<!-- 										  		<path d="M9 11V5h2v6H9zM6 3h2v8H6V3zM3 7h2v4H3V7z"></path> -->
<!-- 										  </svg> -->
<!-- 										</span>Details -->
<!-- 							            <span class="tooltip-wrapper"> -->
<!-- 							                <span class="tooltip">Rating details</span> -->
<!-- 							            </span> -->
<!-- 							        </a> -->
<!-- 							    </div> -->
							</div>
							<div class="price-category" style="float: left;clear: both;">
								<span class="bullet-after">
       								 <span class="business-attribute price-range" style="letter-spacing: 1px;white-space: nowrap;">￦￦</span>
        						</span>
        						<span class="category-str-list" style="margin-right: 6px;">
			                  	 	<a href="#" style="white-space: nowrap; color: #0073bb;">${getRest.foodstyle}</a>
					    		</span>
							</div>
						</div>
					</div>
					
					<div class="biz-page-header-right u-relative"style="display: table; position: relative !important;">
						<div class="biz-page-actions nowrap"style="text-align: right; overflow: hidden; padding-bottom: 1px; margin-top: -1px; white-space: nowrap;">
						<a href="review_write?rnum=${getRest.rnum}" style="text-decoration: none;" class="ybtn review_write">
							<span aria-hidden="true" style="fill: white; width: 24px; height: 24px;" class="icon">
							    <svg id="24x24_star" height="100%" viewBox="0 0 24 24" width="100%">
							    	<path d="M12 1.5l2.61 6.727 6.89.53-5.278 4.688 1.65 7.055L12 16.67 6.13 20.5l1.648-7.055L2.5 8.757l6.89-.53L12 1.5z"></path>
							    </svg>
							</span>
							리뷰쓰기 
						</a> 
						<span class="ybtn-group clearfix" style="float: right;margin-top: 4px;"> 
						   <a class="ybtn ybtn--small add-photo-button" href="restaurant_uploadForm2?rnum=${getRest.rnum}" style="">
							  <span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-add-photo icon--size-18 icon--currentColor">
							     <svg id="18x18_add_photo" height="100%" viewBox="0 0 18 18" width="100%">
						   		    <path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 4.75a4.25 4.25 0 1 0 0 8.5 4.25 4.25 0 0 0 0-8.5zM11 10h-1v1a1 1 0 0 1-2 0v-1H7a1 1 0 0 1 0-2h1V7a1 1 0 0 1 2 0v1h1a1 1 0 0 1 0 2z"></path>
						         </svg>
							  </span> 사진추가
						   </a>
						</span>
				     </div>
				  </div>
			   </div>
		
				<div class="biz-page-subheader" style="display: table;">
					<div class="mapbox-container" style="width: 33.33333%;display: table-cell; vertical-align: middle;height:auto;overflow:hidden;">
						<div class="mapbox" style="padding: 5px; background: #fff; border: 1px solid #ccc;">
							<div class="mapbox-map" id="map2" style="height: 180px; border: 1px solid #ccc;">
								<script>
								  var map = new naver.maps.Map('map2',{
								  	  zoom:12
								    });
								      
								      var myaddress = '${getRest.roadAddrPart1}';
								      	naver.maps.Service.geocode({address: myaddress}, function(status, response) {
								          var result = response.result;
								          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
								          map.setCenter(myaddr);
								          var marker = new naver.maps.Marker({
								            position: myaddr,
								            map: map
								          });
								      });
								 </script>
							</div>
							<div class="mapbox-text" style="min-height: 105px;">
								<ul style="margin: 5px; list-style: none;    display: block;">
										<li class="u-relative" style="margin-bottom: 3px;    position: relative !important;display: list-item;list-style: none;">
											<span aria-hidden="true" style="vertical-align: top;width: 18px; height: 18px;" class="icon icon--18-marker icon--size-18 u-absolute u-sticky-top">
											    <svg id="18x18_marker" height="100%" viewBox="0 0 18 18" width="100%">
											    	<path d="M14 7A5 5 0 0 0 4 7c0 1.97 1.15 3.658 2.806 4.472h-.17L9 16l2.363-4.528h-.17C12.85 10.658 14 8.97 14 7zM9 5a2 2 0 1 1 0 4 2 2 0 0 1 0-4z"></path>
										    	</svg>
											</span>
											</span>
											<div class="map-box-address u-space-l4" style="line-height: 18px;display:inline-block;">
													<strong class="street-address" style="font-weight: bold;">
														<address style="display: block;font-style: normal;">
															${getRest.roadAddrPart1}<br> ${getRest.addrDetail}<br>
															${getRest.roadAddrPart2}
														</address>
													</strong>
											</div>
										</li>
									<li class="clearfix" style="margin-bottom: 3px;    display: list-item;text-align: -webkit-match-parent;">
										<div>
											<span class="icon" style="width: 18px; height: 18px;"> 
												<svg class="icon_svg">
													<path d="M16.444 7.556l-5.957-5.958a2.145 2.145 0 0 0-3.034 0L1.598 7.453a2.145 2.145 0 0 0 0 3.034l5.958 5.957a2 2 0 0 0 2.828 0l6.06-6.06a2 2 0 0 0 0-2.828zM9.97 11.47v-2.5h-3v3h-1v-4h4v-2.5l3 3-3 3z"></path>
												</svg>
											</span> 
											<a class="btn" data-popup-open="popup-1" href="#">길찾기</a>
											<div class="popup" data-popup="popup-1">
											    <div class="popup-inner">
											        <a class="popup-close" data-popup-close="popup-1" href="#">x</a>
											    </div>
											</div>
										</div>
									</li>
									<li class="hp" style="margin-bottom: 3px;    display: list-item;text-align: -webkit-match-parent;">
										<div style="display: block;">
											<span class="icon" style="width: 18px; height: 18px;">
												<svg class="icon_svg">
														<path
														d="M15.862 12.526l-2.91-1.68a.442.442 0 0 0-.486.087l-1.58 1.687a.857.857 0 0 1-.52.232s-1.083.03-3.13-1.985c-2.046-2.015-2.054-3.12-2.054-3.12 0-.17.094-.41.21-.533L6.85 5.656a.49.49 0 0 0 .08-.504L5.295 2.14c-.073-.155-.228-.18-.345-.058L2.26 4.924a1.07 1.07 0 0 0-.248.53s-.34 2.927 3.75 6.955c4.093 4.025 6.96 3.59 6.96 3.59.167-.027.4-.148.516-.27l2.684-2.845c.117-.123.09-.285-.062-.36z"></path>
													</svg>
											</span> 
											<span class="phone">${getRest.raddress}-${getRest.hp2}-${getRest.hp3}</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="restContent-showcase-container"
						style="width: 66.6667%;display: table-cell; vertical-align: middle;">
						<div class="restContent-showcase-container-inner"
							style="position: relative; width: 640px; height: 220px;">
							<div class="top-shelf-grey"></div>
	
							<div class="showcase-footer-links"
								style="position: absolute; right: 0; left: 0; top: 100%; padding: 6px 0;">
								<a class="see-more u-pull-right"
									href="restaurant_photoList?rnum=${getRest.rnum}" style="float: right !important; color: #0073bb; cursor: pointer;">
									<span aria-hidden="true" style="width: 18px; height: 18px;"class="icon icon--18-grid icon--size-18 u-space-r-half">
										<svg class="icon_svg">
								        	<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_grid">
								        		<svg id="18x18_grid" height="100%" viewBox="0 0 18 18" width="100%">
								        			<path d="M10 15v-5h5v5h-5zm0-12h5v5h-5V3zm-7 7h5v5H3v-5zm0-7h5v5H3V3z"></path>
							        			</svg>
								        	</use>
								    	</svg>
								    </span>
								        See all ${getImageCount}
								</a>
							</div>
	
							<div class="showcase-photos">
								<div class="js-photo photo photo-1"
									data-media-id="VXaXWJEy7XSoyh1ij9zojA" data-media-index="17" style="z-index: 1000;display:inline-block;width: 100%;height: 220px;    box-shadow: none;transition: all 0.2s ease-out;transition-property: transform, box-shadow;">
									<div class="showcase-photo-box" style="height:100%;">
									<c:forEach items="${uploadFileList}" var="upload" >
										<a href="#" style="color: #0073bb;text-decoration: none;"> 
											<img class="photo-box-img" style="display:inline-block;vertical-align: middle;" width="210" height="220" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${upload.rest_filename }">
										</a>
									</c:forEach>
									</div>
								<div class="photo-box-overlay js-overlay"
									style="opacity: 0; position: absolute; right: 0; bottom: 0; left: 0; padding: 3px 6px; border-radius: 0 0 4px 4px; background: #333; background: rgba(0, 0, 0, 0.5); color: white; font-size: 12px; line-height: 1.5em; font-weight: bold; overflow: hidden; -webkit-transition: all 0.3s ease-in-out; transition: all 0.3s ease-in-out;">
									<div class="photo-box-overlay_caption" style="    padding: 3px 6px 3px 1px;    position: relative;    display: flex;transition: all 0.2s ease-out;">
										<div class="media-avatar avatar" style="    position: relative;    border-right: 6px solid transparent; border-left: none;">
											<div class="photo-box pb-30s">
												<a href="#" class="js-analytics-click" data-analytics-label="user-photo" style="    color: white;    text-decoration: none;    cursor: pointer;">
									                <img class="photo-box-img" height="30" src="https://s3-media2.fl.yelpcdn.com/photo/SDnJqhDE0GRwI8pu4Gus2g/30s.jpg" width="30"
									                style="    outline: none;    display: block;    margin-top: 3px;    border-radius: 4px;    vertical-align: middle;">
									        </a>
											</div>
										</div>
										<div class="media-story"
											style="overflow: hidden; height: 36px; -webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
											<a class="photo-desc" href="#"
												style="text-decoration: none; text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5); color: white; cursor: pointer;">
												Photo of Yardbird Southern Table &amp; Bar - Las Vegas, NV,
												United States </a>
										</div>
									</div>
								</div>
							</div>
<!-- 							<div class="js-photo photo photo-2" -->
<!-- 									data-media-id="VXaXWJEy7XSoyh1ij9zojA" data-media-index="17" style="left: 220px;z-index: 1001;display: block;position: absolute;margin: -15px;width: 250px;height: 250px;    box-shadow: none;transition: all 0.2s ease-out;transition-property: transform, box-shadow;"> -->
<!-- 									<div class="showcase-photo-box" style="height:100%;"> -->
<%-- 									<c:forEach items="${uploadFileList}" var="upload"> --%>
<!-- 										<a href="#" style="color: #0073bb;text-decoration: none;">  -->
<%-- 											<img class="photo-box-img" style="transform: translateZ(0) rotate(0);display:block;vertical-align: middle;" width="250" height="220" src="getImage/${upload.rest_filename }"> --%>
<!-- 										</a> -->
<%-- 									</c:forEach> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="js-photo photo photo-3" -->
<!-- 									data-media-id="VXaXWJEy7XSoyh1ij9zojA" data-media-index="17" style="left: 440px;z-index: 1000;display: block;position: absolute;margin: -15px;width: 250px;height: 250px;    box-shadow: none;transition: all 0.2s ease-out;transition-property: transform, box-shadow;"> -->
<!-- 									<div class="showcase-photo-box" style="height:100%;"> -->
<%-- 									<c:forEach items="${uploadFileList}" var="upload"> --%>
<!-- 										<a href="#" style="color: #0073bb;text-decoration: none;">  -->
<%-- 											<img class="photo-box-img" style="transform: translateZ(0) rotate(0);display:block;vertical-align: middle;" width="250" height="220" src="getImage/${upload.rest_filename }"> --%>
<!-- 										</a> -->
<%-- 									</c:forEach> --%>
<!-- 									</div> -->
<!-- 								</div>  -->
							    </div>
						    </div>
					    </div>
				    </div>
		        </div>
	        </div>
        </div>
		<div class="restContent-super-container" style="width: 960px;height:100%; margin: 0 auto; padding: 0 15px; padding-top: 18px; padding-bottom: 36px;">
				<div class="restContent-container" style="display:block;width:100%;overflow:hidden;height:auto;">
					<div class="restContent-layout-block" style="margin-bottom: 0;position: relative;margin: 0 -15px;width:960px;overflow:hidden;height:auto;">
					<div class="restContent-alpha" style="padding: 0 30px 0 0; margin-left: 15px; float: left; min-height: 1px; box-sizing: border-box;width: 66.66667%;height:100%;border-right: 1px solid #e6e6e6;display:inline-block;">
<!-- 						<div class="restContent-cta-widget" -->
<!-- 							style="margin-bottom: 30px; padding: 11px; background: #f5f5f5; border: 1px solid #e6e6e6; border-radius: 4px;"> -->
<!-- 							<div class="restContent-arrange-middle" -->
<!-- 								style="margin-left: -12px; margin-right: -12px; border-collapse: separate; border-spacing: 12px 0;  min-width: 100%; table-layout: auto;"> -->
<!-- 								<div class="restContent-cta-avatar" -->
<!-- 									style="margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; box-sizing: border-box; display: table-cell;"> -->
<!-- 									<span aria-hidden="true" -->
<!-- 										style="fill: #ea5c1d; width: 30px; height: 30px; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em;" -->
<!-- 										class="restContent-icon"> -->
<!-- 										<svg class="restContent-icon_svg" -->
<!-- 											style="fill: inherit; display: block; left: 0; top: 0; right: 0; bottom: 0; position: absolute; width: 100%; height: 100%; overflow: hidden;"> -->
<!-- 											<path d="M25.5 24a1.5 1.5 0 0 1-1.5-1.5v-15a1.5 1.5 0 0 1 3 0v15a1.5 1.5 0 0 1-1.5 1.5zM17 24H8v-6.125l-3-.834V18a1 1 0 0 1-2 0v-6a1 1 0 0 1 2 0v.958l18-5V22.04l-6-1.664V24zm-2-4.18l-5-1.39V22h5v-2.18z"></path> -->
<!-- 										</svg> -->
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 								<div class="restContent-cta-content" -->
<!-- 									style="margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; width: 100%; box-sizing: border-box; display: table-cell;"> -->
<!-- 									<h3 style="color: #333; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; font-size: 16px; line-height: 1.3125em; "> -->
<!-- 										Join Us! We Reserve Most Tables for Walk-in Guests -->
<!-- 									</h3> -->
<!-- 								</div> -->
<!-- 								<div class="restContent-cta-button" -->
<!-- 									style="border-radius: 3px; white-space: nowrap; margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; box-sizing: border-box; display: table-cell;"> -->
<!-- 									<a href="#"> -->
<!-- 										Reserv Now -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="restContent-review-highlights" style="position: relative;">
							<div class="restContent-review-hightlights-content">
								<div style="border-bottom: 1px solid #e6e6e6;">
									<h2 style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; margin-bottom: 6px; font-size: 21px; line-height: 1.28571em; color: #d32323; margin: 0 0 6px;">
										Review Highlights
									</h2>
								</div>
								<ul class="restContent-review-highlights-list" style="list-style: none; margin: 24px 0;">
									<c:forEach var="reviewDTO" items="${highlightReview}">
									<li class="restContent-review-highlights-media-block" style="margin-bottom: 18px; position: relative;display: flex;text-align: -webkit-match-parent;">
										<div class="restContent-review-highlights-media-avatar"
											style="border-right: 12px solid transparent; border-left: none;">
											<div class="restcontent-review-highlights-photo-box">
												<a href="#" style="color: #0073bb; text-decoration: none; cursor: pointer;">
													<img width="60px" height="60px" style="outline: none; border-radius: 4px; vertical-align: middle;" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${reviewDTO.memberDTO.memberPhotoDTO.filename}">
												</a>
											</div>
										</div>
										<div class="restContent-review-highlights-media-story"
											style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
											<p class="restContent-quote" style="    margin-bottom: 4px;">
           										${reviewDTO.content} 
<!--            								 <a href="#" style="ont-size: 14px;color: #666;white-space: nowrap;text-decoration: none;">in 143 reviews</a> -->
											</p>
											<p class="restContent-highlight-sub-info" style="color: #666;margin-bottom: 4px;">
												<a href="#" style="color: #0073bb;">${reviewDTO.restaurantDTO.rname}</a>
											</p>
										</div>
									</li>
									</c:forEach>
								</ul>
<!-- 								<div class="restContent-review-highlight-action" style="margin: -12px 0 24px;"> -->
<!-- 									<a href="#" class="show-more-url"style="color: #0073bb;">Show more review highlights</a> -->
<!-- 								</div> -->
							</div>
						</div>
							<div>
								<div class="restContent-feed">
									<div class="restContent-feed-header">
										<div class="restContent-feed-section-header" style="margin-bottom: 0;border-bottom: 1px solid #e6e6e6;">
											<h2 style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; margin-bottom: 6px; font-size: 21px; line-height: 1.28571em; color: #d32323; margin: 0 0 6px;">
												Recommended Reviews 
												<b style="font-weight: normal;color: #333;">for ${getRest.rname}</b>
											</h2>
											<div class="restContent-feed_filters" >
												<div class="section-header_block" style="margin: 0px !important;">
													<div class="arrange arrange--middle u-space-b1"> <!-- 추가한 것 -->
														<div class="restContent-arrange-middle">
															<div class="restContent-feed-search" style="margin-right: 30px !important;">
																<form class="restContent-form" name="restContent" onsubmit="return check()" style="margin-bottom: 0; display: table; min-width: 100%; table-layout: auto;" method="post">
																	<div class="restContent-arrange-unit" style="width: 100%;box-sizing: border-box;display: table-cell;vertical-align: top;">
																		<input type="text" placeholder="Search within the reviews" name="SearchKeyword" id="SearchKeyword" autocomplete="on" style="margin: 0; display: block; box-sizing: border-box; width: 100%; padding: 5.5px 9px; background: #fff; border: 1px solid #999; border-radius: 3px; font-size: 14px; line-height: 1.29em; color: inherit; font: inherit; font-weight: normal;">
																		<input type="hidden" name="rnum" value="${getRest.rnum}">
																	</div>
																	<div class="rsetContent-arrange-unit-button" style="box-sizing: border-box;display: table-cell;vertical-align: top;">
																		<button type="submit" value="submit" class="restInsert-button" style="position: relative; left: -4px; width: calc(100% + 4px); border-radius: 0 3px 3px 0; box-shadow: none; padding: 5px 8px; font-size: 12px; line-height: 1.5em; color: white; border-color: #8d0005; background-color: #d90007; background: linear-gradient(#d90007, #c91400);">
																			<span>
																				<span class="restContent-icon" style="width: 18px; height: 18px; margin: -9px 0; fill: #fff; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em;">
																					<span aria-hidden="true" style="width: 18px; height: 18px;" class="restContent-icon18">
																					    <svg class="icon_svg">
																					        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_search_small"></use>
																					    </svg>
																					</span>
																			    </span>
																			</span>
																		</button>
																	</div>
																</form>
															</div>
														</div>
													<div class="restContent-arrange-unit-nowrap" style="vertical-align: middle;white-space: nowrap !important;box-sizing: border-box;display: table-cell;">
														<div class="restContent-review-sort" style=" margin-left: -12px;">
															<div class="restContent-dropdown" style="position: relative;display: inline-block;">
																<div class="restcontent-dropdown-toggle" style="position: relative;">
																<a href="#" class="restContent-dropdown-action" style="color: #666; display: inline-block; line-height: 30px; padding: 0 12px; border-top: 3px solid transparent; border-bottom: 3px solid transparent; text-decoration: none;">
																	<span class="restContent-dropdown_prefix">Sort by</span>
																	<span class="restContent-dropdown-toggle-text" data-dropdown-initial-text="Yeps Sort" style="font-weight: bold;">Yeps Sort</span>
																	<span aria-hidden="true" style="width: 14px; height: 14px;" class="icon icon--14-triangle-down icon--size-14 icon--currentColor u-triangle-direction-down dropdown_arrow">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#14x14_triangle_down">
																	        	<svg id="18x18_search_small" height="100%" viewBox="0 0 18 18" width="100%"><path d="M15.913 14.224a1.324 1.324 0 0 0-.3-.466h.01l-3.378-3.376a5.49 5.49 0 0 0 .802-2.857 5.523 5.523 0 1 0-5.522 5.52 5.49 5.49 0 0 0 2.856-.8l3.37 3.368.006.003a1.364 1.364 0 0 0 .93.384C15.41 16 16 15.41 16 14.684c0-.163-.032-.317-.086-.46zM7.525 10.94a3.422 3.422 0 0 1-3.418-3.416 3.422 3.422 0 0 1 3.418-3.417 3.422 3.422 0 0 1 3.416 3.417 3.42 3.42 0 0 1-3.413 3.416z"></path></svg>
																	        </use>
																	    </svg>
																	</span>
																</a>
															</div>
															</div>
														</div>
													</div>
													</div> <!-- 여기 추가한것 -->
												</div>
											</div>
										</div>
									</div>
									<div class="restContent-review-list" style="position: relative;">
										<ul class="restContent-reviews">
											<li>
												<div class="restContent-review-widget" style="margin: 0 -15px;">
													<div class="restContent-user" style="float: left;padding: 0 15px;min-height: 1px;    box-sizing: border-box;width: 37.5%;">
														<div class="restContent-user-content" style="margin-top: -3px;">
															<img src="https://s3-media4.fl.yelpcdn.com/assets/2/www/img/b5b7ea174ecb/writeareview/empty_profile.png" height="68">
														</div>
													</div>
												<div class="restContent-review-wrapper" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 62.5%;">
													<div class="restContent-clearfix" style="text-align: center !important;padding: 11px; background: #f5f5f5;border: 1px solid #e6e6e6;border-radius: 4px;">
														<div class="restcontent-star" style="margin-bottom: 12px !important;">
															<div class="restContent-u-space" style="margin-bottom: 12px !important;border-bottom: 1px solid #ccc;">
															<fieldset
																data-war-url="/writeareview/biz/lJAGnYzku5zSaLnQ_T6_GQ?return_url=%2Fbiz%2FlJAGnYzku5zSaLnQ_T6_GQ"
																class="star-selector js-star-selector"
																data-original-rating="0" data-component-bound="true"
																style="vertical-align: middle; display: inline-block; -webkit-margin-start: 2px; -webkit-margin-end: 2px; -webkit-padding-before: 0.35em; -webkit-padding-start: 0.75em; -webkit-padding-end: 0.75em; -webkit-padding-after: 0.625em; min-width: -webkit-min-content;">
													 			<form name="starpointF" method="post" action="review_write">
																	<div>
																		<ul id="star_rating" style="float: left; margin: 0px; padding: 0px; display: inline-block; width: 162px; height: 30px; overflow: hidden; vertical-align: middle;
							                          				     background: url(https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/a5aa4dca29f3/assets/img/stars/selector_stars.png) no-repeat;">
																			<li class="selector star-selector-li-1_4" data-label="Eek! Methinks not.">
							                            				     	<input id="rating-1" type="radio" value="1" name="rating" class="star-selector-input" style="cursor: pointer; border: none; margin: 0; padding: 0; width: 30px; height: 30px; opacity: 0;">
							                                					 	<label class="star-selector_label" for="rating-1">1 (Eek! Methinks not.)</label>
							                             					</li>
							                              					<li class="selector star-selector-li-1_4" data-label="Meh. I've experienced better.">
							                                 					<input id="rating-2" type="radio" value="2" name="rating" class="star-selector-input">
							                                 					<label class="star-selector_label" for="rating-2">2 (Meh. I've experienced better.)</label>
							                              					</li>
																			<li class="selector star-selector-li-1_4" data-label="3 (A-OK.)">
																				<input id="rating-3" type="radio" value="3" name="rating" class="star-selector-input">
							                                 					<label class="star-selector_label" for="rating-3">3 (A-OK.)</label>
							                              					</li>
							                              					<li class="selector star-selector-li-1_4" data-label="4 (Yay! I'm a fan.)">
							                                 					<input id="rating-4" type="radio" value="4"  name="rating" class="star-selector-input">
							                                 					<label class="star-selector_label" for="rating-4">4 (Yay! I'm a fan.)</label>
							                              					</li>
							                              					<li class="selector star-selector-li-5" data-label="5 (Woohoo! As good as it gets!)">
							                                 					<input id="rating-5" type="radio" value="5"  name="rating" class="star-selector-input">
							                                 					<label class="star-selector_label" for="rating-5">5 (Woohoo! As good as it gets!)</label>
							                              					</li>
							                           					</ul>
							                                 			<input type="hidden" name="rnum" value="${getRest.rnum}">   
							                                 			<input type="hidden" name="star" id="star">
							                                 			<input type="hidden" name="mode" value="write">
							                                 			<input type="hidden" name="where" value="rest">
							                          				</div>
							                           			</form>
															</fieldset>
														</div>
													</div>
													<a class="restContent-text-link" href="review_write?rnum=${getRest.rnum}&mode=write&where=rest" style="color: #0073bb; cursor: pointer; text-align: center !important;">
														Start your review of <strong style="font-weight: bold;">${getRest.rname}</strong>.
										            </a>
												</div>
											</div>
										</div>
									</li>
										
									<c:forEach var="getReview" items="${selectedDataRV}">	
									<li>
										<div class="restContent-review-with" style="margin: 0 -15px; display: flex;">
											<div class="restContent-user" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 37.5%;">
												<div class="restContent-user-content" style="margin-top: -3px;">
													<div class="restContent-meida-block" style="font-size: 12px; line-height: 1.5em; position: relative; display: flex;">
														<div class="restContent-media-avatar" style="border-right-width: 9px;border-right: 6px solid transparent;border-left: none;">
															<div class="restContent-photo-box">
																<a href="#" style="color: #0073bb;">
																	<img class="restContent-photo-box-img" height="60" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/${getReview.memberDTO.memberPhotoDTO.filename}" width="60">
																</a>
															</div>
														</div>
														<div class="restContent-media-story" style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
															<ul class="restContent-user-info">
																<li class="restContent-user-name">
																	<a href="#" class="restContent-user-display-name" style="font-size: 14px; line-height: 1.28571em; font-weight: bold; color: #0073bb; cursor: pointer;">
																		<c:if test="${empty getReview.memberDTO.nickname}">
																			${getReview.memberDTO.email}
																		</c:if>
																		<c:if test="${!empty getReview.memberDTO.nickname}">
																			${getReview.memberDTO.nickname}
																		</c:if>
																	</a>
																</li>
																<li class="restContnet-user-location">
																	<b style="font-weight: bold;">
																	<c:forTokens items="${getReview.memberDTO.address}" delims=" " begin="1" end="2" var="addr">
                                                                    	${addr}
                                                                  	</c:forTokens>	
																	</b>
																</li>
															</ul>
															<ul class="restContent-user-stats">
<!-- 																<li class="restContent-friend" style="color: #666;display: list-item;text-align: -webkit-match-parent;"> -->
<!-- 																	<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-friends icon--size-18"> -->
<!-- 																	    <svg class="icon_svg"> -->
<!-- 																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_friends"> -->
<!-- 																	        	<svg id="18x18_friends" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																	        		<g> -->
<!-- 																	        			<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path> -->
<!-- 																	        			<path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path> -->
<!-- 																	        		</g> -->
<!-- 																	        	</svg> -->
<!-- 																	        </use> -->
<!-- 																	    </svg> -->
<!-- 																	</span> -->
<!-- 																	<b style="font-weight: bold;">8</b> friends -->
<!-- 																</li> -->
																<li class="restContent-review-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">
																	<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-review icon--size-18">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_review">
																	        	<svg id="18x18_review" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																	<b style="font-weight: bold;">${getReview.memberDTO.reviewcount}</b> reviews
																</li>
																<li class="restContent-photo-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">
																	<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-camera icon--size-18">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_camera">
																	        	<svg id="18x18_camera" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 5a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm0 6.5a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																	<b style="font-weight: bold;">${getReview.memberDTO.imagecount}</b> photos
																</li>
															</ul>
														</div>
													</div>
													<ul class="restContent-list-link">
<!-- 														<li> -->
<!-- 															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;"> -->
<!-- 																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;"> -->
<!-- 																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-share icon--size-18 icon--currentColor"> -->
<!-- 																	    <svg class="icon_svg"> -->
<!-- 																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_share"> -->
<!-- 																	        	<svg id="18x18_share" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																	        		<path d="M17.714 6.43L13 10.356v-3.03c-1 0-5.097 1.47-6.286 3.62.274-3.08 4.286-5.5 6.286-5.5V2.5l4.714 3.93zM3 4v10h11v-2.5l1-1V15H2V3h8.5l-1 1H3z"></path> -->
<!-- 																	        	</svg> -->
<!-- 																	        </use> -->
<!-- 																	    </svg> -->
<!-- 																	</span> -->
<!-- 																</div> -->
<!-- 																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;"> -->
<!--             														Share review -->
<!-- 																</div> -->
<!-- 														</a> -->
<!-- 														</li> -->
														

														
<!-- 														<li> -->
<!-- 															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;"> -->
<!-- 																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;"> -->
<!-- 																	<span aria-hidden="true" -->
<!-- 																		style="width: 18px; height: 18px;" -->
<!-- 																		class="icon icon--18-embed icon--size-18 icon--currentColor"> -->
<!-- 																		<svg class="icon_svg"> -->
<!-- 														       				 <use -->
<!-- 																				xmlns:xlink="http://www.w3.org/1999/xlink" -->
<!-- 																				xlink:href="#18x18_embed"> -->
<!-- 														       				 	<svg id="18x18_embed" height="100%" -->
<!-- 																				viewBox="0 0 18 18" width="100%"> -->
<!-- 														       				 		<path -->
<!-- 																					d="M12.503 13.76a.717.717 0 0 1-.526.23.717.717 0 0 1-.526-.23.822.822 0 0 1 0-1.117l3.444-3.652-3.444-3.65a.822.822 0 0 1 0-1.116.714.714 0 0 1 1.053 0l4.495 4.77-4.495 4.767zm-5.954 0a.717.717 0 0 1-.528.23.718.718 0 0 1-.526-.23L1.002 8.99l4.495-4.768a.714.714 0 0 1 1.052 0c.29.308.29.808 0 1.116L3.105 8.99l3.442 3.653c.29.308.29.808 0 1.116z"></path> -->
<!-- 														       				 	</svg> -->
<!-- 														       				 </use> -->
<!-- 														    			</svg> -->
<!-- 																	</span> -->
<!-- 																</div> -->
<!-- 																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;"> -->
<!--             														Embed review -->
<!-- 																</div> -->
<!-- 														</a> -->
<!-- 														</li> -->
														
														
<!-- 														<li> -->
<!-- 															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;"> -->
<!-- 																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;"> -->
<!-- 																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-compliment icon--size-18 icon--currentColor"> -->
<!-- 																	    <svg class="icon_svg"> -->
<!-- 																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_compliment"> -->
<!-- 																	        	<svg id="18x18_compliment" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																	        		<path d="M14.5 6.75a5.5 5.5 0 0 0-11 0 5.495 5.495 0 0 0 2.993 4.892L5.5 16.75l3.505-2 3.495 2-.993-5.108A5.495 5.495 0 0 0 14.5 6.75zm-5.5 4c-2.206 0-4-1.794-4-4s1.794-4 4-4 4 1.794 4 4-1.794 4-4 4z"></path> -->
<!-- 																	        	</svg> -->
<!-- 																	        </use> -->
<!-- 																	    </svg> -->
<!-- 																	</span> -->
<!-- 																</div> -->
<!-- 																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;"> -->
<!--             														Compliment -->
<!-- 																</div> -->
<!-- 														</a> -->
<!-- 														</li> -->
														
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true" style="fill: currentColor; width: 18px; height: 18px;" class="icon">
																    <svg class="icon_svg">
																        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_speech">
																        	<svg id="18x18_speech" height="100%" viewBox="0 0 18 18" width="100%">
																        		<path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>
																        	</svg>
																        </use>
																    </svg>
																</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="display: table-cell;border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Send message
																</div>
														</a>
														</li>
														
<!-- 														<li> -->
<!-- 															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;"> -->
<!-- 																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;"> -->
<!-- 																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-following icon--size-18 icon--currentColor"> -->
<!-- 																	    <svg class="icon_svg"> -->
<!-- 																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_following"> -->
<!-- 																	        	<svg id="18x18_following" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																	        		<path d="M16 13l-4 3v-2H9l1-2h2v-2l4 3zm-8.925 2.383c-.443.817-1.707.817-2.15 0L2.128 9.605C1.728 8.868 2.31 8 3.203 8h5.594c.893 0 1.474.868 1.075 1.605l-2.797 5.778zM6 7a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path> -->
<!-- 																	        	</svg> -->
<!-- 																	        </use> -->
<!-- 																	    </svg> -->
<!-- 																	</span> -->
<!-- 																</div> -->
<!-- 																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;"> -->
<!--             														Follow Lauramay N. -->
<!-- 																</div> -->
<!-- 														</a> -->
<!-- 														</li> -->
													</ul>
												</div>
											</div>
											<div class="restContent-review-wrapper" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 62.5%;">
												<div class="restContent-review-content" style="padding: 0 12px 6px 0; min-height: 156px; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important;">
													<div class="restContent-review-rating" style="margin: 6px 0;width:100%;overflow:hidden;height:auto;">
														<div>
															<div class="restList-star-rating-${getReview.gradepoint}" >
															<img class="offscreen" 
																src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png"
																width="84" height="303" alt="4.0 star rating"
																style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">
														</div>
														</div>
														<span class="restContent-rating-qualifier" style="display: block; float: left; color: #666; font-weight: normal;">
															${getReview.reg_date}
														</span><!-- 날짜 -->
													</div>
													<p lang="ko" style="margin-bottom: 12px;display:block;">
														${getReview.content}
													</p>
													</div><!--리뷰 내용 -->
													
												<div class="review-footer clearfix">
<!-- 													<div class="rateReview voting-feedback" style="float: left;margin-bottom: 0;font-size: 12px;line-height: 1.5em;color: #666;" style="white-space: nowrap;margin-bottom: 6px;font-weight: bold;    display: block;"> -->
<!-- 														<p class="voting-intro voting-prompt saving-msg" data-component-bound="true" style="white-space: nowrap;margin-bottom: 6px;font-weight: bold;"> -->
<!-- 															Was this review …? -->
<!-- 														</p> -->
<!-- 														<ul class="restContent-review-button" style="margin-top: -1px;    list-style: none;    display: block;"> -->
<!-- 														<li class="vote-item inline-block" style="    margin-right: 6px;    display: inline-block;    text-align: -webkit-match-parent;"> -->
<!-- 															<a class="ybtn ybtn--small useful js-analytics-click" style="color: #666; white-space: nowrap; padding: 5px 8px; font-size: 12px; line-height: 1.5em; text-decoration: none !important; display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid; font-weight: bold; text-align: center; user-select: none; border-color: #ccc; color: #666; background-color: #f7f7f7; background: linear-gradient(#fff, #f7f7f7); box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); border-radius: 3px;"> -->
<!-- 																<span aria-hidden="true" style="fill: #666666; width: 18px; height: 18px;" class="icon icon--18-useful-outline icon--size-18 icon--active-inverse button-content u-space-r-half"> -->
<!-- 																    <svg id="18x18_useful_outline" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																    	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm2 8.392V12H7v-1.608a3.982 3.982 0 0 1-2-3.445 4 4 0 0 1 8 0c0 1.477-.81 2.752-2 3.445zM8 5.25a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5zm1.003 9.747h-.006A1.997 1.997 0 0 1 7 13h4a1.997 1.997 0 0 1-1.997 1.997z"></path> -->
<!-- 																    </svg> -->
<!-- 																</span> -->
<!-- 																<span class="vote-type" style="font-weight: bold;margin-right: 3px;">Useful</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="vote-item inline-block" style="    margin-right: 6px;    display: inline-block;    text-align: -webkit-match-parent;"> -->
<!-- 															<a class="ybtn ybtn--small useful js-analytics-click" style="color: #666; white-space: nowrap; padding: 5px 8px; font-size: 12px; line-height: 1.5em; text-decoration: none !important; display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid; font-weight: bold; text-align: center; user-select: none; border-color: #ccc; color: #666; background-color: #f7f7f7; background: linear-gradient(#fff, #f7f7f7); box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); border-radius: 3px;"> -->
<!-- 																<span aria-hidden="true" style="fill: #666666; width: 18px; height: 18px;" class="icon icon--18-useful-outline icon--size-18 icon--active-inverse button-content u-space-r-half"> -->
<!-- 																    <svg id="18x18_funny_outline" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																    	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm0 12a4.87 4.87 0 0 1-4.787-4h9.574A4.87 4.87 0 0 1 9 14zm2.5-5.625a1.376 1.376 0 1 1 0-2.75 1.376 1.376 0 0 1 0 2.75zm-5 0a1.376 1.376 0 1 1 0-2.75 1.376 1.376 0 0 1 0 2.75z"></path> -->
<!-- 																    </svg> -->
<!-- 																</span> -->
<!-- 																<span class="vote-type" style="font-weight: bold;margin-right: 3px;">Funny</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
														
<!-- 														<li class="vote-item inline-block" style="    margin-right: 6px;    display: inline-block;    text-align: -webkit-match-parent;"> -->
<!-- 															<a class="ybtn ybtn--small useful js-analytics-click" style="color: #666; white-space: nowrap; padding: 5px 8px; font-size: 12px; line-height: 1.5em; text-decoration: none !important; display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid; font-weight: bold; text-align: center; user-select: none; border-color: #ccc; color: #666; background-color: #f7f7f7; background: linear-gradient(#fff, #f7f7f7); box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); border-radius: 3px;"> -->
<!-- 																<span aria-hidden="true" style="fill: #666666; width: 18px; height: 18px;" class="icon icon--18-useful-outline icon--size-18 icon--active-inverse button-content u-space-r-half"> -->
<!-- 																    <svg id="18x18_cool_outline" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 																    	<path d="M9 17c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM9 2C5.14 2 2 5.14 2 9s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm6.026 5.335C14.766 8.797 13.5 10 11.986 10h-.003c-1.218 0-2.282-.764-2.767-1.813-.088-.19-.344-.242-.432-.052C8.3 9.185 7.234 10 6.016 10h-.003C4.5 10 3.195 8.83 2.973 7.35l-.093-.84c-.053-.242.192-.51.477-.51h11.286c.294 0 .508.332.477.56l-.094.775zm-2.068 4.154A4.28 4.28 0 0 1 9 14.144a4.28 4.28 0 0 1-3.958-2.657A6.81 6.81 0 0 0 9 12.753a6.81 6.81 0 0 0 3.958-1.265z"></path> -->
<!-- 															    	</svg> -->
<!-- 																</span> -->
<!-- 																<span class="vote-type" style="font-weight: bold;margin-right: 3px;">Cool</span> -->
<!-- 															</a> -->
<!-- 														</li> -->
<!-- 													</ul>좋아요 -->
<!-- 													</div> -->
													<div class="review-footer-actions pull-right clearfix" style="    margin-top: 23px;    float: right;">
														<a class="chiclet-link show-tooltip js-analytics-click chiclet-link--flag" style="position: relative;display: inline-block;padding: 5px;border: 1px solid #ccc;border-radius: 3px;font-size: 12px;line-height: 1.5em;color: #999;background: transparent;box-shadow: none;white-space: nowrap;transition: all 0.3s ease;text-decoration: none;cursor: pointer;">
															<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-flag icon--size-18 icon--currentColor">
															    <svg id="18x18_flag" height="100%" viewBox="0 0 18 18" width="100%">
															    	<path d="M6 10V3c4.976 1.098 4.024-1 8 0v7c-4.024-.976-3.024 1.024-8 0zM4 2h1v14H4V2z"></path>
														    	</svg>
															</span>
															<span class="tooltip-wrapper">
													            <span class="tooltip">
													            	Report review
													            </span>
													        </span>
														</a>
													</div>
												</div>
												
												
<!-- 												<div class="restContent-review-reply" style="margin-top: 18px; padding: 11px; background: #f5f5f5; border: 1px solid #e6e6e6; border-radius: 4px;"> -->
													
<!-- 												</div>사장 답변 -->
											</div>
										</div>
									</li><!-- 리뷰 -->
									</c:forEach>
								</ul>
								<div class="event_list_paging_section" style="font-size: 14px;">
         							<div class="event_list_pagination_block">
            							<div class="event_list_pagination_wrap">
               								<div class="event_list_page_of_pages">
                  							<c:if test="${map.YepsPager.blockEnd == 0}">
                  							    Page ${map.YepsPager.curPage} of 1
                  							</c:if>
                  							<c:if test="${map.YepsPager.blockEnd != 0}">
                     							Page ${map.YepsPager.curPage} of ${map.YepsPager.blockEnd}
                  							</c:if>
              		 						</div>
<!--                페이징 처리!! 현재페이지는 span이 되고 나머지는 a로 -->
               							<c:if test="${map.YepsPager.blockEnd != 1}">
               							<div class="event_list_page_link_wrapper">
                  							<div class="event_list_page_link_wrap">
                  
                  							<c:if test="${map.YepsPager.curBlock > 1}">
                     							<div class="event_list_next_block">
                        							<a class="event_list_next_block_action" href="javascript:list('1')">
                           								<span>Start</span>
                        							</a>
                     							</div>
                  							</c:if>

                  							<c:if test="${map.YepsPager.curBlock > 1}">
                     							<div class="event_list_next_block">
                       								<a class="event_list_next_block_action" href="javascript:list('${map.YepsPager.prevPage}')">
                           								<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
                              								<svg class="icon_svg">
                                 								<path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>
                              								</svg>
                           								</span>
                           								<span>Previous</span>
                        							</a>
                     							</div>
                  							</c:if>
                  
							                <c:forEach var="num" begin="${map.YepsPager.blockBegin}" end="${map.YepsPager.blockEnd}">
							                   <div class="event_list_page_link_option">
							                   <c:choose>
							                      <c:when test="${num == map.YepsPager.curPage}">
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
							                
							                <c:if test="${map.YepsPager.curBlock <= map.YepsPager.totBlock}">
							                   <div class="event_list_next_block">
							                      <a class="event_list_next_block_action" href="javascript:list('${map.YepsPager.nextPage}')">
							                         <span>Next</span>
							                         <span style="width: 24px; height: 24px; fill: currentColor;" class="icon">
							                            <svg class="icon_svg">
							                               <path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>
							                            </svg>
							                         </span>
							                      </a>
							                   </div>
							                </c:if>
							                
							                <c:if test="${map.YepsPager.curPage <= map.YepsPager.totPage}">
							                   <div class="event_list_next_block">
							                      <a class="event_list_next_block_action" href="javascript:list('${map.YepsPager.totPage}')">
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
				<div class="restContent-beta" style="padding: 0 30px 0 0; margin-right: -15px; float: left; min-height: 1px; box-sizing: border-box; width: 33.33333%;height:auto; box-shadow:-1px 0 0 #e6e6e6;display:inline-block;">
					<div class="restContent-open-rail clearfix" style=" margin-left: -1px;padding-left: 1px;background: #fff;width:300px;height:auto;">
						<div class="restContent-summary" style="padding: 3px 11px 3px 6px;margin-bottom: 18px;background: #f5f5f5;border: 1px solid #e6e6e6;border-radius: 4px;width:280px;height:auto;">
							<ul class="restContent-iconed-list" style="list-style: none;">
								<li class="restContent-iconed-hours-iconed-list-item" style="display: table;width: 100%;margin-bottom: 0;">
									<div class="restContent-iconed-list-avatar" style="float: none;display: table-cell;vertical-align: ;min-width: 34px;margin: 0;padding-right: 9px;text-align: center;">
										<span aria-hidden="true" style="width: 24px; height: 24px;    fill: #d32323;" class="icon icon--24-clock icon--size-24 icon--error">
										    <svg class="icon_svg">
										        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#24x24_clock">
										        	<svg id="24x24_clock" height="100%" viewBox="0 0 24 24" width="100%">
										        		<path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-18c-4.41 0-8 3.59-8 8s3.59 8 8 8 8-3.59 8-8-3.59-8-8-8zm3 11c-.19 0-.384-.055-.555-.168L11 12.535V7a1 1 0 0 1 2 0v4.465l2.555 1.703A1 1 0 0 1 15 15z"></path>
										        	</svg>
										        </use>
										    </svg>
										</span>
									</div>
									<div class="restContent-iconed-list-story" style="display: table-cell;width: 100%;padding: 9px 0;border-bottom: 1px solid #e6e6e6;padding-bottom: 8px;">
										<dl class="restContent-short-def-list" style="display: block;">
											<dt class="restContent-attribute-key" style="margin-right: 0.25em;display: inline;">Today</dt>
											<dd style="font-weight: bold;display: inline;"> 
												<strong class="u-space-r-half" style="margin-right: 3px !important;font-weight: bold;">
													<span class="nowrap">11:00 am</span> - <span class="nowrap">10:00 pm</span><br>
												</strong>
												<span class="restContent-nowrap extra closed" style="color: #d32323;font-size: 12px;font-weight: bold;">Closed now</span>
											</dd>
										</dl>
									</div>
								</li>
								<li class="restContent-iconed-menu-iconed-list-item" style="display: table;width: 100%;margin-bottom: 0;">
							        <div class="restContent-iconed-list-avatar" style=" float: none;display: table-cell;vertical-align: middle;min-width: 34px;margin: 0;padding-right: 9px;text-align: center;">
										<span aria-hidden="true" style="width: 24px; height: 24px;" class="icon icon--24-food icon--size-24 menu-icon"style="display: inline-block;vertical-align: middle;position: relative;overflow: hidden;top: -.1em;fill: #666;">
											<svg class="icon_svg">
							       			 	<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#24x24_food">
							   						<svg id="24x24_food" height="100%" viewBox="0 0 24 24" width="100%">
							   							<path d="M17.22 22a1.78 1.78 0 0 1-1.74-2.167l1.298-4.98L14 13l1.756-9.657A1.635 1.635 0 0 1 19 3.635V20.22A1.78 1.78 0 0 1 17.22 22zm-7.138-9.156l.697 7.168a1.79 1.79 0 1 1-3.56 0l.7-7.178A3.985 3.985 0 0 1 5 9V3a1 1 0 0 1 2 0v5.5c0 .28.22.5.5.5s.5-.22.5-.5V3a1 1 0 0 1 2 0v5.5c0 .28.22.5.5.5s.5-.22.5-.5V3a1 1 0 0 1 2 0v5.83c0 1.85-1.2 3.518-2.918 4.014z"></path>
							   						</svg>
							   					</use>
							   				</svg>
										</span>
									</div>
									<div class="restContent-iconed-list-story" style="display: table-cell;width: 100%;padding: 9px 0;border-bottom: 1px solid #e6e6e6;padding-bottom: 8px;">
							            <b style="font-weight: bold;"><a style="color: #0073bb;text-decoration: none;" class="menu-explore js-menu-explore" href="restaurant_listMenu?rname=${getRest.rname}">Full menu</a></b>
							        </div>
							    </li>
							    <li class="restContent-iconed-list-item" style="display: table;width: 100%;margin-bottom: 0;">
						            <div class="restContent-iconed-list-avatar" style="float: none;display: table-cell;vertical-align: middle;min-width: 34px;margin: 0;padding-right: 9px;text-align: center;">
						       		 	<span class="restContent-business-attribute price-range" data-remainder="￦￦" style="font-size: 13px;line-height: 1.38462em;font-weight: bold;color: #41a700;">￦￦</span>
						            </div>
						            <div class="restContent-iconed-list-story" style="display: table-cell;width: 100%;padding: 9px 0;padding-bottom: 8px;">
						                <dl class="restContent-short-def-list" style="display: block;">
						                    <dt class="restContent-attribute-key" style="margin-right: 0.25em;display: inline;">Price range</dt>
						                    <dd class="restContent-nowrap price-description" style="font-weight: bold;display: inline;white-space: nowrap;">
						                        ￦11-30
						                    </dd>
						                </dl>
						            </div>
						        </li>
							</ul>
						</div>
					</div>
					<div class="restContent-bordered-rail" style="padding-left: 30px;height:100%;">
						<div class="restContent-widget-hours" style="    margin-top: -3px;margin-bottom: 24px;">
							<h3 style="margin-bottom: 12px;font-weight: bold; font-size: 16px; line-height: 1.3125em; color: #d32323;">
								영업 시간
							</h3>
							<table class="restContent-table-hours" style="margin-bottom: 6px;width: auto; border-collapse: collapse;border-spacing: 0; display: table;">
								<tbody style="display: table-row-group;">
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											월요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.mon}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											화요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.tue}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											수요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.wed}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											목요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.thu}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											금요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.fri}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											토요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.sat}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											일요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.sun}</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="restContent-menu-preview" style="margin-bottom: 24px;height:204px;">
							<h3 class="restContent-menu-preview-heading" style="margin-bottom: 12px; font-weight: bold; font-size: 16px; line-height: 1.3125em; color: #d32323; margin: 0 0 6px;display: block;">
								<a href="#" style="color: #d32323;text-decoration: none;cursor: pointer;">메뉴</a>
							</h3>
						</div>
						<div class="restContent-business-info" style="height:1000px;margin-bottom: 24px;">
							<h3 style="margin-bottom: 12px; font-weight: bold; font-size: 16px; line-height: 1.3125em; color: #d32323; margin: 0 0 6px; display: block;">
								가게 정보
							</h3>
							<ul class="restContent-list" style="list-style: none;display: block;height:1000px;">
								<li style="margin-bottom: 12px;display: list-item;height:auto;">
									<div class="short-def-list" style="height:1000px;">
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="margin-right: 0.25em;display: inline;">좌석</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.reststyle}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">예약</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.reserv}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">배달</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.delivery}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">포장</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.takeout}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">주차장</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.parking}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="margin-right: 0.25em;    display: inline;">키드존</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.kidszone}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">단체예약</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.groupreserv}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">소음</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.noise}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">주류</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.alcohol}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">대기실</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.waiting}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">WIFI</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.wifi}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">화장실</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.toilet}
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">테이블 수</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.tablecount} (${getRest.standard}인 기준)
												</dd>
										</dl>
										
										<dl style="padding-bottom: 6px;display: block;">
											<dt class="restContent-attribute-key" style="    margin-right: 0.25em;    display: inline;">바쁜 시간</dt>
												<dd style="font-weight: bold;display: inline;">
													${getRest.busytime}
												</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	
	<div class="loading_wapper" >
      	<div class="loading_img" style="left: 40%; top: 40%;"></div>
   	</div>
		
		
<script>
	 $(function() {
		//----- OPEN
		$('[data-popup-open]').on('click', function(e)  {
			var targeted_popup_class = jQuery(this).attr('data-popup-open');
			$('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);
			e.preventDefault();
		});
	    
		//----- CLOSE
		$('[data-popup-close]').on('click', function(e)  {
			var targeted_popup_class = jQuery(this).attr('data-popup-close');
			$('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
			e.preventDefault();
			});
		});
		 
   $(document).ready(function() {
      $('.selector').hover(function(e) {
         var star = $(e.target).val();
         $(this).parent().removeClass('i-selector-stars--extra-large-0');
         $(this).parent().removeClass('i-selector-stars--extra-large-1');
         $(this).parent().removeClass('i-selector-stars--extra-large-2');
         $(this).parent().removeClass('i-selector-stars--extra-large-3');
         $(this).parent().removeClass('i-selector-stars--extra-large-4');
         $(this).parent().removeClass('i-selector-stars--extra-large-5');
         
         if(star == 0){
            $(this).parent().addClass('i-selector-stars--extra-large-0');
         }else if(star == 1){
            $(this).parent().addClass('i-selector-stars--extra-large-1');
         }else if(star == 2){
            $(this).parent().addClass('i-selector-stars--extra-large-2');
         }else if(star == 3){
            $(this).parent().addClass('i-selector-stars--extra-large-3');
         }else if(star == 4){
            $(this).parent().addClass('i-selector-stars--extra-large-4');
         }else if(star == 5){
            $(this).parent().addClass('i-selector-stars--extra-large-5');
         } 
      });
      
         
      $('.selector').mouseleave(function(){
         $(this).parent().removeClass('i-selector-stars--extra-large-0');
         $(this).parent().removeClass('i-selector-stars--extra-large-1');
         $(this).parent().removeClass('i-selector-stars--extra-large-2');
         $(this).parent().removeClass('i-selector-stars--extra-large-3');
         $(this).parent().removeClass('i-selector-stars--extra-large-4');
         $(this).parent().removeClass('i-selector-stars--extra-large-5');
      });   
      
      
      $('.selector').click(function(e){ 
         var star = $(e.target).val();
         $('#star').val(star);
         $(this).parent().parent().parent().submit();
      });
      
      
      
   });   
</script>


<script type="text/javascript">
//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
var rnum = '${getRest.rnum}';
function list(page){
	$(document).ajaxStart(function() {
		$('body').css('overflow', 'hidden');
		$('html').scrollTop(0);
		$('.loading_wapper').fadeIn(500);
	})
					
	$(document).ajaxStop(function() {
		$('body').css('overflow', 'auto');
		$('.loading_wapper').fadeOut(500);
	})
	
    $.ajax({
        type : 'post',
        url : 'restaurant_content_ajax?curPage=' + page + '&rnum=' + rnum,
        dataType : 'json',
        success : function(responseData){
           $('.restContent-reviews li:not(:first)').remove();
           $.each(responseData.selectedDataRV,function(i,item){
        	   var userId;
        	   if(item.memberDTO.nickname == null) {
        		   userId = item.memberDTO.email;
        	   } else {
        		   userId = item.memberDTO.nickname;
        	   }
        	   var address = item.memberDTO.address;
        	   var addr = [];
        	   if(address != null) {
        		   addr = address.split(' ');
        	   } else {
        		   addr[0] = '';
        		   addr[1] = '';
        	   }
        	   
          	 $('.restContent-reviews').append(
   	     			   '<li>' +
   		     			   '<div class="restContent-review-with" style="margin: 0 -15px; display: flex;">' +
   	    		 		   		'<div class="restContent-user" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 37.5%;">' +
   		     			   			'<div class="restContent-user-content" style="margin-top: -3px;">' +
										'<div class="restContent-meida-block" style="font-size: 12px; line-height: 1.5em; position: relative; display: flex;">' +
											'<div class="restContent-media-avatar" style="border-right-width: 9px;border-right: 6px solid transparent;border-left: none;">' +
												'<div class="restContent-photo-box">' +
													'<a href="#" style="color: #0073bb;">' +
														'<img class="restContent-photo-box-img" height="60" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/' + item.memberDTO.memberPhotoDTO.filename + '" width="60">' +
													'</a>' +
												'</div>' +
											'</div>' +
											'<div class="restContent-media-story" style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">' +
												'<ul class="restContent-user-info">' +
													'<li class="restContent-user-name">' +
														'<a href="#" class="restContent-user-display-name" style="font-size: 14px; line-height: 1.28571em; font-weight: bold; color: #0073bb; cursor: pointer;">' +
															userId +
														'</a>' +
													'</li>' +
													'<li class="restContnet-user-location">' +
														'<b style="font-weight: bold;">' +
															addr[0] + addr[1] +
														'</b>' +
													'</li>' +
												'</ul>' +
												'<ul class="restContent-user-stats">' +
													'<li class="restContent-review-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">'+
														'<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-review icon--size-18">'+
														   '<svg class="icon_svg">'+
														        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_review">'+
														        	'<svg id="18x18_review" height="100%" viewBox="0 0 18 18" width="100%">'+
												    		    		'<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>'+
													        	'</svg>'+
													        '</use>'+
													    '</svg>'+
													'</span>'+
													'<b style="font-weight: bold;"> ' + item.memberDTO.reviewcount + '</b> reviews'+
												'</li>'+
												'<li class="restContent-photo-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">'+
													'<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-camera icon--size-18">'+
													    '<svg class="icon_svg">'+
													        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_camera">'+
														        	'<svg id="18x18_camera" height="100%" viewBox="0 0 18 18" width="100%">'+
													        		'<path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 5a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm0 6.5a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>'+
													        	'</svg>'+
													       ' </use>'+
													    '</svg>'+
													'</span>'+
													'<b style="font-weight: bold;"> '+ item.memberDTO.imagecount +'</b> photos'+
												'</li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
									'<ul class="restContent-list-link">'+									
										'<li>'+
											'<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; cursor: pointer;">'+
												'<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">'+
													'<span aria-hidden="true" style="fill: currentColor; width: 18px; height: 18px;" class="icon">'+
													    '<svg class="icon_svg">'+
													        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_speech">'+
													        	'<svg id="18x18_speech" height="100%" viewBox="0 0 18 18" width="100%">'+
										        					'<path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>'+
													        	'</svg>'+
													        '</use>'+
													   ' </svg>'+
													'</span>'+
												'</div>'+
												'<div class="action-link_label arrange_unit arrange_unit--fill" style="display: table-cell;border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">'+
													'Send message'+
												'</div>'+
											'</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</div>'+			
							'<div class="restContent-review-wrapper" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 62.5%;">'+
								'<div class="restContent-review-content" style="padding: 0 12px 6px 0; min-height: 156px; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important;">'+
									'<div class="restContent-review-rating" style="margin: 6px 0;width:100%;overflow:hidden;height:auto;">'+
										'<div>'+
											'<div class="restList-star-rating-'+item.gradepoint+'" >'+
												'<img class="offscreen" '+
													'src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/stars.png" '+
													'width="84" height="303" alt="4.0 star rating" '+
													'style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">'+
											'</div>'+
										'</div>'+
										'<span class="restContent-rating-qualifier" style="display: block; float: left; color: #666; font-weight: normal;">'+
											item.reg_date +
										'</span>'+
									'</div>'+
									'<p lang="ko" style="margin-bottom: 12px;display:block;">'+
										item.content +
									'</p>'+
								'</div>'+
							'<div class="review-footer clearfix">'+
						'</div>'+
					'</div>'+
				'</li>'
           		);
           });
           
           
           $('.event_list_paging_section').empty();
           var pagingHtml = "";
           pagingHtml = '<div class="event_list_pagination_block">' + 
           				'<div class="event_list_pagination_wrap">' + 
           				'<div class="event_list_page_of_pages">';
           if(responseData.YepsPager.blockEnd == 0) {
        	   pagingHtml += 'Page ' + responseData.YepsPager.curPage + ' of 1';
           } else {
        	   pagingHtml += 'Page ' + responseData.YepsPager.curPage + ' of ' + responseData.YepsPager.blockEnd;
           }
           pagingHtml += '</div>';
           if(responseData.YepsPager.blockEnd != 1) {
        	   pagingHtml += '<div class="event_list_page_link_wrapper">';
        	   pagingHtml += '<div class="event_list_page_link_wrap">';
        	   if(responseData.YepsPager.curBlock > 1) {
        		   pagingHtml += '<div class="event_list_next_block">';
        		   pagingHtml += '<a class="event_list_next_block_action" href="javascript:list('+ 1 +')">';
        		   pagingHtml += '<span>Start</span>';
        		   pagingHtml += '</a>';
        		   pagingHtml += '</div>';
        	   }
        	   
        	   if(responseData.YepsPager.curBlock > 1) {
        		   pagingHtml += '<div class="event_list_next_block">';
        		   pagingHtml += '<a class="event_list_next_block_action" href="javascript:list('+responseData.YepsPager.prevPage+')">';
        		   pagingHtml += '<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">';
        		   pagingHtml += '<svg class="icon_svg">';
        		   pagingHtml += '<path d="M14.475 18.364l1.414-1.414L10.94 12l4.95-4.95-1.415-1.414L8.11 12l6.365 6.364z"></path>';
        		   pagingHtml += '</svg>';
        		   pagingHtml += '</span>';
        		   pagingHtml += '<span>Previous</span>';
        		   pagingHtml += '</a>';
        		   pagingHtml += '</div>';
        	   }
        	   
        	   for(var num = responseData.YepsPager.blockBegin; num <= responseData.YepsPager.blockEnd; num++) {
        		   pagingHtml += '<div class="event_list_page_link_option">';
        		   if(num == responseData.YepsPager.curPage) {
        			   pagingHtml += '<span class="event_list_page_option_action">';
        			   pagingHtml += num;
        			   pagingHtml += '</span>';
        		   } else {
        			   pagingHtml += '<a href="javascript:list('+ num +')" class="event_list_page_option_link_action">';
        			   pagingHtml += num;
        			   pagingHtml += '</a>';
        		   }
        		   pagingHtml += '</div>';
        	   }
        	   
        	   if(responseData.YepsPager.curBlock <= responseData.YepsPager.totBlock) {
        		   pagingHtml += '<div class="event_list_next_block">';
        		   pagingHtml += '<a class="event_list_next_block_action" href="javascript:list('+responseData.YepsPager.nextPage+')">';
        		   pagingHtml += '<span>Next</span>';
        		   pagingHtml += '<span style="width: 24px; height: 24px; fill: currentColor;" class="icon">';
        		   pagingHtml += '<svg class="icon_svg">';
        		   pagingHtml += '<path d="M9.525 5.636L8.11 7.05 13.06 12l-4.95 4.95 1.415 1.414L15.89 12 9.524 5.636z"></path>';
        		   pagingHtml += '</svg>';
        		   pagingHtml += '</span>';
        		   pagingHtml += '</a>';
        		   pagingHtml += '</div>';
        	   }
        	   if(responseData.YepsPager.curBlock <= responseData.YepsPager.totBlock) {
        		   pagingHtml += '<div class="event_list_next_block">';
        		   pagingHtml += '<a class="event_list_next_block_action" href="javascript:list('+responseData.YepsPager.totPage+')">';
        		   pagingHtml += '<span>End</span>';
        		   pagingHtml += '</a>';
        		   pagingHtml += '</div>';
        	   }
        	   pagingHtml += '</div>';
        	   pagingHtml += '</div>';
           }
           pagingHtml += '</div>';
           pagingHtml += '</div>';
           pagingHtml += '</div>';

           $('.event_list_paging_section').append(pagingHtml);           
        },
        error : function(request, status, error) {
           alert("불러오기 실패");
        },
   });
}

function check() {	
	var queryString = $("form[name=restContent]").serialize();
    $.ajax({
         type : 'post',
         url : 'restaurant_content_ajax?rnum='+rnum,
         data : queryString,
         dataType : 'json',
         success : function(responseData){
            $('#SearchKeyword').val(responseData.SearchKeyword);
            $('.restContent-reviews li:not(:first)').remove();
            $.each(responseData.selectedDataRV,function(i,item){
         	   var userId;
         	   if(item.memberDTO.nickname == null) {
         		   userId = item.memberDTO.email;
         	   } else {
         		   userId = item.memberDTO.nickname;
         	   }
         	   var address = item.memberDTO.address;
         	   var addr = [];
         	   if(address != null) {
         		   addr = address.split(' ');
         	   } else {
         		   addr[0] = '';
         		   addr[1] = '';
         	   }
         	   
         	   
         	  $('.restContent-reviews').append(
  	     			   '<li>' +
  		     			   '<div class="restContent-review-with" style="margin: 0 -15px; display: flex;">' +
  	    		 		   		'<div class="restContent-user" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 37.5%;">' +
  		     			   			'<div class="restContent-user-content" style="margin-top: -3px;">' +
										'<div class="restContent-meida-block" style="font-size: 12px; line-height: 1.5em; position: relative; display: flex;">' +
											'<div class="restContent-media-avatar" style="border-right-width: 9px;border-right: 6px solid transparent;border-left: none;">' +
												'<div class="restContent-photo-box">' +
													'<a href="#" style="color: #0073bb;">' +
														'<img class="restContent-photo-box-img" height="60" src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/' + item.memberDTO.memberPhotoDTO.filename + '" width="60">' +
													'</a>' +
												'</div>' +
											'</div>' +
											'<div class="restContent-media-story" style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">' +
												'<ul class="restContent-user-info">' +
													'<li class="restContent-user-name">' +
														'<a href="#" class="restContent-user-display-name" style="font-size: 14px; line-height: 1.28571em; font-weight: bold; color: #0073bb; cursor: pointer;">' +
															userId +
														'</a>' +
													'</li>' +
													'<li class="restContnet-user-location">' +
														'<b style="font-weight: bold;">' +
															addr[0] + addr[1] +
														'</b>' +
													'</li>' +
												'</ul>' +
												'<ul class="restContent-user-stats">' +
													'<li class="restContent-review-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">'+
														'<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-review icon--size-18">'+
														   '<svg class="icon_svg">'+
														        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_review">'+
														        	'<svg id="18x18_review" height="100%" viewBox="0 0 18 18" width="100%">'+
												    		    		'<path d="M13 3H5c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1.505 9.643l-2.526-1.55L6.526 12.7 7 9.934 5 7.977l2.766-.404L8.97 4.7l1.264 2.873L13 7.977l-2 1.957.495 2.71z"></path>'+
													        	'</svg>'+
													        '</use>'+
													    '</svg>'+
													'</span>'+
													'<b style="font-weight: bold;"> ' + item.memberDTO.reviewcount + '</b> reviews'+
												'</li>'+
												'<li class="restContent-photo-count" style="color: #666;display: list-item;text-align: -webkit-match-parent;">'+
													'<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-camera icon--size-18">'+
													    '<svg class="icon_svg">'+
													        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_camera">'+
														        	'<svg id="18x18_camera" height="100%" viewBox="0 0 18 18" width="100%">'+
													        		'<path d="M15 15H3a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2zM9 5a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm0 6.5a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>'+
													        	'</svg>'+
													       ' </use>'+
													    '</svg>'+
													'</span>'+
													'<b style="font-weight: bold;"> '+ item.memberDTO.imagecount +'</b> photos'+
												'</li>'+
											'</ul>'+
										'</div>'+
									'</div>'+
									'<ul class="restContent-list-link">'+									
										'<li>'+
											'<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; cursor: pointer;">'+
												'<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">'+
													'<span aria-hidden="true" style="fill: currentColor; width: 18px; height: 18px;" class="icon">'+
													    '<svg class="icon_svg">'+
													        '<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_speech">'+
													        	'<svg id="18x18_speech" height="100%" viewBox="0 0 18 18" width="100%">'+
										        					'<path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>'+
													        	'</svg>'+
													        '</use>'+
													   ' </svg>'+
													'</span>'+
												'</div>'+
												'<div class="action-link_label arrange_unit arrange_unit--fill" style="display: table-cell;border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">'+
													'Send message'+
												'</div>'+
											'</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</div>'+			
							'<div class="restContent-review-wrapper" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 62.5%;">'+
								'<div class="restContent-review-content" style="padding: 0 12px 6px 0; min-height: 156px; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important;">'+
									'<div class="restContent-review-rating" style="margin: 6px 0;width:100%;overflow:hidden;height:auto;">'+
										'<div>'+
											'<div class="restList-star-rating-'+item.gradepoint+'" >'+
												'<img class="offscreen" '+
													'src="https://s3.ap-northeast-2.amazonaws.com/yepsbucket/images/stars.png" '+
													'width="84" height="303" alt="4.0 star rating" '+
													'style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">'+
											'</div>'+
										'</div>'+
										'<span class="restContent-rating-qualifier" style="display: block; float: left; color: #666; font-weight: normal;">'+
											item.reg_date +
										'</span>'+
									'</div>'+
									'<p lang="ko" style="margin-bottom: 12px;display:block;">'+
										item.content +
									'</p>'+
								'</div>'+
							'<div class="review-footer clearfix">'+
						'</div>'+
					'</div>'+
				'</li>'
          		);
         	   
         	   
         	   
         	   
            });
         	   
         },
         error : function(request, status, error) {
            alert("불러오기 실패");
         },
    });
	
	return true;
}
</script>

<%@ include file="../bottom.jsp" %>
