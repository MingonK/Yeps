<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../top.jsp" %>

<!doctype html>
<html>
<head>
<style>
.checked {
    color: red;
}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=jD9qGVpvZh7Zobclojwp&submodules=geocoder"></script>
 <link rel="stylesheet" href="resources/styles/bootstrap.min.css">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div id="main">
		<div class="header" style="width: 100%; height: 160px"></div>
		<div class="container"
			style="width: 1700px; height: 3050px; position: relative">
			<div class="column-alpha"
				style="width: 70%; height: 100%; display: inline-block; float: left">
				<ul>
					<c:forEach var="dto" items="${map.list}">
						<li style="width: 630px; height: 190px;">
							<div class="biz-listing-large"
								style="width: 660px; height: 90px; position: relative;">
								<div class="main-attribute"
									style="width: 420px; height: 90px; display: inline-block; float: left;">
									<div class="midea-block"
										style="width: 390px; height: 90px; position:" relative>
										<div class="midea-avata"
											style="width: 100px; height: 90px; display: inline-block;">
											<div class="photo-box"
												style="width: 90px; height: 90px; float: left;">
												<c:if test="${!empty dto.filename }">
													<img width="90px" height="90px"
														src="getImage/${dto.filename }">
												</c:if>
												<c:if test="${dto.filename==null}">
													<img width="90px" height="90px" src="getImage/x.png">
												</c:if>
											</div>
										</div>
										<div class="midea-story"
											style="width: 280px; height: 90px; display: inline-block; float: right;">
											<h3>
												<a href="restaurant_content?rnum=${dto.rnum }">${dto.rname }</a>
											</h3>
											<div class="rating" style="width: 280px; height: 17px">
												<div class="star"
													style="width: 120px; height: 18px; display: inline-block">
													<!-- 															<img width="102px" height="17px" src="getImage/star.png"> -->
													<span class="fa fa-star checked"></span> <span
														class="fa fa-star checked"></span> <span
														class="fa fa-star"></span> <span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</div>
												<span class="review-count rating-qualifier">1201
													reviews</span>
											</div>
											<div class="price-category"
												style="width: 280px; height: 19px">
												<span class="business-attribute price-range">￦￦￦</span> <span
													class="category-str-list">${dto.foodstyle}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="second-attribute"
									style="width: 350px; height: 90px; display: inline-block; position: absolute">
									<span class="address">${dto.roadAddrPart1}</span><br> <span
										class="address">${dto.addrDetail }</span><br> <span
										class="address">${dto.roadAddrPart2 }</span><br> <span
										class="hp">${dto.raddress}-${dto.hp2}-${dto.hp3 }</span>
								</div>
							</div>
							<div class="search-avatar-offset snippet-block media-block"
								style="width: 660px; height: 36px;">
								<div class="media-avatar"
									style="width: 70px; height: 50px; float: left; padding-right: 10px">
									<img width="50px" height="50px"
										src="getImage/1ebe8dfc-4d12-43bd-8236-305dd6333db7.jpg">
								</div>
								<div class="media-story"
									style="width: 650px; height: 36px; margin-top: 10px">
									<p>좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요 좋아요</p>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="column-beta"
				style="width: 30%; height: 100%; display: block; float: left">
				<div id="map" style="width: 400px; height: 400px"></div>
				<script>
	  var map = new naver.maps.Map('map',{
  	  zoom:8
    });
	  var markers = [],infoWindows = [];
	   var j=0;
	   var k=1;
	   var rname=new Array();
	   var rnum=new Array();
	   var foodstyle=new Array();
	   var roadAddrPart1=new Array();
	   var addrDetail=new Array();
	   var roadAddrPart2=new Array();
	   var hp=new Array();
	  	 <c:forEach items="${map.list}" var="item">
	   	
		rname.push("${item.rname}");
		rnum.push("${item.rnum}");
		foodstyle.push("${item.foodstyle}");
		roadAddrPart1.push("${item.roadAddrPart1}");
		addrDetail.push("${item.addrDetail}");
		roadAddrPart2.push("${item.roadAddrPart2}");
		hp.push("${item.raddress}" + "-" + "${item.hp2}" + "-" + "${item.hp3}")
		</c:forEach>

		for (var i = 0; i < roadAddrPart1.length; i++) {
			naver.maps.Service
					.geocode(
							{
								address : roadAddrPart1[i]
							},
							function(status, response) {
								var result = response.result;
								var myaddr = new naver.maps.Point(
										result.items[0].point.x,
										result.items[0].point.y);
								map.setCenter(myaddr); // 검색된 좌표로 지도 이동
								// 마커 표시
								var marker = new naver.maps.Marker({
									position : myaddr,
									map : map,
									icon : {
										url : './getImage/pin_s_' + (j + 1)
												+ '.png',
										size : new naver.maps.Size(22, 30),
										anchor : new naver.maps.Point(11, 30)
									}
								});

								iwContent = [
									'<div class="main" style="width:350px;height:170px">',
										'<div class="left" style="width:200px;height:170px;padding:12px">',
										'<div class="rname" style="width:210px;height:20px">',
											'<span><a href="restaurant_content?rnum='+rnum[j]+'">'+rname[j]+'</a></span>',
										'</div>',
										'<div class="rating" style="width:">',
											'<span class="fa fa-star checked"></span>',
											'<span class="fa fa-star checked"></span>',
											'<span class="fa fa-star"></span>',
											'<span class="fa fa-star"></span>',
											'<span class="fa fa-star"></span>',
											'<span class="review">리뷰</span>',
										'</div>',
										'<div class="price-range">',
											'<span>￦￦￦</span><span>●</span><span class="foodstyle">'+foodstyle[j]+'</span>',
										'</div>',
										'<div class="address">',
										'<span>'+roadAddrPart1[j]+'</span>',
										'<span>'+addrDetail[j]+'</span>',
										'<span>'+roadAddrPart2[j]+'</span>',
										'</div>',
									'</div>'
									].join('')
								var infowindow = new naver.maps.InfoWindow({
									content : iwContent
								});
								markers.push(marker)
								infoWindows.push(infowindow);

								function getClickHandler(seq) {
									return function(e) {
										var marker = markers[seq], infoWindow = infoWindows[seq];

										if (infoWindow.getMap()) {
											infoWindow.close();
										} else {
											infoWindow.open(map, marker);
										}
									}
								}
								naver.maps.Event.addListener(markers[j],
										'click', getClickHandler(j));
								j++
							});
		};
			</script>
			</div>
		</div>
	</div>
	<script>
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="restaurant_list?curPage="+page;
    }
</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>
<%@ include file="../bottom.jsp" %>



