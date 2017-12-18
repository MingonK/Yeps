<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap.min.css?ver=1"/>"/> --%>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/bootstrap.min.css?ver=1"/>"/> --%>
<script type="text/javascript">
	var day=new Array("월요일","화요일","수요일","목요일","금요일","토요일","일요일");
	var d = new Date();
	var day2=d.getDay()-1;
// 	alert(day[day2]);
	
var foodstyle="${getRest.foodstyle}";
var res = foodstyle.split(",");
</script>
<style>
.checked {
    color: red;
}
</style>
<title>레스토랑</title>
</head>
<%@include file="../top.jsp" %>
	<div class="main" style="background: white;">
		<div class="top-shelf" style="width:100%;height:480px;position:relative;padding:15px;">
			<div class="content-container" style="width:960px;height:450px;margin:0 auto;padding:0 15px;">
				<div class="biz-page-header clearfix" style="width:100%;height:120px;margin-bottom:13px;display:block;">
					<div class="left" style="width:520px;height:120px;padding-right:30px;display:inline-block;float:left;">
						<div style="width:490px;height:36px;">
							<h1 style="font-weight: bold;font-size: 30px;">${getRest.rname }</h1>
						</div>
						<div class="biz-main-info embossed-text-white" style="width:490px;height:24px;margin-top:9px;">
							<div class="rating-info clearfix" style="width:490px;height:24px;margin-bottom:9px;">
								<div class="biz-rating biz-rating-very-large clearfix" style="float: left;line-height: 24px;margin-bottom: 0;">
								<div class="i-stars i-stars--large-4 rating-very-large"
									title="4.0 star rating"
									style="margin-top: 0; float: left; margin: -4px 6px 0 0; position: relative; overflow: hidden; width: 132px; height: 24px; background-position: 0 -168px; background: url(https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png) no-repeat; background-size: 132px 560px; display: inline-block; vertical-align: middle;">
									<img class="offscreen" height="303"
										src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png"
										width="84" alt="4.0 star rating"
										style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">
								</div>
								<span class="review-count rating-qualifier">3705 reviews</span>
								</div>
							</div>
							<div class="price-category" style="width:202px;height:22px;">
								<span class="business-attribute price-range">￦￦￦</span>
								<span class="category-str-list" style="margin-right:6px;">
									<a href="#">${getRest.foodstyle}</a>
								</span>
							</div>
						</div>
					</div>
					<div class="right" style="width:345px;height:37px;display:inline-block;float:none;vertical-align: middle;">
						<div class="biz-page-actions nowrap" style="width:100%;height:37px;">
							<a href="#" class="write-review" style="width:90px;height:30px;float:left;padding-left:12px;margin:0 12px 0 0;">
							리뷰쓰기
							</a>
							<span class="ybtn-group clearfix" style="width:100%;height:30px;">
								<a href="#" class="photo" style="width:100px;height:30px;padding:5px 8px;border:1px;">
								사진추가
								</a>
							</span>
						</div>
					</div>
				</div>
				<div class="biz-page-subheader" style="width:100%;height:350px;    display: table;">
					<div class="mapbox-container" style="width:33.33333%;height:350px;display: table-cell;vertical-align: middle;">
						<div class="mapbox" style="padding:5px;background: #fff;border: 1px solid #ccc;">
							<div class="mapbox-map" id="map" style="width:100%;height:135px;border: 1px solid #ccc;">
							   <script>
							      var map = new naver.maps.Map('map');
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
							<div class="mapbox-text" style="width:100%;height:180px;display:block;">
								<ul style="width:280px;height:175px;margin:5px;list-style: none;">
									<li class="u-relative" style="width:100%;height:88px;margin-bottom:3px;list-style: none;">
<!-- 										<span class="icon" style="width: 18px;height: 18px;"> -->
<!-- 										<svg class="icon_svg"> -->
<!-- 											<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_marker"> -->
<!-- 												<svg id="18x18_marker" height="100%" viewBox="0 0 18 18" width="100%"> -->
<!-- 													<path d="M14 7A5 5 0 0 0 4 7c0 1.97 1.15 3.658 2.806 4.472h-.17L9 16l2.363-4.528h-.17C12.85 10.658 14 8.97 14 7zM9 5a2 2 0 1 1 0 4 2 2 0 0 1 0-4z"></path> -->
<!-- 												</svg> -->
<!-- 											</use> -->
<!-- 										</svg> -->
<!-- 									</span> -->
										<div class="map-box-address" style="width:264px;height:60px;margin-left:24px;">
											<strong class="street-address">
												<address>
       				 								${getRest.roadAddrPart1}<br>
       				 								${getRest.addrDetail}<br>
       				 								${getRest.roadAddrPart2}
    											</address>
											</strong>
										</div>
									</li>
									
									<li class="get-direction" style="width:100%;height:19px;margin-bottom:3px;">
									<span class="icon" style="width: 18px;height: 18px;">
										<svg class="icon_svg">
											<path d="M16.444 7.556l-5.957-5.958a2.145 2.145 0 0 0-3.034 0L1.598 7.453a2.145 2.145 0 0 0 0 3.034l5.958 5.957a2 2 0 0 0 2.828 0l6.06-6.06a2 2 0 0 0 0-2.828zM9.97 11.47v-2.5h-3v3h-1v-4h4v-2.5l3 3-3 3z"></path>
										</svg>
									</span>
										<a href="#">길찾기</a>
									</li>
									<li class="hp" style="width:100%;height:19px;margin-bottom:3px;">
										<div style="display:block;">
											<span class="icon" style="width: 18px;height: 18px;">
												<svg class="icon_svg">
													<path d="M15.862 12.526l-2.91-1.68a.442.442 0 0 0-.486.087l-1.58 1.687a.857.857 0 0 1-.52.232s-1.083.03-3.13-1.985c-2.046-2.015-2.054-3.12-2.054-3.12 0-.17.094-.41.21-.533L6.85 5.656a.49.49 0 0 0 .08-.504L5.295 2.14c-.073-.155-.228-.18-.345-.058L2.26 4.924a1.07 1.07 0 0 0-.248.53s-.34 2.927 3.75 6.955c4.093 4.025 6.96 3.59 6.96 3.59.167-.027.4-.148.516-.27l2.684-2.845c.117-.123.09-.285-.062-.36z"></path>
												</svg>
											</span>
										<span class="phone">${getRest.raddress}-${getRest.hp2}-${getRest.hp3}</span>
										</div>
									</li>
								</ul>
							</div>
						</div>	
					</div>
					<div class="restContent-showcase-container" style="width:66.6667%;;height:336px;display: table-cell;vertical-align: middle;">
						<div class="restContent-showcase-container-inner" style="position: relative;width: 640px;height: 220px;">
							<div class="top-shelf-grey"></div>
							
						<div class="showcase-footer-links" style="position: absolute; right: 0; left: 0; top: 100%; padding: 6px 0;">
							<a class="see-more u-pull-right" href="/biz_photos/kitchen-story-san-francisco" style="float: right !important;color: #0073bb;text-decoration: none;cursor: pointer;"> 
								<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-grid icon--size-18 u-space-r-half">
									<svg class="icon_svg">
							        	<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_grid">
							        		<svg id="18x18_grid" height="100%" viewBox="0 0 18 18" width="100%">
							        			<path d="M10 15v-5h5v5h-5zm0-12h5v5h-5V3zm-7 7h5v5H3v-5zm0-7h5v5H3V3z"></path>
						        			</svg>
							        	</use>
							    	</svg>
								</span>See all 4215
							</a>
						</div>

							<div class="showcase-photos current">
								<div class="js-photo photo photo-1" data-media-id="VXaXWJEy7XSoyh1ij9zojA" data-media-index="17">
									<div class="showcase-photo-box">
										<a href="#">
											<img class="photo-box-img" width="250" height="220" src="getImage/pepe.jpg" >
										</a>
									</div>
								</div>
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
						<div class="restContent-cta-widget"
							style="margin-bottom: 30px; padding: 11px; background: #f5f5f5; border: 1px solid #e6e6e6; border-radius: 4px;">
							<div class="restContent-arrange-middle"
								style="margin-left: -12px; margin-right: -12px; border-collapse: separate; border-spacing: 12px 0;  min-width: 100%; table-layout: auto;">
								<div class="restContent-cta-avatar"
									style="margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; box-sizing: border-box; display: table-cell;">
									<span aria-hidden="true"
										style="fill: #ea5c1d; width: 30px; height: 30px; display: inline-block; vertical-align: middle; position: relative; overflow: hidden; top: -.1em;"
										class="restContent-icon">
										<svg class="restContent-icon_svg"
											style="fill: inherit; display: block; left: 0; top: 0; right: 0; bottom: 0; position: absolute; width: 100%; height: 100%; overflow: hidden;">
											<path d="M25.5 24a1.5 1.5 0 0 1-1.5-1.5v-15a1.5 1.5 0 0 1 3 0v15a1.5 1.5 0 0 1-1.5 1.5zM17 24H8v-6.125l-3-.834V18a1 1 0 0 1-2 0v-6a1 1 0 0 1 2 0v.958l18-5V22.04l-6-1.664V24zm-2-4.18l-5-1.39V22h5v-2.18z"></path>
										</svg>
									</span>
								</div>
								<div class="restContent-cta-content"
									style="margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; width: 100%; box-sizing: border-box; display: table-cell;">
									<h3 style="color: #333; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; font-size: 16px; line-height: 1.3125em; ">
										Join Us! We Reserve Most Tables for Walk-in Guests
									</h3>
								</div>
								<div class="restContent-cta-button"
									style="white-space: nowrap; margin-left: 6px; margin-right: 6px; border-collapse: collapse; border-spacing: 0 0; vertical-align: middle; box-sizing: border-box; display: table-cell;">
									<a href="#" style="padding-left: 24px; padding-right: 24px; color: white; color: #666; padding: 5px 8px; font-size: 12px; line-height: 1.5em; text-decoration: none !important; color: white; border-color: #a44100; box-shadow: 0 1px 1px rgba(0, 0, 0, 0.3); background-color: #ef5d10; display: inline-block; vertical-align: middle; margin: 0; cursor: pointer; border: 1px solid; font-weight: bold; text-align: center;">
										Reserv Now
									</a>
								</div>
							</div>
						</div>
						<div class="restContent-review-highlights" style="position: relative;">
							<div class="restContent-review-hightlights-content" >
								<ul class="restContent-review-highlights-list"
									style="list-style: none; margin-bottom: 24px;">
									<li class="restContent-review-highlights-media-block" style="margin-bottom: 18px;    position: relative;display: flex;text-align: -webkit-match-parent;">
										<div class="restContent-review-highlights-media-avatar"
											style="border-right: 12px solid transparent; border-left: none;">
											<div class="restcontent-review-highlights-photo-box">
												<a href="#"
													style="color: #0073bb; text-decoration: none; cursor: pointer;">
													<img width="60px" height="60px" style="outline: none;border-radius: 4px;vertical-align: middle;" src="getImage/businessman.png">
												</a>
											</div>
										</div>
										<div class="restContent-review-highlights-media-story"
											style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
											<p class="restContent-quote" style="    margin-bottom: 4px;">
           										 “My friend ordered the <a href="#" style="font-weight: bold;color: #0073bb;text-decoration: none;"></a>
           										  toast and he loved his so much he ordered a second.”
           										  <a href="#" style="ont-size: 14px;color: #666;white-space: nowrap;text-decoration: none;">in 143 reviews</a>
											</p>
											<p class="restContent-highlight-sub-info" style="color: #666;margin-bottom: 4px;">
												<a href="#" style="color: #0073bb; text-decoration: none;">$8 Blue Cheese Garlic Bread </a>
											</p>
										</div>
									</li>
									<li class="restContent-review-highlights-media-block" style="    margin-bottom: 18px;    position: relative;display: flex;text-align: -webkit-match-parent;">
										<div class="restContent-review-highlights-media-avatar"
											style="border-right: 12px solid transparent; border-left: none;">
											<div class="restcontent-review-highlights-photo-box">
												<a href="#"
													style="color: #0073bb; text-decoration: none; cursor: pointer;">
													<img width="60px" height="60px" style="outline: none;border-radius: 4px;vertical-align: middle;" src="getImage/businessman.png">
												</a>
											</div>
										</div>
										<div class="restContent-review-highlights-media-story"
											style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
											<p class="restContent-quote" style="    margin-bottom: 4px;">
           										 “My friend ordered the <a href="#" style="font-weight: bold;color: #0073bb;text-decoration: none;"></a>
           										  toast and he loved his so much he ordered a second.”
           										  <a href="#" style="ont-size: 14px;color: #666;white-space: nowrap;text-decoration: none;">in 143 reviews</a>
											</p>
											<p class="restContent-highlight-sub-info" style="color: #666;margin-bottom: 4px;">
												<a href="#" style="color: #0073bb; text-decoration: none;">$8 Blue Cheese Garlic Bread </a>
											</p>
										</div>
									</li>
									<li class="restContent-review-highlights-media-block" style="    margin-bottom: 18px;    position: relative;display: flex;text-align: -webkit-match-parent;">
										<div class="restContent-review-highlights-media-avatar"
											style="border-right: 12px solid transparent; border-left: none;">
											<div class="restcontent-review-highlights-photo-box">
												<a href="#"
													style="color: #0073bb; text-decoration: none; cursor: pointer;">
													<img width="60px" height="60px" style="outline: none;border-radius: 4px;vertical-align: middle;" src="getImage/businessman.png">
												</a>
											</div>
										</div>
										<div class="restContent-review-highlights-media-story"
											style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
											<p class="restContent-quote" style="    margin-bottom: 4px;">
           										 “My friend ordered the <a href="#" style="font-weight: bold;color: #0073bb;text-decoration: none;"></a>
           										  toast and he loved his so much he ordered a second.”
           										  <a href="#" style="ont-size: 14px;color: #666;white-space: nowrap;text-decoration: none;">in 143 reviews</a>
											</p>
											<p class="restContent-highlight-sub-info" style="color: #666;margin-bottom: 4px;">
												<a href="#" style="color: #0073bb; text-decoration: none;">$8 Blue Cheese Garlic Bread </a>
											</p>
										</div>
									</li>
								</ul>
								<div class="restContent-review-highlight-action" style="margin: -12px 0 24px;">
									<a href="#" class="show-more-url"style="color: #0073bb; text-decoration: none;">Show more review highlights</a>
								</div>
							</div>
						</div>
							<div>
								<div class="restContent-feed">
									<div class="restContent-feed-header">
										<div class="restContent-feed-section-header" style="margin-bottom: 0;border-bottom: 1px solid #e6e6e6;">
											<h2 style="word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important; font-weight: bold; margin-bottom: 6px; font-size: 21px; line-height: 1.28571em; color: #d32323; margin: 0 0 6px;">
												Recommended Reviews 
												<b style="font-weight: normal;color: #333;">for Fog Harbor Fish House</b>
											</h2>
											<div class="restContent-feed_filters" >
												<div class="restContent-section-header_block" style="margin: 0px !important;display:table;">
													<div class="restContent-arrange-middle" style="margin-bottom: 6px !important; display: table; min-width: 100%; table-layout: auto;">
														<div class="restContent-feed-search" style="  vertical-align: middle;width: 100%;    box-sizing: border-box;display: table-cell;">
															<div class="restContent-section-header-search" style="">
																<form class="restContent-form" name="restContent" style="margin-bottom: 0;display: table;min-width: 100%;table-layout: auto;" action="" method="post">
																<div class="restContent-arrange-unit" style="width: 100%;box-sizing: border-box;display: table-cell;vertical-align: top;">
																	<input type="text" placeholder="Search within the reviews" name="review_name" value="" autocomplete="on" style="margin: 0; display: block; box-sizing: border-box; width: 100%; padding: 5px 9px; background: #fff; border: 1px solid #999; border-radius: 3px; font-size: 14px; line-height: 1.29em; color: inherit; font: inherit; font-weight: normal;">
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
												</div>
											</div>
										</div>
									</div>
									<div class="restContent-review-list" style="position: relative;">
										<ul class="restContent-reviews" style="list-style: none;    display: inline-block;">
											<li style="margin: 0;padding: 18px 0;border-bottom: 1px solid #e6e6e6;padding-bottom: 17px;    display: list-item;text-align: -webkit-match-parent;">
												<div class="restContent-review-widget" style="width:100%;overflow:hidden;height:auto;">
													<div class="restContent-user" style="float: left;padding: 0 15px;min-height: 1px;    box-sizing: border-box;width: 37.5%;">
														<div class="restContent-user-content" style="margin-top: -3px;">
															<img src="https://s3-media4.fl.yelpcdn.com/assets/2/www/img/b5b7ea174ecb/writeareview/empty_profile.png" srcset="https://s3-media2.fl.yelpcdn.com/assets/2/www/img/0a027d2e0fcf/writeareview/empty_profile@2x.png 2x" width="148" height="68">
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
																<ul class="restContent-star-selector"
																	style="float: left; height: 30px; width: 162px; background-position: 0 -0; background: url(https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/a5aa4dca29f3/assets/img/stars/selector_stars.png) no-repeat; background-size: 162px 180px; display: inline-block; vertical-align: middle; list-style: none;">
																	<li class="restContent-star-selector-show-tooltip"
																		style="margin-right: 3px; float: left; height: 30px; width: 30px; margin: 0; padding: 0; position: relative;display: list-item;text-align: -webkit-match-parent;">
																			<input class="restContent-star-selector_input"
																		id="rating-1" name="rating" type="radio" value="1"
																		style="cursor: pointer; border: none; margin: 0; padding: 0; width: 30px; height: 30px; opacity: 0; color: inherit; font: inherit; font-weight: normal; box-sizing: border-box; background-color: initial; -webkit-rtl-ordering: logical; text-rendering: auto; letter-spacing: normal; word-spacing: normal; text-transform: none; text-indent: 0px; text-shadow: none; display: inline-block; text-align: start;">
																		<label class="restContent-star-selector_label" for="rating-1" style="display: none;cursor: default;">1 (Eek! Methinks not.)</label>
																		<span class="restContent-tooltip-wrapper"
																		style="position: absolute; left: -9999px; bottom: 100%; width: 250px; margin-left: -125px; margin-bottom: 5px; text-align: center; text-decoration: none;">
																			<span class="restContent-tooltip"
																			style="z-index: 1012; display: inline-block; position: relative; padding: 6px 9px; vertical-align: middle; white-space: normal; font-size: 12px; pointer-events: none; font-weight: bold; line-height: 18px; background: rgba(0, 0, 0, 0.8); color: white; border-radius: 5px; text-shadow: none; text-align: left; cursor: default; box-shadow: 0 1px rgba(255, 255, 255, 0.1);">
																			Eek!Methinks not.</span>
																	</span>
																	</li>
																</ul>
															</fieldset>
														</div>
														<a class="restContent-text-link" href="#" style="color: #0073bb;text-decoration: none;    cursor: pointer;    text-align: center !important;">
										                    Start your review of <strong style="font-weight: bold;">Brenda's French Soul Food</strong>.
										                </a>
														</div>
													</div>
												</div>
												</div>
											</li>
									<li style="margin: 0; padding: 18px 0; border-bottom: 1px solid #e6e6e6; padding-bottom: 17px; display: list-item; text-align: -webkit-match-parent;">
										<div class="restContent-review-with" style="    width: 100%; overflow: hidden;height: auto;">
											<div class="restContent-user" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 37.5%;">
												<div class="restContent-user-content" style="margin-top: -3px;">
													<div class="restContent-meida-block" style="font-size: 12px; line-height: 1.5em; position: relative; display: flex;">
														<div class="restContent-media-avatar" style="border-right-width: 9px;border-right: 6px solid transparent;border-left: none;">
															<div class="restContent-photo-box">
																<a href="#" style="color: #0073bb;text-decoration: none;">
																	<img alt="Meghan A." class="restContent-photo-box-img" height="60" src="https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/60s.jpg" srcset="https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/90s.jpg 1.50x,https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/168s.jpg 2.80x,https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/ms.jpg 1.67x,https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/180s.jpg 3.00x,https://s3-media2.fl.yelpcdn.com/photo/AiuQa6ZjRBfpPVSQGOinIw/120s.jpg 2.00x" width="60">
																</a>
															</div>
														</div>
														<div class="restContent-media-story" style="-webkit-box-flex: 1; flex: 1; min-width: 0; min-height: 0;">
															<ul class="restContent-user-info" style="list-style: none; -webkit-margin-before: 0px; -webkit-margin-after: 0px; display: block; -webkit-margin-start: 0px; -webkit-margin-end: 0px;">
																<li class="restContent-user-name" style="display: list-item; text-align: -webkit-match-parent;">
																	<a href="#" class="restContent-user-display-name" style="font-size: 14px; line-height: 1.28571em; font-weight: bold; color: #0073bb; text-decoration: none; cursor: pointer;">
																		Meghan A.
																	</a>
																</li>
																<li class="restContnet-user-location">
																	<b style="font-weight: bold;">Phoenix, AZ</b>
																</li>
															</ul>
															<ul class="restContent-user-stats" style="list-style: none;display: block;">
																<li class="restContent-friend" style="color: #666;display: list-item;text-align: -webkit-match-parent;">
																	<span aria-hidden="true" style="fill: #f15c00; width: 18px; height: 18px;" class="icon icon--18-friends icon--size-18">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_friends">
																	        	<svg id="18x18_friends" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<g>
																	        			<path d="M7.904 9.43l-2.098 4.697a.9.9 0 0 1-1.612 0L2.096 9.43a.902.902 0 0 1 .806-1.305h4.196c.67 0 1.105.705.806 1.305zM5 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"></path>
																	        			<path d="M15.904 9.43l-2.098 4.697a.89.89 0 0 1-.806.498.89.89 0 0 1-.806-.498L10.096 9.43a.902.902 0 0 1 .806-1.305h4.195c.67 0 1.106.705.807 1.305zM13 7.375a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" opacity=".502"></path>
																	        		</g>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																	<b style="font-weight: bold;">8</b> friends
																</li>
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
																	<b style="font-weight: bold;">19</b>reviews
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
																	<b style="font-weight: bold;">15</b> photos
																</li>
															</ul>
														</div>
													</div>
													<ul class="restContent-list-link" style="transition: opacity 0.3s ease-in-out; font-size: 12px; line-height: 1.5em; margin-top: 6px; font-weight: bold; list-style: none; display: block;">
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-share icon--size-18 icon--currentColor">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_share">
																	        	<svg id="18x18_share" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<path d="M17.714 6.43L13 10.356v-3.03c-1 0-5.097 1.47-6.286 3.62.274-3.08 4.286-5.5 6.286-5.5V2.5l4.714 3.93zM3 4v10h11v-2.5l1-1V15H2V3h8.5l-1 1H3z"></path>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Share review
																</div>
														</a>
														</li>
														

														
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true"
																		style="width: 18px; height: 18px;"
																		class="icon icon--18-embed icon--size-18 icon--currentColor">
																		<svg class="icon_svg">
														       				 <use
																				xmlns:xlink="http://www.w3.org/1999/xlink"
																				xlink:href="#18x18_embed">
														       				 	<svg id="18x18_embed" height="100%"
																				viewBox="0 0 18 18" width="100%">
														       				 		<path
																					d="M12.503 13.76a.717.717 0 0 1-.526.23.717.717 0 0 1-.526-.23.822.822 0 0 1 0-1.117l3.444-3.652-3.444-3.65a.822.822 0 0 1 0-1.116.714.714 0 0 1 1.053 0l4.495 4.77-4.495 4.767zm-5.954 0a.717.717 0 0 1-.528.23.718.718 0 0 1-.526-.23L1.002 8.99l4.495-4.768a.714.714 0 0 1 1.052 0c.29.308.29.808 0 1.116L3.105 8.99l3.442 3.653c.29.308.29.808 0 1.116z"></path>
														       				 	</svg>
														       				 </use>
														    			</svg>
																	</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Embed review
																</div>
														</a>
														</li>
														
														
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-compliment icon--size-18 icon--currentColor">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_compliment">
																	        	<svg id="18x18_compliment" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<path d="M14.5 6.75a5.5 5.5 0 0 0-11 0 5.495 5.495 0 0 0 2.993 4.892L5.5 16.75l3.505-2 3.495 2-.993-5.108A5.495 5.495 0 0 0 14.5 6.75zm-5.5 4c-2.206 0-4-1.794-4-4s1.794-4 4-4 4 1.794 4 4-1.794 4-4 4z"></path>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Compliment
																</div>
														</a>
														</li>
														
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-speech icon--size-18 icon--currentColor">
																    <svg class="icon_svg">
																        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_speech">
																        	<svg id="18x18_speech" height="100%" viewBox="0 0 18 18" width="100%">
																        		<path d="M2 4v6a2 2 0 0 0 2 2h1v3l4-3h5a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"></path>
																        	</svg>
																        </use>
																    </svg>
																</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Send message
																</div>
														</a>
														</li>
														
														<li>
															<a class="restContent-share-review" href="#" style="display: table; min-width: 100%; table-layout: auto; color: #0073bb; text-decoration: none; cursor: pointer;">
																<div class="action-link_icon arrange_unit" style="padding-top: 3px; padding-bottom: 3px; vertical-align: middle; padding-right: 12px; box-sizing: border-box; display: table-cell;">
																	<span aria-hidden="true" style="width: 18px; height: 18px;" class="icon icon--18-following icon--size-18 icon--currentColor">
																	    <svg class="icon_svg">
																	        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#18x18_following">
																	        	<svg id="18x18_following" height="100%" viewBox="0 0 18 18" width="100%">
																	        		<path d="M16 13l-4 3v-2H9l1-2h2v-2l4 3zm-8.925 2.383c-.443.817-1.707.817-2.15 0L2.128 9.605C1.728 8.868 2.31 8 3.203 8h5.594c.893 0 1.474.868 1.075 1.605l-2.797 5.778zM6 7a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"></path>
																	        	</svg>
																	        </use>
																	    </svg>
																	</span>
																</div>
																<div class="action-link_label arrange_unit arrange_unit--fill" style="border-top: 1px solid #e6e6e6; padding-top: 3px; padding-bottom: 3px; vertical-align: middle; width: 100%;">
            														Follow Lauramay N.
																</div>
														</a>
														</li>
													</ul>
												</div>
											</div>
											<div class="restContent-review-wrapper" style="float: left; padding: 0 15px; min-height: 1px; box-sizing: border-box; width: 62.5%;">
												<div class="restContent-review-content" style="padding: 0 12px 6px 0; min-height: 156px; word-wrap: break-word !important; word-break: break-word !important; overflow-wrap: break-word !important;">
													<div class="restContent-review-rating" style="margin: 6px 0;width:100%;overflow:hidden;height:auto;">
														<div>
															<div class="i-stars i-stars--regular-5 rating-large" title="5.0 star rating"
															style="float: left; margin: -1px 6px 0 0; position: relative; overflow: hidden; width: 102px; height: 18px; background-position: 0 -402px; background: url(https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png) no-repeat; background-size: 132px 560px; display: inline-block; vertical-align: middle;">
																<img class="offscreen" height="303"
																	src="https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_design_web/9b34e39ccbeb/assets/img/stars/stars.png"
																	width="102" alt="5.0 star rating"
																	style="clip: rect(0, 0, 0, 0); position: absolute; left: -9999px; top: auto; overflow: hidden; width: 1px; height: 1px; vertical-align: middle;">
															
															</div>
														</div>
														<span class="restContent-rating-qualifier" style="display: block; float: left; color: #666; font-weight: normal;">
      															  12/13/2017
															</span>
													</div>
															<p lang="en" style="margin-bottom: 12px;">
															I was a bit worried since some people said this place was a tourist trap on here, but it turned out to be wonderful! <br><br>
															The boy and I came here for an anniversary dinner since we were craving seafood. We made a reservation a few days in advance,
															 hoping and requesting a nice seat. We came 20 minutes early, and we were seated just in time! Next to a window with a view of the bay too!
															  Someone had also wrote "Happy Anniversary!" on our table. :) <br><br>
															  For starters, we ordered the clam chowder and fried scallops. I ordered the shellfish platter for one with a lobster tail for my entree, and the boy ordered the surf and turf.
															   Everything was perfect! You could tell the seafood was fresh and the boy was also happy with the quality and cooking of the steak.
															    We loved everything that we ordered, and also enjoyed a yummy creme brûlée. <br><br>
															    We were in awe of the meal we had. Not to mention, the sour dough was the best we ever had! We couldn't stop raving about it.
															     We also have to thank our server Justin H. for being so awesome and kind. We asked to take our leftover bread to go, and he came back with more fresh sour dough to take home!
															</p>
												</div><!--리뷰 내용 -->
												
												<div class="restContent-review-button" >
												
												</div><!-- 좋아요 -->
												<div class="restContent-review-reply" style="margin-top: 18px; padding: 11px; background: #f5f5f5; border: 1px solid #e6e6e6; border-radius: 4px;">
													
													
													
												</div><!-- 사장 답변 -->
											</div>
										</div>
									</li>
								</ul>
									</div>
								</div>
							</div>
					</div>
				<div class="restContent-beta" style="padding: 0 30px 0 0; margin-right: -15px; float: left; min-height: 1px; box-sizing: border-box; width: 33.33333%;height:auto; box-shadow:-1px 0 0 #e6e6e6;display:inline-block;">
					<div class="restContent-open-rail clearfix" style=" margin-left: -1px;padding-left: 1px;background: #fff;width:300px;height:210px;">
						<div class="restContent-summary" style="padding: 3px 11px 3px 6px;margin-bottom: 18px;background: #f5f5f5;border: 1px solid #e6e6e6;border-radius: 4px;width:280px;height:185px;">
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
							            <b style="font-weight: bold;"><a style="color: #0073bb;text-decoration: none;" class="menu-explore js-menu-explore" href="/menu/fog-harbor-fish-house-san-francisco-2/dinner-menu">Full menu</a></b>
							        </div>
							    </li>
							    <li class="restContent-iconed-list-item" style="display: table;width: 100%;margin-bottom: 0;">
						            <div class="restContent-iconed-list-avatar" style="float: none;display: table-cell;vertical-align: middle;min-width: 34px;margin: 0;padding-right: 9px;text-align: center;">
						       		 	<span class="restContent-business-attribute price-range" data-remainder="￦￦" style="font-size: 13px;line-height: 1.38462em;font-weight: bold;color: #41a700;">￦￦</span>
						            </div>
						            <div class="restContent-iconed-list-story" style="display: table-cell;width: 100%;padding: 9px 0;padding-bottom: 8px;    border-bottom: 1px solid #e6e6e6;">
						                <dl class="restContent-short-def-list" style="display: block;">
						                    <dt class="restContent-attribute-key" style="margin-right: 0.25em;display: inline;">Price range</dt>
						                    <dd class="restContent-nowrap price-description" style="font-weight: bold;display: inline;white-space: nowrap;">
						                        ￦11-30
						                    </dd>
						                </dl>
						            </div>
						        </li>
						        <li class="restContent-iconed-list-item health-score" style="display: table; width: 100%;margin-bottom: 0;">
									<div class="restContent-iconed-list-avatar" style="float: none; display: table-cell; vertical-align: middle; min-width: 34px; margin: 0; padding-right: 9px; text-align: center;">
										<div class="restContent-temscore-block"style="font-size: 12px; font-weight: bold; padding: 1px 5px 2px; display: inline-block; background: #fff; border: 1px solid #ccc;">87</div>
									</div>
									<div class="restContent-iconed-list-story" style="border-bottom: none; display: table-cell; width: 100%; padding: 9px 0; padding-bottom: 8px;">
										<div class="restContent-iconed-list-story-health-score-info">
											<dl class="restContent-iconed-list-story-short-def-list" style="display: block;">
												<dt class="restContent-iconed-list-story-attribute-key" style="margin-right: 0.25em;    display: inline;">
													<b style="font-weight: bold;font-size:14px;"><a href="#" style="color: #0073bb;text-decoration: none;">Health inspection</a></b>
												</dt>
												<dd class="restContent-nowrap health-score-description" style="font-weight: bold;display: inline; white-space: nowrap;">
													87 out of 100</dd>
											</dl>
										</div>
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
											<span style="white-space: nowrap;">${getRest.mon }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											화요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.tue }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											수요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.wed }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											목요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.thu }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											금요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.fri }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											토요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.sat }</span>
										</td>
										<td class="extra" style="border-top: 0; max-width: 70px; padding-right: 6px; font-size: 12px; font-weight: bold; color: #41a700; padding: 0 1em 0 0; border: none; vertical-align: baseline; text-align: left; display: table-cell;"></td>
									</tr>
									<tr style="display: table-row;">
										<th scope="row" style="border-top: 0; min-width: 36px; padding-right: 18px; padding: 0 1em 0 0; border: none; vertical-align: baseline; font-weight: bold; text-align: left; display: table-cell;">
											일요일
										</th>
										<td style="border-top: 0; padding-right: 6px; padding: 0 1em 0 0; border: none; vertical-align: baseline; display: table-cell;">
											<span style="white-space: nowrap;">${getRest.sun }</span>
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
	</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>

















