<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<%@include file="../top.jsp" %>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/restStyle.css?ver=1"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/bootstrap.min.css?ver=1"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/bootstrap.min.css?ver=1"/>"/>
<script type="text/javascript">
function today1(){
	var day=new Array("mon","tue","wed","thu","fri","sat","sun");
	var d = new Date();
	var day2=d.getDay();
}
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
<body>
	<div class="main">
		<div class="top-shelf" style="width:100%;height:480px;position:relative;padding:15px 0px 15px 0px;">
			<div class="content-container" style="width:960px;height:450px;margin:0 auto;padding:0 15px;">
				<div class="biz-page-header clearfix" style="width:100%;height:120px;margin-bottom:13px;display:block;">
					<div class="left" style="width:520px;height:120px;padding-right:30px;display:inline-block;float:left;">
						<div style="width:490px;height:36px;">
							<h1 style="font-weight: bold;font-size: 30px;">${getRest.rname }</h1>
						</div>
						<div class="biz-main-info embossed-text-white" style="width:490px;height:24px;margin-top:9px;">
							<div class="rating-info clearfix" style="width:490px;height:24px;margin-bottom:9px;">
								<div class="biz-rating biz-rating-very-large clearfix" style="width:260px;height:24px;">
									<div class="i-stars i-stars--large-4 rating-very-large" style="width:112px;height:24px;margin-right:6px;display:inline-block">
										<span class="fa fa-star checked"></span> 
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
									<span class="review-count rating-qualifier">3705 reviews</span>

								</div>
							</div>
							<div class="price-category" style="width:202px;height:22px;">
								<span class="business-attribute price-range">￦￦￦</span>
								<span class="category-str-list" style="margin-right:6px;">
								<c:forEach var="dto" items="res">
									<a href="#">${getRest.foodstyle}</a>
								</c:forEach>
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
				<div class="biz-page-subheader" style="width:100%;height:350px;">
					<div class="mapbox-container" style="width:33.3%;height:330px;display:inline-block;float:left;">
						<div class="mapbox" style="width:300px;height:330px;padding:5px;background: #fff;border: 1px solid #ccc;">
							<div class="mapbox-map" id="map" style="width:290px;height:135px;border: 1px solid #ccc;">
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
										<div class="map-box-address" style="width:264px;height:90px;margin-left:24px;">
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
					<div class="showcase-container" style="width:630px;height:336px;display: table-cell;vertical-align: middle;">
						<div class="showcase-container_inner" style="position: relative;width: 620px;height: 220px;">
							<div class="top-shelf-grey">
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="width:100%;height:3000px;">
		
		</div>
	</div>

</body>
</html>
<%@include file="../bottom.jsp" %>

















